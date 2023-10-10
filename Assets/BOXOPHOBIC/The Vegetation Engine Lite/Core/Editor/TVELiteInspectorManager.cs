//Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using TheVegetationEngineLite;

namespace TheVegetationEngine
{
    [DisallowMultipleComponent]
    [CustomEditor(typeof(TVELiteManager))]
    public class TVEInspectorElement : Editor
    {
        private static readonly string excludeProps = "m_Script";
        private TVELiteManager targetScript;

        void OnEnable()
        {
            targetScript = (TVELiteManager)target;
        }

        public override void OnInspectorGUI()
        {
            DrawInspector();

            DrawPoweredByTheVegetationEngine();

            GUILayout.Space(5);
        }

        void DrawInspector()
        {
            serializedObject.Update();

            DrawPropertiesExcluding(serializedObject, excludeProps);

            serializedObject.ApplyModifiedProperties();
        }

        void DrawPoweredByTheVegetationEngine()
        {
            var styleLabelCentered = new GUIStyle(EditorStyles.label)
            {
                richText = true,
                wordWrap = true,
                alignment = TextAnchor.MiddleCenter,
            };

            Rect lastRect0 = GUILayoutUtility.GetLastRect();
            EditorGUI.DrawRect(new Rect(0, lastRect0.yMax, 1000, 1), new Color(0, 0, 0, 0.4f));

            GUILayout.Space(10);

            GUILayout.Label("<size=10><color=#808080>Powered by The Vegetation Engine. Get the full version for more features!</color></size>", styleLabelCentered);

            Rect labelRect = GUILayoutUtility.GetLastRect();

            if (GUI.Button(labelRect, "", new GUIStyle()))
            {
                Application.OpenURL("http://u3d.as/1H9u");
            }
        }
    }
}


