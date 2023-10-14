using System;
using UnityEngine;
using FMOD.Studio;
using FMODUnity;
using System.Collections.Generic;
using STOP_MODE = FMOD.Studio.STOP_MODE;

namespace ScaryJam.Audio
{
    public class MusicManager : MonoBehaviour
    {
        /*public enum Tracks
        {
            SalsaUpbeat,
            SalsaLowVibe
        }*/

        public enum Proximity
        {
            Close, 
            Far
        }

        private const int MaxProximity = 100;

        [Tooltip("Enemies closer than this distance are considered at high proximity to the player (close)")]
        [SerializeField] private float _closestEnemyDistance = 3f;
        
        [Tooltip("Enemies farther than this distance are filtered out of proximity calculations (far)")]
        [SerializeField] private float _farthestEnemyDistance = 10;
        public float FarthestEnemyDistance => _farthestEnemyDistance; 
     
        /* Music Parameters
            
            Proximity-- varies 0 (enemy very far) to 100 (enemy very close)
         
         */

        /*[SerializeField] private bool _toggleMusicOn = true;
        [SerializeField] private bool _togglePercussionOn = true;
        [SerializeField] private bool _toggleRhythmSectionOn = true;
        [SerializeField] private bool _toggleMelodyOn = true;*/

        private const string ParameterProximity = "Proximity";
        
        /*private const string ParameterMusic = "MusicOnOff";
        private const string ParameterPercussion = "PercOnOff";
        private const string ParameterRhythmSection = "RhythmSectionOnOff";
        private const string ParameterMelody = "MelodyOnOff";
        private const string ParameterTrack = "What Music Plays";*/

        /*public void SetMusicOn(bool isActive)
        {
            _toggleMusicOn = isActive;
            _music.setParameterByName(ParameterMusic, isActive ? 1f : 0f);
        }
        
        public void SetPercussionOn(bool isActive)
        {
            _togglePercussionOn = isActive;
            _music.setParameterByName(ParameterPercussion, isActive ? 1f : 0f);
        }
        
        public void SetRhythmOn(bool isActive)
        {
            _toggleRhythmSectionOn = isActive;
            _music.setParameterByName(ParameterRhythmSection, isActive ? 1f : 0f);
        }
        
        public void SetMelodyOn(bool isActive)
        {
            _toggleMelodyOn = isActive;
            _music.setParameterByName(ParameterMelody, isActive ? 1f : 0f);
        }*/
        
        public static MusicManager Instance;

        private EventInstance _music;

        [SerializeField] private EventReference _musicReference;
        
        private int _proximityValue = 0;
        private Dictionary<Proximity, int> _proximityParameterMap;
        
        
        
        private void Awake()
        {
            #region singleton
            //Check if instance already exists
            if (Instance != null)
            {

                //if not, set instance to this
                Destroy(Instance.gameObject);
            }

            Instance = this; 
            
            
            /*//If instance already exists and it's not this:
            else if (Instance != this)
            {

                //Then destroy this. This enforces our singleton pattern, meaning there can only ever be one instance of a CameraManager.
                Destroy(gameObject);
                return;
            }*/
            
            //Sets this to not be destroyed when reloading scene
            DontDestroyOnLoad(gameObject);
            #endregion
            
            _music = FMODUnity.RuntimeManager.CreateInstance(_musicReference.Guid);
            
            /*_trackParameterMap = new Dictionary<Tracks, float>()
            {
                [Tracks.SalsaUpbeat] = 1.0f,
                [Tracks.SalsaLowVibe] = 2.0f
            };*/
            
            _proximityParameterMap = new Dictionary<Proximity, int>()
            {
                [Proximity.Close] = MaxProximity,
                [Proximity.Far] = 0
            };
        }

        private void Start()
        {
            _music.start();
            SetProximityValue(_proximityValue);
            
            // SetMusicTrack(_track);
        }

        /*public void SetMusicTrack(Tracks track)
        {
            _track = track;
            _music.setParameterByName(ParameterTrack, _trackParameterMap[track]);
        }*/

        public void SetEnemyProximityFromDistance(float distance)
        {
            // Debug.Log($"Raw enemy distance: {distance}");

            float clampedDist = Mathf.Max(distance - _closestEnemyDistance, 0f); 
            int dist = MapDistanceToProximity(clampedDist);
            SetProximityValue(dist);
        }

        private void SetProximityValue(int proximityValue)
        {
            Debug.Log($"New enemy proximity: {proximityValue}");
            _proximityValue = proximityValue;
            _music.setParameterByName(ParameterProximity, proximityValue);
        }

        private int MapDistanceToProximity(float distance)
        {
            // linear conversion
            // y = -mx + b
            float slope = -1f * MaxProximity / _farthestEnemyDistance;
            float proximity = slope * distance + MaxProximity;
            return (int)Mathf.Clamp(proximity, 0, MaxProximity); 
        }
        
        public void OnDestroy()
        {
            _music.stop(STOP_MODE.ALLOWFADEOUT);
            _music.release();
        }
        
#if UNITY_EDITOR
        private void OnValidate()
        {
            if (!Application.isPlaying) return;
            if (_proximityParameterMap == null) return; 
            
            SetProximityValue(_proximityValue);
            
            /*SetMusicTrack(_track);
            SetMelodyOn(_toggleMelodyOn);
            SetMusicOn(_toggleMusicOn);
            SetPercussionOn(_togglePercussionOn);
            SetRhythmOn(_toggleRhythmSectionOn);*/
        }
#endif
    }
}