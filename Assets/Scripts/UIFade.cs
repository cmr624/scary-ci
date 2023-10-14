using System.Collections;
using UnityEngine;
using UnityEngine.UI;

namespace ScaryJam.UI
{
    // origin: https://forum.unity.com/threads/simple-ui-animation-fade-in-fade-out-c.439825/ 
    // author: serg_borisov97 
    public enum FadeType
    {
        FadeIn,
        FadeOut,
        FadeInOut,
        FadeOutIn
    }
     
    public class UIFade : MonoBehaviour
    {
        [Tooltip("The UI element you want to fade")]
        [SerializeField]
        private MaskableGraphic _element;
     
        [Tooltip("Fade type")]
        [SerializeField]
        private FadeType _fadeType;
     
        [Tooltip("Fade time")]
        [SerializeField]
        private float _fadeTime = 1f;

        public float FadeTime
        {
            get => _fadeTime;
            set
            {
                if (!_isFadeInProgress) _fadeTime = value;
            }
        }

        private Color _color;

        private bool _isFadeInProgress = false;
        public bool IsFadeInProgress => _isFadeInProgress; 

        public void SetImageAlphaZero()
        {
            SetImageAlpha(0f);
        }
        
        public void SetImageAlphaFull()
        {
            SetImageAlpha(1f);
        }

        public void SetImageAlpha(float a)
        {
            var c = _element.color; 
            _element.color = new Color(c.r, c.g, c.b, a);
        }
        
        public void DoFade()
        {
            DoFade(_fadeType);
        }
        
        public void DoFade(FadeType fadeType)
        {
            _fadeType = fadeType; 
            _color = _element.color;
            _isFadeInProgress = true; 
            switch(fadeType)
            {
                case FadeType.FadeIn:
                    StartCoroutine(FadeIn());
                    break;
                case FadeType.FadeOut:
                    StartCoroutine(FadeOut());
                    break;
                case FadeType.FadeInOut:
                    StartCoroutine(FadeInOut());
                    break;
                case FadeType.FadeOutIn:
                    StartCoroutine(FadeOutIn());
                    break;
            }
        }
     
        private IEnumerator FadeOut()
        {
            for(float a = _fadeTime; a >= 0; a -= Time.deltaTime)
            {
                _element.color = new Color(_color.r, _color.g, _color.b, a / _fadeTime);
                yield return null;
            }

            _isFadeInProgress = false; 
        }
     
        private IEnumerator FadeIn()
        {
            Debug.Log("start fade in");
            for(float a = 0; a <= _fadeTime; a += Time.deltaTime)
            {
                _element.color = new Color(_color.r, _color.g, _color.b, a / _fadeTime);
                yield return null;
            }

            _isFadeInProgress = false; 
        }
     
        private IEnumerator FadeInOut()
        {
            StartCoroutine(FadeIn());
            yield return new WaitForSeconds(_fadeTime);
            _isFadeInProgress = true; // TODO: it's possible that for 1 frame the fade will be marked as false incorrectly
            StartCoroutine(FadeOut());
        }
     
        private IEnumerator FadeOutIn()
        {
            StartCoroutine(FadeOut());
            yield return new WaitForSeconds(_fadeTime);
            _isFadeInProgress = true; // TODO: it's possible that for 1 frame the fade will be marked as false incorrectly
            StartCoroutine(FadeIn());
        }
    }
}