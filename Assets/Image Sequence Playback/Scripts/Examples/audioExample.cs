using UnityEngine;
using System.Collections;

public class audioExample : MonoBehaviour 
{
    public Playback p;

    void OnGUI()
    {
        GUI.Box(new Rect(10, 10, 200, 40), "Try changing the FPS!");
        p.FPS = GUI.HorizontalSlider(new Rect(10, 55, 200, 30), p.FPS, 0.5f, 60);
    }
}