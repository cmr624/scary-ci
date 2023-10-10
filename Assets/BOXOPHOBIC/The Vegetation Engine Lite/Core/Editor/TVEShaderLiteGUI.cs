//Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using Boxophobic.StyledGUI;

public class TVEShaderLiteGUI : ShaderGUI
{
    bool multiSelection = false;

    public override void AssignNewShaderToMaterial(Material material, Shader oldShader, Shader newShader)
    {
        base.AssignNewShaderToMaterial(material, oldShader, newShader);

        SetMaterialSettings(material);
    }

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
        var material0 = materialEditor.target as Material;
        var materials = materialEditor.targets;

        if (materials.Length > 1)
            multiSelection = true;

        DrawDynamicInspector(material0, materialEditor, props);

        foreach (Material material in materials)
        {
            SetMaterialSettings(material);
        }
    }

    void DrawDynamicInspector(Material material, MaterialEditor materialEditor, MaterialProperty[] props)
    {
        var splitLine = material.shader.name.Split(char.Parse("/"));
        var splitCount = splitLine.Length;
        var title = splitLine[splitCount - 1];
        var subtitle = "Lite";

        StyledGUI.DrawInspectorBanner(title, subtitle);

        var customPropsList = new List<MaterialProperty>();

        if (multiSelection)
        {
            for (int i = 0; i < props.Length; i++)
            {
                var prop = props[i];

                if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                    continue;

                if (prop.name == "unity_Lightmaps")
                    continue;

                if (prop.name == "unity_LightmapsInd")
                    continue;

                if (prop.name == "unity_ShadowMasks")
                    continue;

                customPropsList.Add(prop);
            }
        }
        else
        {
            for (int i = 0; i < props.Length; i++)
            {
                var prop = props[i];
                var internalName = prop.name;

                if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                {
                    continue;
                }

                if (GetPropertyVisibility(material, internalName))
                {
                    customPropsList.Add(prop);
                }
            }
        }

        //Draw Custom GUI
        for (int i = 0; i < customPropsList.Count; i++)
        {
            var property = customPropsList[i];
            var displayName = GetPropertyDisplay(material, property);

            materialEditor.ShaderProperty(customPropsList[i], displayName);
        }

        GUILayout.Space(10);

        StyledGUI.DrawInspectorCategory("Advanced Settings");

        GUILayout.Space(10);

        DrawPivotsSupport(material);
        materialEditor.EnableInstancingField();

        GUILayout.Space(10);

        DrawRenderQueue(material, materialEditor);

        GUILayout.Space(15);

        DrawPoweredByTheVegetationEngine();
    }

    void SetMaterialSettings(Material material)
    {
        var shaderName = material.shader.name;

        if (material.HasProperty("_IsVersion"))
        {
            var version = material.GetInt("_IsVersion");

            if (version < 1100)
            {
                if (material.shader.name == ("BOXOPHOBIC/The Vegetation Engine Lite/Geometry/Plant Standard Lit"))
                {
                    material.SetFloat("_SubsurfaceValue", 0);
                    material.SetFloat("_MotionValue_30", 0);
                }

                if (material.HasProperty("_DetailMeshMode"))
                {
                    var mode = material.GetInt("_DetailMeshMode");

                    if (mode == 0)
                    {
                        material.SetFloat("_DetailMeshMode", 30);
                    }

                    if (mode == 1)
                    {
                        material.SetFloat("_DetailMeshMode", 0);
                    }
                }

                material.SetInt("_IsVersion", 1100);
            }
        }

        // Set Internal Render Values
        if (material.HasProperty("_RenderMode"))
        {
            material.SetInt("_render_mode", material.GetInt("_RenderMode"));
        }

        if (material.HasProperty("_RenderCull"))
        {
            material.SetInt("_render_cull", material.GetInt("_RenderCull"));
        }

        if (material.HasProperty("_RenderZWrite"))
        {
            material.SetInt("_render_zw", material.GetInt("_RenderZWrite"));
        }

        if (material.HasProperty("_RenderClip"))
        {
            material.SetInt("_render_clip", material.GetInt("_RenderClip"));
        }

        if (material.HasProperty("_RenderSpecular"))
        {
            material.SetInt("_render_specular", material.GetInt("_RenderSpecular"));
        }

        // Set Render Mode
        if (material.HasProperty("_RenderMode"))
        {
            int mode = material.GetInt("_RenderMode");
            int zwrite = material.GetInt("_RenderZWrite");
            int queue = 0;
            int priority = 0;
            int decals = 0;
            int clip = 0;

            if (material.HasProperty("_RenderQueue") && material.HasProperty("_RenderPriority"))
            {
                queue = material.GetInt("_RenderQueue");
                priority = material.GetInt("_RenderPriority");
            }

            if (material.GetTag("RenderPipeline", false) == "HDRenderPipeline")
            {
                if (material.HasProperty("_RenderDecals"))
                {
                    decals = material.GetInt("_RenderDecals");
                }
            }

            if (material.HasProperty("_RenderClip"))
            {
                clip = material.GetInt("_RenderClip");
            }

            // User Defined, render type changes needed
            if (queue == 2)
            {
                if (material.renderQueue == 2000)
                {
                    material.SetOverrideTag("RenderType", "Opaque");
                }

                if (material.renderQueue > 2449 && material.renderQueue < 3000)
                {
                    material.SetOverrideTag("RenderType", "AlphaTest");
                }

                if (material.renderQueue > 2999)
                {
                    material.SetOverrideTag("RenderType", "Transparent");
                }
            }

            // Opaque
            if (mode == 0)
            {
                if (queue != 2)
                {
                    material.SetOverrideTag("RenderType", "AlphaTest");
                    //material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest + priority;

                    if (clip == 0)
                    {
                        if (decals == 0)
                        {
                            material.renderQueue = 2000 + priority;
                        }
                        else
                        {
                            material.renderQueue = 2225 + priority;
                        }
                    }
                    else
                    {
                        if (decals == 0)
                        {
                            material.renderQueue = 2450 + priority;
                        }
                        else
                        {
                            material.renderQueue = 2475 + priority;
                        }
                    }
                }

                // Standard and Universal Render Pipeline
                material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_render_zw", 1);
                material.SetInt("_render_premul", 0);

                // Set Main Color alpha to 1
                if (material.HasProperty("_MainColor"))
                {
                    var mainColor = material.GetColor("_MainColor");
                    material.SetColor("_MainColor", new Color(mainColor.r, mainColor.g, mainColor.b, 1.0f));
                }

                // HD Render Pipeline
                material.DisableKeyword("_SURFACE_TYPE_TRANSPARENT");
                material.DisableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                material.DisableKeyword("_BLENDMODE_ALPHA");
                material.DisableKeyword("_BLENDMODE_ADD");
                material.DisableKeyword("_BLENDMODE_PRE_MULTIPLY");

                material.SetInt("_RenderQueueType", 1);
                material.SetInt("_SurfaceType", 0);
                material.SetInt("_BlendMode", 0);
                material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_AlphaSrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_AlphaDstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_ZWrite", 1);
                material.SetInt("_TransparentZWrite", 1);
                material.SetInt("_ZTestDepthEqualForOpaque", 3);

                if (clip == 0)
                {
                    material.SetInt("_ZTestGBuffer", 4);
                }
                else
                {
                    material.SetInt("_ZTestGBuffer", 3);
                }

                //material.SetInt("_ZTestGBuffer", 4);
                material.SetInt("_ZTestTransparent", 4);

                material.SetShaderPassEnabled("TransparentBackface", false);
                material.SetShaderPassEnabled("TransparentBackfaceDebugDisplay", false);
                material.SetShaderPassEnabled("TransparentDepthPrepass", false);
                material.SetShaderPassEnabled("TransparentDepthPostpass", false);
            }
            // Transparent
            else
            {
                if (queue != 2)
                {
                    material.SetOverrideTag("RenderType", "Transparent");
                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + priority;
                }

                // Standard and Universal Render Pipeline
                material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                material.SetInt("_render_premul", 0);

                // HD Render Pipeline
                material.EnableKeyword("_SURFACE_TYPE_TRANSPARENT");
                material.EnableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                material.EnableKeyword("_BLENDMODE_ALPHA");
                material.DisableKeyword("_BLENDMODE_ADD");
                material.DisableKeyword("_BLENDMODE_PRE_MULTIPLY");

                material.SetInt("_RenderQueueType", 5);
                material.SetInt("_SurfaceType", 1);
                material.SetInt("_BlendMode", 0);
                material.SetInt("_SrcBlend", 1);
                material.SetInt("_DstBlend", 10);
                material.SetInt("_AlphaSrcBlend", 1);
                material.SetInt("_AlphaDstBlend", 10);
                material.SetInt("_ZWrite", zwrite);
                material.SetInt("_TransparentZWrite", zwrite);
                material.SetInt("_ZTestDepthEqualForOpaque", 4);
                material.SetInt("_ZTestGBuffer", 4);
                material.SetInt("_ZTestTransparent", 4);

                material.SetShaderPassEnabled("TransparentBackface", true);
                material.SetShaderPassEnabled("TransparentBackfaceDebugDisplay", true);
                material.SetShaderPassEnabled("TransparentDepthPrepass", true);
                material.SetShaderPassEnabled("TransparentDepthPostpass", true);
            }
        }

        if (shaderName.Contains("Prop") || shaderName.Contains("Objects"))
        {
            material.SetShaderPassEnabled("MotionVectors", false);
        }
        else
        {
            material.SetShaderPassEnabled("MotionVectors", true);
        }

        // Set Receive Mode in HDRP
        if (material.GetTag("RenderPipeline", false) == "HDRenderPipeline")
        {
            if (material.HasProperty("_RenderDecals"))
            {
                int decals = material.GetInt("_RenderDecals");

                if (decals == 0)
                {
                    material.EnableKeyword("_DISABLE_DECALS");
                }
                else
                {
                    material.DisableKeyword("_DISABLE_DECALS");
                }
            }

            if (material.HasProperty("_RenderSSR"))
            {
                int ssr = material.GetInt("_RenderSSR");

                if (ssr == 0)
                {
                    material.EnableKeyword("_DISABLE_SSR");

                    material.SetInt("_StencilRef", 0);
                    material.SetInt("_StencilRefDepth", 0);
                    material.SetInt("_StencilRefDistortionVec", 4);
                    material.SetInt("_StencilRefGBuffer", 2);
                    material.SetInt("_StencilRefMV", 32);
                    material.SetInt("_StencilWriteMask", 6);
                    material.SetInt("_StencilWriteMaskDepth", 8);
                    material.SetInt("_StencilWriteMaskDistortionVec", 4);
                    material.SetInt("_StencilWriteMaskGBuffer", 14);
                    material.SetInt("_StencilWriteMaskMV", 40);
                }
                else
                {
                    material.DisableKeyword("_DISABLE_SSR");

                    material.SetInt("_StencilRef", 0);
                    material.SetInt("_StencilRefDepth", 8);
                    material.SetInt("_StencilRefDistortionVec", 4);
                    material.SetInt("_StencilRefGBuffer", 10);
                    material.SetInt("_StencilRefMV", 40);
                    material.SetInt("_StencilWriteMask", 6);
                    material.SetInt("_StencilWriteMaskDepth", 8);
                    material.SetInt("_StencilWriteMaskDistortionVec", 4);
                    material.SetInt("_StencilWriteMaskGBuffer", 14);
                    material.SetInt("_StencilWriteMaskMV", 40);
                }
            }
        }

        // Set Cull Mode
        if (material.HasProperty("_RenderCull"))
        {
            int cull = material.GetInt("_RenderCull");

            material.SetInt("_CullMode", cull);
            material.SetInt("_TransparentCullMode", cull);
            material.SetInt("_CullModeForward", cull);

            // Needed for HD Render Pipeline
            material.DisableKeyword("_DOUBLESIDED_ON");
        }

        // Set Clip Mode
        if (material.HasProperty("_RenderClip"))
        {
            int clip = material.GetInt("_RenderClip");
            float cutoff = 0.5f;

            if (material.HasProperty("_AlphaClipValue"))
            {
                cutoff = material.GetFloat("_AlphaClipValue");
            }

            if (clip == 0)
            {
                material.DisableKeyword("TVE_FEATURE_CLIP");

                material.SetInt("_render_coverage", 0);
            }
            else
            {
                material.EnableKeyword("TVE_FEATURE_CLIP");

                if (material.HasProperty("_RenderCoverage") && material.HasProperty("_AlphaFeatherValue"))
                {
                    material.SetInt("_render_coverage", material.GetInt("_RenderCoverage"));
                }
                else
                {
                    material.SetInt("_render_coverage", 0);
                }
            }

            material.SetFloat("_Cutoff", cutoff);

            // HD Render Pipeline
            material.SetFloat("_AlphaCutoff", cutoff);
            material.SetFloat("_AlphaCutoffPostpass", cutoff);
            material.SetFloat("_AlphaCutoffPrepass", cutoff);
            material.SetFloat("_AlphaCutoffShadow", cutoff);
        }

        // Set Normals Mode
        if (material.HasProperty("_RenderNormals") && material.HasProperty("_render_normals"))
        {
            int normals = material.GetInt("_RenderNormals");

            // Standard, Universal, HD Render Pipeline
            // Flip 0
            if (normals == 0)
            {
                material.SetVector("_render_normals", new Vector4(-1, -1, -1, 0));
                material.SetVector("_DoubleSidedConstants", new Vector4(-1, -1, -1, 0));
            }
            // Mirror 1
            else if (normals == 1)
            {
                material.SetVector("_render_normals", new Vector4(1, 1, -1, 0));
                material.SetVector("_DoubleSidedConstants", new Vector4(1, 1, -1, 0));
            }
            // None 2
            else if (normals == 2)
            {
                material.SetVector("_render_normals", new Vector4(1, 1, 1, 0));
                material.SetVector("_DoubleSidedConstants", new Vector4(1, 1, 1, 0));
            }
        }

#if UNITY_EDITOR
        // Assign Default HD Foliage profile
        if (material.HasProperty("_SubsurfaceDiffusion"))
        {
            // Workaround when the old HDRP 12 diffusion is not found
            if (material.GetFloat("_SubsurfaceDiffusion") == 3.5648174285888672f && AssetDatabase.GUIDToAssetPath("78322c7f82657514ebe48203160e3f39") == "")
            {
                material.SetFloat("_SubsurfaceDiffusion", 0);
            }

            // Workaround when the old HDRP 14 diffusion is not found
            if (material.GetFloat("_SubsurfaceDiffusion") == 2.6486763954162598f && AssetDatabase.GUIDToAssetPath("879ffae44eefa4412bb327928f1a96dd") == "")
            {
                material.SetFloat("_SubsurfaceDiffusion", 0);
            }

            // Search for one of Unity's diffusion profile
            if (material.GetFloat("_SubsurfaceDiffusion") == 0)
            {
                // HDRP 12 Profile
                if (AssetDatabase.GUIDToAssetPath("78322c7f82657514ebe48203160e3f39") != "")
                {
                    material.SetFloat("_SubsurfaceDiffusion", 3.5648174285888672f);
                    material.SetVector("_SubsurfaceDiffusion_Asset", new Vector4(228889264007084710000000000000000000000f, 0.000000000000000000000000012389357880079404f, 0.00000000000000000000000000000000000076932702684439582f, 0.00018220426863990724f));
                }

                // HDRP 14 Profile
                if (AssetDatabase.GUIDToAssetPath("879ffae44eefa4412bb327928f1a96dd") != "")
                {
                    material.SetFloat("_SubsurfaceDiffusion", 2.6486763954162598f);
                    material.SetVector("_SubsurfaceDiffusion_Asset", new Vector4(-36985449400010195000000f, 20.616847991943359f, -0.00000000000000000000000000052916750040661612f, -1352014335655804900f));
                }

                // HDRP 16 Profile
                if (AssetDatabase.GUIDToAssetPath("2384dbf2c1c420f45a792fbc315fbfb1") != "")
                {
                    material.SetFloat("_SubsurfaceDiffusion", 3.8956573009490967f);
                    material.SetVector("_SubsurfaceDiffusion_Asset", new Vector4(-8695930962161997000000000000000f, -50949593547561853000000000000000f, -0.010710084810853004f, -0.0000000055696536271909736f));
                }
            }
        }
#endif

        // Set Detail Mode
        if (material.HasProperty("_DetailMode") && material.HasProperty("_SecondColor"))
        {
            if (material.GetInt("_DetailMode") == 0)
            {
                material.DisableKeyword("TVE_FEATURE_DETAIL");
            }
            else
            {
                material.EnableKeyword("TVE_FEATURE_DETAIL");
            }

            if (material.HasProperty("_SecondUVsMode"))
            {
                var mode = material.GetInt("_SecondUVsMode");

                // Main
                if (mode == 0)
                {
                    material.SetVector("_second_uvs_mode", new Vector4(1, 0, 0, 0));
                }
                // Baked
                else if (mode == 1)
                {
                    material.SetVector("_second_uvs_mode", new Vector4(0, 1, 0, 0));
                }
                // Planar
                else if (mode == 2)
                {
                    material.SetVector("_second_uvs_mode", new Vector4(0, 0, 1, 0));
                }
                // Unused
                else if (mode == 3)
                {
                    material.SetVector("_second_uvs_mode", new Vector4(0, 0, 0, 1));
                }
            }

            if (material.HasProperty("_DetailMeshMode"))
            {
                var mode = material.GetInt("_DetailMeshMode");

                if (mode == 10)
                {
                    material.SetVector("_detail_mesh_mode", new Vector4(1, 0, 0, 0));
                }
                else if (mode == 20)
                {
                    material.SetVector("_detail_mesh_mode", new Vector4(0, 1, 0, 0));
                }
                else if (mode == 30)
                {
                    material.SetVector("_detail_mesh_mode", new Vector4(0, 0, 1, 0));
                }
                else if (mode == 40)
                {
                    material.SetVector("_detail_mesh_mode", new Vector4(0, 0, 0, 1));
                }
            }
        }

        if (material.HasProperty("_EmissiveColor"))
        {
            // Set Intensity Mode
            if (material.HasProperty("_EmissiveIntensityMode") && material.HasProperty("_EmissiveIntensityValue"))
            {
                float mode = material.GetInt("_EmissiveIntensityMode");
                float value = material.GetFloat("_EmissiveIntensityValue");

                if (mode == 0)
                {
                    material.SetFloat("_emissive_intensity_value", value);
                }
                else if (mode == 1)
                {
                    material.SetFloat("_emissive_intensity_value", (12.5f / 100.0f) * Mathf.Pow(2f, value));
                }
            }

            // Set GI Mode
            if (material.HasProperty("_EmissiveFlagMode"))
            {
                int mode = material.GetInt("_EmissiveFlagMode");

                if (mode == 0)
                {
                    material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.None;
                }
                else if (mode == 1)
                {
                    material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.AnyEmissive;
                }
                else if (mode == 2)
                {
                    material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.BakedEmissive;
                }
                else if (mode == 3)
                {
                    material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.RealtimeEmissive;
                }
            }
        }

        if (material.HasProperty("_VertexOcclusionMaskMode"))
        {
            var mode = material.GetInt("_VertexOcclusionMaskMode");

            if (mode == 10)
            {
                material.SetVector("_vertex_occlusion_mask_mode", new Vector4(1, 0, 0, 0));
            }
            else if (mode == 20)
            {
                material.SetVector("_vertex_occlusion_mask_mode", new Vector4(0, 1, 0, 0));
            }
            else if (mode == 30)
            {
                material.SetVector("_vertex_occlusion_mask_mode", new Vector4(0, 0, 1, 0));
            }
            else if (mode == 40)
            {
                material.SetVector("_vertex_occlusion_mask_mode", new Vector4(0, 0, 0, 1));
            }
        }

        if (material.HasProperty("_MotionVariationMode"))
        {
            var mode = material.GetInt("_MotionVariationMode");

            if (mode == 10)
            {
                material.SetVector("_motion_variation_mode", new Vector4(1, 0, 0, 0));
            }
            else if (mode == 20)
            {
                material.SetVector("_motion_variation_mode", new Vector4(0, 1, 0, 0));
            }
            else if (mode == 30)
            {
                material.SetVector("_motion_variation_mode", new Vector4(0, 0, 1, 0));
            }
            else if (mode == 40)
            {
                material.SetVector("_motion_variation_mode", new Vector4(0, 0, 0, 1));
            }
        }

        if (material.HasProperty("_MotionMaskMode_20"))
        {
            var mode = material.GetInt("_MotionMaskMode_20");

            if (mode == 10)
            {
                material.SetVector("_motion_mask_mode_20", new Vector4(1, 0, 0, 0));
            }
            else if (mode == 20)
            {
                material.SetVector("_motion_mask_mode_20", new Vector4(0, 1, 0, 0));
            }
            else if (mode == 30)
            {
                material.SetVector("_motion_mask_mode_20", new Vector4(0, 0, 1, 0));
            }
            else if (mode == 40)
            {
                material.SetVector("_motion_mask_mode_20", new Vector4(0, 0, 0, 1));
            }
        }

        if (material.HasProperty("_MotionMaskMode_30"))
        {
            var mode = material.GetInt("_MotionMaskMode_30");

            if (mode == 10)
            {
                material.SetVector("_motion_mask_mode_30", new Vector4(1, 0, 0, 0));
            }
            else if (mode == 20)
            {
                material.SetVector("_motion_mask_mode_30", new Vector4(0, 1, 0, 0));
            }
            else if (mode == 30)
            {
                material.SetVector("_motion_mask_mode_30", new Vector4(0, 0, 1, 0));
            }
            else if (mode == 40)
            {
                material.SetVector("_motion_mask_mode_30", new Vector4(0, 0, 0, 1));
            }
        }

        // Set Legacy props for external bakers
        if (material.HasProperty("_AlphaClipValue"))
        {
            material.SetFloat("_Cutoff", material.GetFloat("_AlphaClipValue"));
        }

        // Set Legacy props for external bakers
        if (material.HasProperty("_MainColor"))
        {
            material.SetColor("_Color", material.GetColor("_MainColor"));
        }

        // Set BlinnPhong Spec Color
        if (material.HasProperty("_SpecColor"))
        {
            material.SetColor("_SpecColor", Color.white);
        }

        if (material.HasProperty("_MainAlbedoTex"))
        {
            material.SetTexture("_MainTex", material.GetTexture("_MainAlbedoTex"));
        }

        if (material.HasProperty("_MainNormalTex"))
        {
            material.SetTexture("_BumpMap", material.GetTexture("_MainNormalTex"));
        }

        if (material.HasProperty("_MainUVs"))
        {
            material.SetTextureScale("_MainTex", new Vector2(material.GetVector("_MainUVs").x, material.GetVector("_MainUVs").y));
            material.SetTextureOffset("_MainTex", new Vector2(material.GetVector("_MainUVs").z, material.GetVector("_MainUVs").w));

            material.SetTextureScale("_BumpMap", new Vector2(material.GetVector("_MainUVs").x, material.GetVector("_MainUVs").y));
            material.SetTextureOffset("_BumpMap", new Vector2(material.GetVector("_MainUVs").z, material.GetVector("_MainUVs").w));
        }

        if (material.HasProperty("_SubsurfaceValue"))
        {
            // Subsurface Standard Render Pipeline
            material.SetFloat("_Translucency", material.GetFloat("_SubsurfaceScatteringValue"));
            material.SetFloat("_TransScattering", material.GetFloat("_SubsurfaceAngleValue"));
            material.SetFloat("_TransNormalDistortion", material.GetFloat("_SubsurfaceNormalValue"));
            material.SetFloat("_TransDirect", material.GetFloat("_SubsurfaceDirectValue"));
            material.SetFloat("_TransAmbient", material.GetFloat("_SubsurfaceAmbientValue"));
            material.SetFloat("_TransShadow", material.GetFloat("_SubsurfaceShadowValue"));

            //Subsurface Universal Render Pipeline
            material.SetFloat("_TransStrength", material.GetFloat("_SubsurfaceScatteringValue"));
            material.SetFloat("_TransNormal", material.GetFloat("_SubsurfaceNormalValue"));
        }
    }

    bool GetPropertyVisibility(Material material, string internalName)
    {
        bool valid = true;
        var shaderName = material.shader.name;

        if (internalName == "unity_Lightmaps")
            valid = false;

        if (internalName == "unity_LightmapsInd")
            valid = false;

        if (internalName == "unity_ShadowMasks")
            valid = false;

        if (internalName.Contains("_Banner"))
            valid = false;

        if (internalName == "_SpecColor")
            valid = false;

        if (material.HasProperty("_RenderMode"))
        {
            if (material.GetInt("_RenderMode") == 0 && internalName == "_RenderZWrite")
                valid = false;
        }

        bool hasRenderNormals = false;

        if (material.HasProperty("_render_normals"))
        {
            hasRenderNormals = true;
        }

        if (!hasRenderNormals)
        {
            if (internalName == "_RenderNormals")
                valid = false;
        }

        if (material.HasProperty("_RenderCull"))
        {
            if (material.GetInt("_RenderCull") == 2 && internalName == "_RenderNormals")
                valid = false;
        }

        if (material.HasProperty("_RenderClip"))
        {
            if (material.GetInt("_RenderClip") == 0)
            {
                if (internalName == "_AlphaClipValue")
                    valid = false;
                if (internalName == "_DetailAlphaMode")
                    valid = false;
            }
        }

        if (material.GetTag("RenderPipeline", false) != "HDRenderPipeline")
        {
            if (internalName == "_RenderDecals")
                valid = false;
            if (internalName == "_RenderSSR")
                valid = false;
        }

        bool showMainMaskMessage = false;

        if (material.HasProperty("_MainMaskMinValue") || material.HasProperty("_IsPlantShader"))
        {
            showMainMaskMessage = true;
        }

        if (!showMainMaskMessage)
        {
            if (internalName == "_MessageMainMask")
                valid = false;
        }

        if (!material.HasProperty("_SecondColor"))
        {
            if (internalName == "_CategoryDetail")
                valid = false;
            if (internalName == "_SecondUVsMode")
                valid = false;
        }

        bool showSecondMaskMessage = false;

        if (material.HasProperty("_SecondMaskMinValue"))
        {
            showSecondMaskMessage = true;
        }

        if (!showSecondMaskMessage)
        {
            if (internalName == "_MessageSecondMask")
                valid = false;
        }

        if (!material.HasProperty("_GradientColorOne"))
        {
            if (internalName == "_CategoryGradient")
                valid = false;
        }

        if (material.HasProperty("_SubsurfaceValue"))
        {
            if (material.GetTag("RenderPipeline", false) != "HDRenderPipeline" || shaderName.Contains("Standard"))
            {
                if (internalName == "_SubsurfaceDiffusion")
                    valid = false;
                if (internalName == "_SpaceSubsurface")
                    valid = false;
                if (internalName == "_MessageSubsurface")
                    valid = false;
            }

            // Standard Render Pipeline
            if (internalName == "_Translucency")
                valid = false;
            if (internalName == "_TransNormalDistortion")
                valid = false;
            if (internalName == "_TransScattering")
                valid = false;
            if (internalName == "_TransDirect")
                valid = false;
            if (internalName == "_TransAmbient")
                valid = false;
            if (internalName == "_TransShadow")
                valid = false;

            // Universal Render Pipeline
            if (internalName == "_TransStrength")
                valid = false;
            if (internalName == "_TransNormal")
                valid = false;

            if (material.GetTag("RenderPipeline", false) == "HDRenderPipeline" || shaderName.Contains("Standard Lit") || shaderName.Contains("Simple Lit") || shaderName.Contains("Vertex Lit"))
            {
                if (internalName == "_SubsurfaceNormalValue")
                    valid = false;
                if (internalName == "_SubsurfaceDirectValue")
                    valid = false;
                if (internalName == "_SubsurfaceAmbientValue")
                    valid = false;
                if (internalName == "_SubsurfaceShadowValue")
                    valid = false;
            }
        }
        else
        {
            if (internalName == "_CategorySubsurface")
                valid = false;
            if (internalName == "_SubsurfaceDiffusion")
                valid = false;
            if (internalName == "_SpaceSubsurface")
                valid = false;
            if (internalName == "_MessageSubsurface")
                valid = false;

            if (internalName == "_SubsurfaceScatteringValue")
                valid = false;
            if (internalName == "_SubsurfaceAngleValue")
                valid = false;
            if (internalName == "_SubsurfaceNormalValue")
                valid = false;
            if (internalName == "_SubsurfaceDirectValue")
                valid = false;
            if (internalName == "_SubsurfaceAmbientValue")
                valid = false;
            if (internalName == "_SubsurfaceShadowValue")
                valid = false;
        }

        if (!material.HasProperty("_EmissiveColor"))
        {
            if (internalName == "_CategoryEmissive")
                valid = false;
            if (internalName == "_EmissiveIntensityMode")
                valid = false;
            if (internalName == "_EmissiveFlagMode")
                valid = false;
            if (internalName == "_EmissiveIntensityValue")
                valid = false;
        }

        bool hasObject = false;

        if (material.HasProperty("_BoundsHeightValue") || material.HasProperty("_BoundsRadiusValue"))
        {
            hasObject = true;
        }

        if (!hasObject)
        {
            if (internalName == "_CategoryObject")
                valid = false;
            if (internalName == "_MessageObject")
                valid = false;
        }

        bool hasMotion = false;

        if (material.HasProperty("_MotionAmplitude_10") || material.HasProperty("_MotionValue_20") || material.HasProperty("_MotionValue_30"))
        {
            hasMotion = true;
        }

        if (!hasMotion)
        {
            if (internalName == "_CategoryMotion")
                valid = false;
            if (internalName == "_MessageMotion")
                valid = false;
        }

        return valid;
    }

    string GetPropertyDisplay(Material material, MaterialProperty property)
    {
        var displayName = property.displayName;
        var internalName = property.name;

        if (internalName == "_SecondAlbedoTex")
        {
            GUILayout.Space(10);
        }

        if (internalName == "_EmissiveTex")
        {
            GUILayout.Space(10);
        }

        if (EditorGUIUtility.currentViewWidth > 550)
        {
            if (internalName == "_MainMetallicValue")
            {
                displayName = displayName + " (Mask Red)";
            }

            if (internalName == "_MainOcclusionValue")
            {
                displayName = displayName + " (Mask Green)";
            }

            if (internalName == "_MainSmoothnessValue")
            {
                displayName = displayName + " (Mask Alpha)";
            }

            if (internalName == "_MainMaskRemap")
            {
                displayName = displayName + " (Mask Blue)";
            }

            if (internalName == "_SecondMetallicValue")
            {
                displayName = displayName + " (Mask Red)";
            }

            if (internalName == "_SecondOcclusionValue")
            {
                displayName = displayName + " (Mask Green)";
            }

            if (internalName == "_SecondSmoothnessValue")
            {
                displayName = displayName + " (Mask Alpha)";
            }

            if (internalName == "_SecondMaskRemap")
            {
                displayName = displayName + " (Mask Blue)";
            }
        }

        return displayName;
    }

    void DrawPivotsSupport(Material material)
    {
        if (material.HasProperty("_VertexPivotMode"))
        {
            EditorGUILayout.HelpBox("Use the Procedural Pivots option to support large patches of grass or small cover plants when Motion Bending is used!", MessageType.Info);

            GUILayout.Space(10);

            var pivot = material.GetInt("_VertexPivotMode");

            bool toggle = false;

            if (pivot > 0.5f)
            {
                toggle = true;
            }

            toggle = EditorGUILayout.Toggle("Enable Procedural Pivots ", toggle);

            if (toggle)
            {
                material.SetInt("_VertexPivotMode", 1);
            }
            else
            {
                material.SetInt("_VertexPivotMode", 0);
            }
        }
    }

    void DrawRenderQueue(Material material, MaterialEditor materialEditor)
    {
        if (material.HasProperty("_RenderQueue") && material.HasProperty("_RenderPriority"))
        {
            var queue = material.GetInt("_RenderQueue");
            var priority = material.GetInt("_RenderPriority");

            queue = EditorGUILayout.Popup("Render Queue Mode", queue, new string[] { "Auto", "Priority", "User Defined" });

            if (queue == 0)
            {
                priority = 0;
            }
            else if (queue == 1)
            {
                priority = EditorGUILayout.IntSlider("Render Priority", priority, -100, 100);
            }
            else
            {
                priority = 0;
                materialEditor.RenderQueueField();
            }

            material.SetInt("_RenderQueue", queue);
            material.SetInt("_RenderPriority", priority);
        }
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

        GUILayout.Space(5);
    }
}

