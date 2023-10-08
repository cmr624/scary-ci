using UnityEngine;
using System.Collections;

public class materialMode : MonoBehaviour 
{
    public Playback playback;

    void OnGUI()
    {
        if (GUI.Button(new Rect(10, 10, 100, 30), "Play"))
        {
            playback.Play();
        }
        if (GUI.Button(new Rect(220, 10, 100, 30), "Pause"))
        {
            playback.Pause(!playback.IsPaused);
        }
        playback.loop = GUI.Toggle(new Rect(10, 50, 100, 30), playback.loop, "Loop");
    }
}