using System;
using UnityEngine;
using System.Collections.Generic;
using FMODUnity;

namespace ScaryJam.Audio
{
    public class SfxAudioEventDriver : MonoBehaviour
    {
        // (naive) singleton pattern
        private static SfxAudioEventDriver Instance { get; set; }
        
        [SerializeField] private SfxAudioClipMap _sfxMapFile;
        
        private FMODUnity.StudioListener _audioListener;

        public static FMODUnity.StudioListener Listener => Instance._audioListener;

        // List of Banks to load
        [FMODUnity.BankRef]
        public List<string> Banks = new List<string>();

        bool CheckAreBanksLoaded()
        {
            if (FMODUnity.RuntimeManager.HaveAllBanksLoaded) return true;
            
            // Iterate all the Studio Banks and start them loading in the background
            // including the audio sample data
            foreach (var bank in Banks)
            {
                FMODUnity.RuntimeManager.LoadBank(bank, true);
            }

            return false; 
        }
        
        private void Awake()
        {
            // prioritize the most recently-created instance
            // (i.e. the one corresponding to the most recently loaded-in scene)
            if (Instance != null && Instance != this)
            {
                Destroy(Instance);
            }
            
            Instance = this;

            _sfxMapFile.RefreshMap();
            
            CheckAreBanksLoaded(); // should be handled by preloader
        }

        private void Start()
        {
            // TODO: generally bad practice to do a brute-force lookup; 
            // should this be inspector-assigned?
            _audioListener = FindObjectOfType<FMODUnity.StudioListener>(); 
        }
        
        // users should trigger clip playback through the static wrapper, 
        // not an instance method
        public static void PlayClip(string action, GameObject sourceObject = null)
        {
            Instance.FireSfxEventFromString(action, sourceObject);
        }

        public static void PlayClip(EventReference eventReference, GameObject sourceObject = null)
        {
            Instance.FireSfxEventFromReference(eventReference, sourceObject);
        }
        
        private void FireSfxEventFromString(string action, GameObject sourceObject = null)
        {
            if (_sfxMapFile.Map == null)
            {
                _sfxMapFile.RefreshMap();
            }

            if (!_sfxMapFile.Map.ContainsKey(action))
            {
                Debug.LogError("Clip playback failed: clip name not found");
                return;
            }

            FMOD.GUID guid = _sfxMapFile.Map[action].Guid;

            FireSfxEventFromGuid(guid, sourceObject);
        }
        
        private void FireSfxEventFromReference(EventReference eventReference, GameObject sourceObject = null)
        {
            FireSfxEventFromGuid(eventReference.Guid, sourceObject);
        }

        private void FireSfxEventFromGuid(FMOD.GUID guid, GameObject sourceObject = null)
        {
            try
            {
                FMODUnity.RuntimeManager.PlayOneShotAttached(guid, sourceObject ? sourceObject : _audioListener.gameObject);
            }
            catch (Exception e)
            {
                if (_audioListener == null) Debug.LogWarning("no listener");
                Debug.LogError(e);
                Debug.LogError("couldn't play sfx; are banks loaded?");
            }
        }
    }
}
