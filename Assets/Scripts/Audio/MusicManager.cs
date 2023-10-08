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
        
        [SerializeField] private Proximity _proximityValue = Proximity.Far;
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
                [Proximity.Close] = 100,
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

        public void SetProximityValue(Proximity proximityValue)
        {
            _proximityValue = proximityValue;
            _music.setParameterByName(ParameterProximity, _proximityParameterMap[proximityValue]);
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