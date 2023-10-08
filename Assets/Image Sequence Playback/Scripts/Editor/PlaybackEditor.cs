using UnityEngine;
using UnityEditor;
using System;
using System.Collections;
using System.IO;

[CustomEditor(typeof(Playback))]
public class PlaybackEditor : Editor
{
    public override void OnInspectorGUI()
    {
        EditorGUILayout.Space();
        serializedObject.Update();
        Playback p = serializedObject.targetObject as Playback;
        string lastPath = p.sequenceFolder;
        string lastResource = p.resourceFolder;
        bool lastAsync = p.asyncLoading;

        DrawProperty("sequenceFolder", "Sequence Folder:");
        DrawProperty("loadOnAwake", "Load On Awake");
        DrawProperty("asyncLoading", "Enable Async Loading");
        if (p.asyncLoading)
        {
            DrawProperty("resourceFolder", "Resources Folder");
            if (GUILayout.Button("Update List", GUILayout.MaxWidth(100)))
            {
                UpdateFiles(p);
            }
        }
        if (p.asyncLoading && (p.sequenceFolder != lastPath || lastAsync != p.asyncLoading || lastResource != p.resourceFolder))
        {
            lastPath = p.sequenceFolder;
            lastResource = p.resourceFolder;
            lastAsync = p.asyncLoading;
            UpdateFiles(p);
        }
        EditorGUILayout.Space();
        DrawProperty("FPS", "FPS:");
        DrawProperty("playOnAwake", "Play On Awake");
        if (serializedObject.FindProperty("playOnAwake").boolValue) DrawProperty("startDelay", "Start Delay:");
        DrawProperty("loop", "Loop");
        DrawProperty("mode", "Mode:");

        DrawProperty("multiOut", "Multiple Outputs", "Use multiple ui images/materials as output");

        if (serializedObject.FindProperty("mode").enumValueIndex == 0)
        {
            if (!serializedObject.FindProperty("multiOut").boolValue)
            {
                DrawProperty("playbackMat", "Playback Material:");
            } else
            {
                DrawProperty("matOutList", "Playback Materials List:");
            }
        }
        if (serializedObject.FindProperty("mode").enumValueIndex == 2)
        {
            if (!serializedObject.FindProperty("multiOut").boolValue)
            {
                DrawProperty("rawImage", "Raw Image:");
            } else
            {
                DrawProperty("uiOutList", "Raw Image List:");
            }
        }

        EditorGUILayout.Separator();
        DrawProperty("playAudio", "Play Audio");
        if (serializedObject.FindProperty("playAudio").boolValue)
        {
            DrawProperty("source", "Audio Source:");
            DrawProperty("clip", "Clip:");
            DrawProperty("clipBaseFps", "Base FPS:");
        }

        EditorGUILayout.Separator();
        DrawProperty("showDebug", "Debug Info");
        if (serializedObject.FindProperty("showDebug").boolValue)
        {
            if (Application.isPlaying && Application.isEditor)
            {
                Playback t = (Playback)target;
                EditorGUILayout.SelectableLabel("Progress: " + (t.progress * 100f).ToString("f0") + "%");
                EditorGUILayout.SelectableLabel("Frames: " + t.frames + "  Current: " + (t.currentFrame+1));
                this.Repaint();
            }
            else EditorGUILayout.SelectableLabel("Enter playmode.");
        }
        if (p.asyncLoading)
        {
            EditorGUILayout.Separator();
            DrawProperty("resourceFiles", "Sequence Files");
        }
    }

    void DrawProperty(string name, string label, string tooltip = "")
    {
        SerializedProperty prop = serializedObject.FindProperty(name);
        EditorGUI.BeginChangeCheck();
        EditorGUILayout.PropertyField(prop, new GUIContent(label, tooltip), true);
        if (EditorGUI.EndChangeCheck())
            serializedObject.ApplyModifiedProperties();
        //EditorGUIUtility.LookLikeControls();
    }

    void UpdateFiles(Playback p)
    {
        p.resourceFiles.Clear();
        string fullPath = Application.dataPath + "/" + p.resourceFolder + "/" + p.sequenceFolder;
        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            fullPath.Replace("/", @"\");
        }
        else fullPath.Replace(@"\", "/");
        if (!Directory.Exists(fullPath))
        {
            Debug.Log("Cannot find resources folder at:\n" + fullPath + "\n Check the documentation and make sure you set up correctly.");
        }
        else
        {
            // first get all files then filter through the filter array
            string[] files = Directory.GetFiles(fullPath);
            string[] extensions = new string[7] { "bmp", "png", "jpg", "tif", "tiff", "psd", "tga" };
            for (int i = 0; i < files.Length; i++)
            {
                for (int j = 0; j < extensions.Length; j++)
                {
                    if (files[i].ToLowerInvariant().EndsWith(extensions[j]))
                    {// get resource path that is used in Resources.LoadAsync
                        string resourcePath = files[i].Replace(@"\", "/");
                        resourcePath = resourcePath.Remove(0, resourcePath.LastIndexOf("/") + 1);
                        resourcePath = resourcePath.Remove(resourcePath.LastIndexOf("."));
                        resourcePath = p.sequenceFolder + "/" + resourcePath;
                        p.resourceFiles.Add(resourcePath);
                    }
                }
            }
        }
    }
}