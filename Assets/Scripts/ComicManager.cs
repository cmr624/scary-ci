using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace ScaryJam.UI
{
    [RequireComponent(typeof(UIFade))]
    public class ComicManager : MonoBehaviour
    {
        [SerializeField] private ComicSequence _sequence;

        [SerializeField] private RawImage _imageTarget; 
        
        [Tooltip("the scene to load following the end of the comic sequence")]
        [SerializeField] private string _destinationScene; 
        
        private UIFade _imageFader;
        private AsyncOperation _sceneLoad;
        private bool _imageIsVisible = false;
        private Queue<Texture2D> _panelQueue;
        private IEnumerator _activeCoroutine; 

        private void Awake()
        {
            _imageFader = GetComponent<UIFade>();
            _panelQueue = new Queue<Texture2D>(_sequence.PanelList);
        }
        
        public void Start()
        {
            // Start an asynchronous operation to load the scene
            _sceneLoad = SceneManager.LoadSceneAsync(_destinationScene);
            _sceneLoad.allowSceneActivation = false; 
            
            // show first panel 
            DisplayNext();
        }

        public void DisplayNext()
        {
            if (_activeCoroutine != null) StopCoroutine(_activeCoroutine);
            _activeCoroutine = DisplayNextEnumerator();
            StartCoroutine(_activeCoroutine); 
        }

        private IEnumerator DisplayNextEnumerator()
        {
            if (_imageIsVisible)
            {
                // trigger fadeout of already-visible image
                _imageFader.DoFade(FadeType.FadeOut);

                while (_imageFader.IsFadeInProgress)
                {
                    yield return null; 
                }
            }

            if (_panelQueue.Count < 1)
            {
                // comic is over, enable next scene
                _sceneLoad.allowSceneActivation = true; 
                yield break;
            }
            
            _imageIsVisible = true;
            _imageTarget.texture = _panelQueue.Dequeue();
            _imageTarget.color = Color.white;
            _imageFader.SetImageAlphaZero();
            _imageFader.DoFade(FadeType.FadeIn);
        }
    }
}