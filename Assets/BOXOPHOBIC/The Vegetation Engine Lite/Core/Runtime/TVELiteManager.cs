// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;

namespace TheVegetationEngineLite
{
    [HelpURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.czf8ud5bmaq2")]
    [ExecuteInEditMode]
    [AddComponentMenu("BOXOPHOBIC/The Vegetation Engine/TVE Manager Lite")]
    public class TVELiteManager : StyledMonoBehaviour
    {
        [StyledBanner(0.890f, 0.745f, 0.309f, "The Vegetation Engine Lite")]
        public bool styledBanner;

        [StyledMessage("Info", "When the Vegetation Engine Core manager is enabled in the scene, the Lite shaders will use the core settings instead of the current settings!", 0, 5)]
        public bool managerMessage = false;

        [StyledCategory("Scene Settings", 5, 10)]
        public bool sceneCat;

        [Tooltip("Sets the main direction from a gameobject.")]
        public GameObject mainDirection;
        [Tooltip("Sets the main light used as the sun in the scene.")]
        public Light mainLight;

        [StyledCategory("Motion Settings")]
        public bool windCat;

        [Tooltip("Controls the global wind power.")]
        [StyledRangeOptions("Wind Power", 0, 1, new string[] { "None", "Windy", "Strong" })]
        public float windPower = 0.5f;

        [StyledCategory("Motion Settings")]
        public bool motionCat;

        [Tooltip("Sets the texture used for wind gust and motion highlight.")]
        public Texture2D noiseTexture;
        [Tooltip("Controls the global Noise Texture scale.")]
        public float noiseTilling = 1.0f;

        [Space(10)]
        [Tooltip("Controls the global Motion Bending amplitude.")]
        [Range(0, 2)]
        public float motionBending = 1.0f;
        [Tooltip("Controls the global Motion Branch amplitude.")]
        [Range(0, 2)]
        public float motionBranch = 1.0f;
        [Tooltip("Controls the global Motion Flutter amplitude.")]
        [Range(0, 2)]
        public float motionFlutter = 1.0f;
        [Tooltip("Controls the global Motion Speed.")]
        [Range(0, 2)]
        public float motionSpeed = 1.0f;

        [StyledSpace(10)]
        public bool styledSpace0;

        void Start()
        {
            gameObject.name = "The Vegetation Engine Lite";

            if (mainLight == null)
            {
                SetGlobalLightingMainLight();
            }

            if (noiseTexture == null)
            {
                noiseTexture = Resources.Load<Texture2D>("Internal NoiseTexLite");
            }
        }

        void Update()
        {
            if (mainDirection == null)
            {
                mainDirection = gameObject;
            }

            gameObject.transform.eulerAngles = new Vector3(0, mainDirection.transform.eulerAngles.y, 0);

            int isCoreManagerEnabled = Shader.GetGlobalInt("TVE_IsEnabled");

            if (isCoreManagerEnabled == 0)
            {
                SetGlobalShaderProperties();

                managerMessage = false;
            }
            else
            {
                managerMessage = true;
            }
        }

        void SetGlobalShaderProperties()
        {
            var windDirection = mainDirection.transform.forward;
            Shader.SetGlobalVector("TVE_MotionParams", new Vector4(windDirection.x * 0.5f + 0.5f, windDirection.z * 0.5f + 0.5f, windPower, 0.0f));

            if (mainLight != null)
            {
                var mainLightColor = mainLight.color.linear;
                var mainLightValue = new Color(mainLight.intensity, mainLight.intensity, mainLight.intensity).linear;
                var mainLightParams = new Color(mainLightColor.r, mainLightColor.g, mainLightColor.b, mainLightValue.r);

                Shader.SetGlobalVector("TVE_MainLightParams", mainLightParams);
                Shader.SetGlobalVector("TVE_MainLightDirection", Vector4.Normalize(-mainLight.transform.forward));
            }
            else
            {
                var mainLightParams = new Vector4(1, 1, 1, 1);

                Shader.SetGlobalVector("TVE_MainLightParams", mainLightParams);
                Shader.SetGlobalVector("TVE_MainLightDirection", new Vector4(0, 1, 0, 0));
            }

            Shader.SetGlobalTexture("TVE_NoiseTex", noiseTexture);
            Shader.SetGlobalFloat("TVE_NoiseTexTilling", noiseTilling);

            Shader.SetGlobalFloat("TVE_MotionValue_10", motionBending);
            Shader.SetGlobalFloat("TVE_MotionValue_20", motionBranch);
            Shader.SetGlobalFloat("TVE_MotionValue_30", motionFlutter);
            Shader.SetGlobalFloat("TVE_MotionSpeed", motionSpeed);

            Shader.SetGlobalVector("TVE_TimeParams", Vector4.zero);
        }

        void SetGlobalLightingMainLight()
        {
#if UNITY_2023_1_OR_NEWER
            var allLights = FindObjectsByType<Light>(FindObjectsSortMode.None);
#else
            var allLights = FindObjectsOfType<Light>();
#endif

            var intensity = 0.0f;

            for (int i = 0; i < allLights.Length; i++)
            {
                if (allLights[i].type == LightType.Directional)
                {
                    if (allLights[i].intensity > intensity)
                    {
                        mainLight = allLights[i];
                    }
                }
            }
        }
    }
}
