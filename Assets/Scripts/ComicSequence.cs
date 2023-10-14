using System.Collections.Generic;
using UnityEngine;

namespace ScaryJam.UI
{
    [CreateAssetMenu(fileName = "ComicSequence", menuName = "ScaryJam/ComicSequence", order = 0)]
    public class ComicSequence : ScriptableObject
    {
        [SerializeField] private List<Texture2D> _panelList;

        public List<Texture2D> PanelList => _panelList; 
    }
}