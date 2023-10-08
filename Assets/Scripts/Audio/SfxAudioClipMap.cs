using UnityEngine;
using System.Collections.Generic;
using System;

namespace ScaryJam.Audio
{
    [CreateAssetMenu(fileName = "SfxMap", menuName = "ScaryJam/SFX event map", order = 1)]
    public class SfxAudioClipMap : ScriptableObject
    {
        [Serializable]
        public struct KeyValue
        {
            [SerializeField]
            public string Action;

            [SerializeField]
            public FMODUnity.EventReference SfxClip;
        }

        [SerializeField]
        List<KeyValue> _keyValues;

        Dictionary<string, FMODUnity.EventReference> _sfxMap;
        public Dictionary<string, FMODUnity.EventReference> Map => _sfxMap;
        
        public void RefreshMap()
        {
            _sfxMap = new Dictionary<string, FMODUnity.EventReference>();

            foreach (var kvp in _keyValues) {
                _sfxMap[kvp.Action] = kvp.SfxClip;
            }
        }
    }
}
