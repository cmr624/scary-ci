using System.Collections.Generic;
using Unity.FPS.Game;
using UnityEngine;
using Winch.Boids;


public class BatCluster : MonoBehaviour
{
    [SerializeField]
    private int m_numBoids;
    [SerializeField]
    private Vector3 m_minPosition;
    [SerializeField]
    private Vector3 m_maxPosition;
    [SerializeField]
    private float m_minStartingSpeed;
    [SerializeField]
    private float m_maxStartingSpeed;
    [SerializeField]
    private BoidCluster m_cluster;
    [SerializeField]
    private Transform m_target;
    [SerializeField]
    private float m_detectRange = 10f;
    [SerializeField]
    private GameObject m_boidPrefab;

    private bool m_targetFound;
    private Dictionary<Boid, GameObject> m_boidObjects = new();

    private void Start()
    {
        m_cluster.Target = null;

        for(int i = 0; i < m_numBoids; i++)
        {
            Boid boid = m_cluster.Add(RandomPosition(), RandomVelocity());

            GameObject boidObject = Instantiate(m_boidPrefab, transform);
            boid.Position.Subscribe(position => boidObject.transform.localPosition = position);
            boid.Velocity.Subscribe(velocity => boidObject.transform.forward = velocity.normalized);

            m_boidObjects[boid] = boidObject;

            boidObject.GetComponent<Health>().OnDie += () =>
            {
                //If you shoot a bat, the cluster will start to chase you
                FindTarget();

                RemoveBoid(boid);
            };
        }
    }

    private void Update()
    {
        if (m_targetFound)
        {
            return;
        }

        foreach(Boid boid in m_boidObjects.Keys)
        {
            Vector3 worldBoidPos = m_cluster.transform.TransformPoint(boid.Position.Value);
            float distanceToTarget = Vector3.Distance(worldBoidPos, m_target.position);

            if (distanceToTarget < m_detectRange)
            {
                FindTarget();
            }
        }
    }

    private void FindTarget()
    {
        if (m_targetFound)
        {
            return;
        }

        m_targetFound = true;

        foreach (GameObject boidObject in m_boidObjects.Values)
        {
            m_cluster.Target = m_target;
            boidObject.GetComponent<BatDamageArea>().Target = m_target.GetComponentInParent<Damageable>();
        }
    }

    private void RemoveBoid(Boid boid)
    {
        m_cluster.Remove(boid);

        //EW 04-10-23:
        //More elegant death animation goes here
        Destroy(m_boidObjects[boid]);

        m_boidObjects.Remove(boid);
    }

    private Vector3 RandomPosition()
    {
        return new()
        {
            x = Mathf.Lerp(m_minPosition.x, m_maxPosition.x, Random.value),
            y = Mathf.Lerp(m_minPosition.y, m_maxPosition.y, Random.value),
            z = Mathf.Lerp(m_minPosition.z, m_maxPosition.z, Random.value),
        };
    }

    private Vector3 RandomVelocity()
    {
        float speed = Mathf.Lerp(m_minStartingSpeed, m_maxStartingSpeed, Random.value);
        return speed * Random.insideUnitSphere;
    }
}
