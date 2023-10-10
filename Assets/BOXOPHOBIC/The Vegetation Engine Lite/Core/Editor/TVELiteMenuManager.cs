using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

namespace TheVegetationEngineLite
{
    public static class TVEWindowMenus
    {
        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine Lite/Discord Server", false, 8000)]
        public static void Discord()
        {
            Application.OpenURL("https://discord.com/invite/znxuXET");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine Lite/Publisher Page", false, 8001)]
        public static void AssetStore()
        {
            Application.OpenURL("https://assetstore.unity.com/publishers/20529");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine Lite/Documentation", false, 8002)]
        public static void Documentation()
        {
            Application.OpenURL("https://docs.google.com/document/d/1TPTvQdaAFAOIFizSwApRERS9ZSpJtg6IKwxEpxU5FVI/edit#");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine Lite/Changelog", false, 8003)]
        public static void Chnagelog()
        {
            Application.OpenURL("https://docs.google.com/document/d/1TPTvQdaAFAOIFizSwApRERS9ZSpJtg6IKwxEpxU5FVI/edit#heading=h.1rbujejuzjce");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine Lite/Write A Review", false, 9999)]
        public static void WriteAReview()
        {
            Application.OpenURL("");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine Lite/Get The Vegetation Engine", false, 10000)]
        public static void GetTheVegetationEngine()
        {
            Application.OpenURL("https://u3d.as/1H9u");
        }
    }

    public static class TVELiteHierarchyMenus
    {
        [MenuItem("GameObject/BOXOPHOBIC/The Vegetation Engine Lite/Manager", false, 7)]
        static void CreateManager()
        {
            if (GameObject.Find("The Vegetation Engine Lite") != null)
            {
                Debug.Log("<b>[The Vegetation Engine Lite]</b> " + "The Vegetation Engine Lite Manager is already set in your scene!");
                return;
            }

            GameObject manager = new GameObject();
            manager.AddComponent<TVELiteManager>();
            manager.name = "The Vegetation Engine Lite";

            EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

            Debug.Log("<b>[The Vegetation Engine]</b> " + "The Vegetation Engine is set in the current scene! Check the Documentation for the next steps!");
        }
    }
}

