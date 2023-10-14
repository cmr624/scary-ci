using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace ScaryJam.Audio
{
    public class FMODProximityDispatch : MonoBehaviour
    {
        [Tooltip("The tag to test for in gameobjects that enter the trigger zone (non-tagged objects will be filtered out)")]
        [SerializeField] private string _filterTag = "Enemy";

        [Tooltip("How frequently, in seconds, a distance check is done to enemies within the trigger volume")]
        [SerializeField] private float _dispatchInterval = 0.8f;

        [Tooltip("In the event that a player is near dozens of entities, place a cap on the quantity included in distance check")]
        [SerializeField] private int _maxTransformsCount = 10; 
        
        /*
        [SerializeField] private UnityEvent OnEnemyEnteredTrigger;
        [SerializeField] private UnityEvent OnEnemyExitedTrigger;
        */

        /*// prevent double trigger
        // (if a detected object has multiple colliders,
        // they will share the same transform)
        private HashSet<Transform> _currentTransforms;*/

        private float _lastDispatchTime;
        
        // to avoid reallocating per frame, 
        // reuse the same collider array across 
        // distance checks 
        private Collider[] _colliders; 

        private void Awake()
        {
            // _currentTransforms = new HashSet<Transform>();
            _lastDispatchTime = Time.time;
            _colliders = new Collider[_maxTransformsCount]; 
        }

        private void Update()
        {
            if (Time.time - _lastDispatchTime > _dispatchInterval) return;
            _lastDispatchTime = Time.time;
            
            float maxDist = MusicManager.Instance.FarthestEnemyDistance; 
           
            // of the enemies in the volume, find the distance to the closest one
            // (we don't need to keep reference to the actual enemy, only distance)
            // we do this without trigger colliders because the FPS template 
            // doesn't use rigidbodies on its enemies, so triggers won't fire
            float closestDist = maxDist * maxDist;
            
            // TODO: include layermask filtering?
            int overlapCount = Physics.OverlapSphereNonAlloc(transform.position, maxDist, _colliders);

            int nonRelevantColliders = 0; 
            
            for (int i = 0; i < overlapCount; i++)
            {
                var c = _colliders[i];
                if (!c.gameObject.CompareTag(_filterTag))
                {
                    nonRelevantColliders++; 
                    continue;
                }
                
                // Debug.Log($"obj: {c.gameObject.name}");
                
                Vector3 diff = transform.position - c.transform.position;
                closestDist = Mathf.Min(closestDist, diff.sqrMagnitude); 
            }

            // if no relevant objects were in range, dispatch a massively large distance
            if (nonRelevantColliders == overlapCount)
            {
                MusicManager.Instance.SetEnemyProximityFromDistance(float.MaxValue);
            }
            else
            {
                float finalDist = Mathf.Sqrt(closestDist);
                MusicManager.Instance.SetEnemyProximityFromDistance(finalDist);    
            }
        }

        /*private void OnTriggerEnter(Collider other)
        {
            Debug.Log("hello");
            if (_currentTransforms.Count >= _maxTransformsCount) return; 
            if (_currentTransforms.Contains(other.transform)) return; 
            
            Debug.Log(other.gameObject.name);
            
            if (!other.gameObject.CompareTag(_filterTag)) return;      
            
            _currentTransforms.Add(other.transform);
            OnEnemyEnteredTrigger?.Invoke();
        }

        private void OnTriggerExit(Collider other)
        {
            if (!_currentTransforms.Contains(other.transform)) return; 
            
            _currentTransforms.Remove(other.transform);
            OnEnemyExitedTrigger?.Invoke();
        }*/
    }
}