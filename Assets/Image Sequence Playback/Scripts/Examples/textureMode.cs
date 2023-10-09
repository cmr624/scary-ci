using UnityEngine;
using System.Collections;

public class textureMode : MonoBehaviour
{
    public Playback playback;

    void OnGUI()
    {
        GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), playback.GetTexture());
        if (GUI.Button(new Rect(10, 10, 150, 50), "Play"))
        {
            if (!playback.IsPlaying) playback.Play();
        }
        if (GUI.Button(new Rect(220, 10, 100, 30), "Pause"))
        {
            playback.Pause(!playback.IsPaused);
        }
    }
}