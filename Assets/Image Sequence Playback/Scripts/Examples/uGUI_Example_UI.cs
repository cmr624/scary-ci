using UnityEngine;
using System.Collections;

public class uGUI_Example_UI : MonoBehaviour 
{
    public Playback p;

    public void OnPlayButtonClick()
    {
        p.Play();
    }

    public void OnPauseButtonClick()
    {
        p.Pause(!p.IsPaused);
    }

    public void OnStopButtonClick()
    {
        p.Stop();
    }
}