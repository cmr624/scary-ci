// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine Lite/Geometry/Prop Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render ]", Float) = 1
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledCategory(Main Settings)]_CategoryMain("[Category Main ]", Float) = 1
		[StyledMessage(Info, Use the Main Mask remap sliders to control the mask for Gradient Tinting and Subsurface Scattering. The mask is stored in Main Mask Blue channel. , 0, 10)]_MessageMainMask("# Message Main Mask", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		_MainAlbedoValue("Main Albedo", Range( 0 , 1)) = 1
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainMetallicValue("Main Metallic", Range( 0 , 1)) = 0
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_MainMaskMinValue, _MainMaskMaxValue, 0, 1, 0, 0)]_MainMaskRemap("Main Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 1
		[StyledMessage(Info, Use the Detail Mask remap sliders to control the mask for Gradient Tinting and Subsurface Scattering. The mask is stored in Detail Mask Blue channel., 0, 10)]_MessageSecondMask("# Message Second Mask", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Overlay,0,Replace,1)]_DetailAlphaMode("Detail Alpha", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondNormalTex("Detail Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Enum(UV0,0,UV4,1,Planar UVs,2)][Space(10)]_SecondUVsMode("Detail UVs", Float) = 0
		[StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[StyledToggle]_SecondUVsScaleMode("Use Inverted Tilling Mode", Float) = 0
		[HDR][Space(10)]_SecondColor("Detail Color", Color) = (1,1,1,1)
		_SecondAlbedoValue("Detail Albedo", Range( 0 , 1)) = 1
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondMetallicValue("Detail Metallic", Range( 0 , 1)) = 0
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_SecondMaskMinValue, _SecondMaskMaxValue, 0, 1, 0, 0)]_SecondMaskRemap("Detail Mask Remap", Vector) = (0,0,0,0)
		[Space(10)]_DetailValue("Detail Blend Intensity", Range( 0 , 1)) = 1
		_DetailNormalValue("Detail Blend Normals", Range( 0 , 1)) = 1
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blend Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min", Range( 0 , 1)) = 0.4
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max", Range( 0 , 1)) = 0.6
		[Enum(Projection,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)][Space(10)]_DetailMeshMode("Detail Surface Mask", Float) = 0
		[StyledRemapSlider(_DetailMeshMinValue, _DetailMeshMaxValue,0,1)]_DetailMeshRemap("Detail Surface Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMeshMinValue("Detail Surface Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMeshMaxValue("Detail Surface Max", Range( 0 , 1)) = 1
		[Enum(Main Mask,0,Detail Mask,1)]_DetailMaskMode("Detail Texture Mask", Float) = 0
		[StyledRemapSlider(_DetailMaskMinValue, _DetailMaskMaxValue,0,1)]_DetailMaskRemap("Detail Texture Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMaskMinValue("Detail Texture Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMaskMaxValue("Detail Texture Max", Range( 0 , 1)) = 1
		[StyledMessage(Info, When the Detail layer is used as snow__ converting the material to the Vegetation Engine will disable the detail blending in favor of using the Global Overlay feature., 10, 10)]_MessageSnow("# Message Snow", Float) = 0
		[StyledToggle]_DetailSnowMode("Use Detail as Snow Coverage", Float) = 0
		[HideInInspector]_second_uvs_mode("_second_uvs_mode", Vector) = (0,0,0,0)
		[HideInInspector]_detail_mesh_mode("_detail_mesh_mode", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 1
		[Enum(Procedural,0,Vertex Red,10,Vertex Green,20,Vertex Blue,30,Vertex Alpha,40)]_VertexOcclusionMaskMode("Occlusion Mask", Float) = 40
		[HDR]_VertexOcclusionColor("Occlusion Color", Color) = (1,1,1,0.5019608)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1, 0, 0)]_VertexOcclusionRemap("Occlusion Remap", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Occlusion Min", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Occlusion Max", Range( 0 , 1)) = 1
		[HideInInspector]_vertex_occlusion_mask_mode("_vertex_occlusion_mask_mode", Vector) = (0,0,0,0)
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 1
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[StyledMessage(Info, In HDRP__ the Subsurface Color and Power are fake effects used for artistic control. For physically correct subsurface scattering the Power slider need to be set to 0., 0, 10)]_MessageSubsurface("# Message Subsurface", Float) = 0
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# SpaceSubsurface", Float) = 0
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 1
		[Enum(None,0,Any,1,Baked,2,Realtime,3)]_EmissiveFlagMode("Emissive GI", Float) = 0
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Value", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensityValue("Emissive Power", Float) = 1
		[StyledRemapSlider(_EmissiveTexMinValue, _EmissiveTexMaxValue,0,1)]_EmissiveTexRemap("Emissive Remap", Vector) = (0,0,0,0)
		[HideInInspector]_EmissiveTexMinValue("Emissive Min", Range( 0 , 1)) = 0
		[HideInInspector]_EmissiveTexMaxValue("Emissive Max", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[StyledCategory(Object Settings)]_CategoryObject("[ Category Object ]", Float) = 1
		[StyledMessage(Info, Use the Object Height for Gradient and Motion Bending remapping and the Object Radius for Procedural Occlusion and Procedural Motion remapping. The values must match when using meshes with multi materials., 0, 10)]_MessageBounds("# Message Bounds", Float) = 0
		_BoundsRadiusValue("Object Radius", Float) = 1
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("Legacy Cutoff", Float) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_MotionValue_20("_MotionValue_20", Float) = 1
		[HideInInspector]_MotionValue_30("_MotionValue_30", Float) = 1
		[HideInInspector]_IsLiteShader("_IsLiteShader", Float) = 1
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1100
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1
		[HideInInspector]_render_coverage("_render_coverage", Float) = 0
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsPropShader("_IsPropShader", Float) = 1


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull [_render_cull]
		ZWrite [_render_zw]
		ZTest LEqual
		Offset 0,0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			//#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			//#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			//#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _CLUSTERED_RENDERING

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_EmissiveTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord8.zw = vertexToFrag11_g80228;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;
				v.ase_tangent = v.ase_tangent;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				float3 lerpResult6223_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80226).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g80226 = ( (_MainColor).rgb * lerpResult6223_g80226 );
				float2 vertexToFrag11_g80228 = IN.ase_texcoord8.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				float3 lerpResult6225_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80226).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g80226 = ( (_SecondColor).rgb * lerpResult6225_g80226 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80235 = 2.0;
				#else
				float staticSwitch1_g80235 = 4.594794;
				#endif
				float3 lerpResult4834_g80226 = lerp( ( Main_Albedo99_g80226 * Second_Albedo153_g80226 * staticSwitch1_g80235 ) , Second_Albedo153_g80226 , _DetailBlendMode);
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80226 = lerp( Main_Albedo99_g80226 , lerpResult4834_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80226 = lerpResult235_g80226;
				#else
				float3 staticSwitch255_g80226 = Main_Albedo99_g80226;
				#endif
				half3 Blend_Albedo265_g80226 = staticSwitch255_g80226;
				half3 Tint_Gradient_Color5769_g80226 = float3(1,1,1);
				float3 appendResult7790_g80226 = (float3(0.0 , IN.ase_texcoord9.xyz.y , 0.0));
				half Mesh_Spherical7697_g80226 = saturate( ( distance( IN.ase_texcoord9.xyz , appendResult7790_g80226 ) / _BoundsRadiusValue ) );
				float4 break33_g80296 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80296 = ( IN.ase_color.r * break33_g80296.x );
				float temp_output_29_0_g80296 = ( IN.ase_color.g * break33_g80296.y );
				float temp_output_31_0_g80296 = ( IN.ase_color.b * break33_g80296.z );
				float lerpResult7809_g80226 = lerp( Mesh_Spherical7697_g80226 , ( temp_output_30_0_g80296 + temp_output_29_0_g80296 + temp_output_31_0_g80296 + ( IN.ase_color.a * break33_g80296.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80301 = clamp( lerpResult7809_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80293 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80293 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80293 );
				half Occlusion_Mask6432_g80226 = saturate( ( ( clampResult17_g80301 - temp_output_7_0_g80293 ) / ( temp_output_10_0_g80293 + 0.0001 ) ) );
				float3 lerpResult2945_g80226 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80226);
				half3 Occlusion_Color648_g80226 = lerpResult2945_g80226;
				half3 Blend_Albedo_Tinted2808_g80226 = ( Blend_Albedo265_g80226 * Tint_Gradient_Color5769_g80226 * Occlusion_Color648_g80226 );
				half3 Blend_Albedo_Subsurface7608_g80226 = Blend_Albedo_Tinted2808_g80226;
				
				half2 Main_Normal137_g80226 = temp_output_6555_0_g80226;
				float2 lerpResult3372_g80226 = lerp( float2( 0,0 ) , Main_Normal137_g80226 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				half4 Normal_Packed45_g80284 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				float2 appendResult58_g80284 = (float2(( (Normal_Packed45_g80284).x * (Normal_Packed45_g80284).w ) , (Normal_Packed45_g80284).y));
				half2 Normal_Default50_g80284 = appendResult58_g80284;
				half2 Normal_ASTC41_g80284 = (Normal_Packed45_g80284).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80284 = Normal_ASTC41_g80284;
				#else
				float2 staticSwitch38_g80284 = Normal_Default50_g80284;
				#endif
				half2 Normal_NO_DTX544_g80284 = (Normal_Packed45_g80284).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80284 = Normal_NO_DTX544_g80284;
				#else
				float2 staticSwitch37_g80284 = staticSwitch38_g80284;
				#endif
				float2 temp_output_6560_0_g80226 = ( (staticSwitch37_g80284*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80285 = temp_output_6560_0_g80226;
				float2 break64_g80285 = Normal_Planar45_g80285;
				float3 appendResult65_g80285 = (float3(break64_g80285.x , 0.0 , break64_g80285.y));
				float2 temp_output_7775_0_g80226 = (mul( ase_worldToTangent, appendResult65_g80285 )).xy;
				float2 ifLocalVar7776_g80226 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80226 = temp_output_7775_0_g80226;
				else
				ifLocalVar7776_g80226 = temp_output_6560_0_g80226;
				half2 Second_Normal179_g80226 = ifLocalVar7776_g80226;
				float2 temp_output_36_0_g80236 = ( lerpResult3372_g80226 + Second_Normal179_g80226 );
				float2 lerpResult3376_g80226 = lerp( Main_Normal137_g80226 , temp_output_36_0_g80236 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80226 = lerpResult3376_g80226;
				#else
				float2 staticSwitch267_g80226 = Main_Normal137_g80226;
				#endif
				half2 Blend_Normal312_g80226 = staticSwitch267_g80226;
				float3 appendResult6568_g80226 = (float3(Blend_Normal312_g80226 , 1.0));
				float3 temp_output_13_0_g80230 = appendResult6568_g80226;
				float3 temp_output_33_0_g80230 = ( temp_output_13_0_g80230 * _render_normals );
				float3 switchResult12_g80230 = (((ase_vface>0)?(temp_output_13_0_g80230):(temp_output_33_0_g80230)));
				
				half3 Emissive_Color7162_g80226 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g80226 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g80276 = _EmissiveTexMinValue;
				float3 temp_cast_2 = (temp_output_7_0_g80276).xxx;
				float temp_output_10_0_g80276 = ( _EmissiveTexMaxValue - temp_output_7_0_g80276 );
				half3 Emissive_Texture7022_g80226 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g80226 )).rgb - temp_cast_2 ) / ( temp_output_10_0_g80276 + 0.0001 ) ) );
				half3 Emissive_Mask6968_g80226 = Emissive_Texture7022_g80226;
				float3 temp_output_3_0_g80229 = ( Emissive_Color7162_g80226 * Emissive_Mask6968_g80226 );
				float temp_output_15_0_g80229 = _emissive_intensity_value;
				float3 temp_output_23_0_g80229 = ( temp_output_3_0_g80229 * temp_output_15_0_g80229 );
				half3 Final_Emissive2476_g80226 = temp_output_23_0_g80229;
				
				half Main_Metallic237_g80226 = ( tex2DNode35_g80226.r * _MainMetallicValue );
				half Second_Metallic226_g80226 = ( tex2DNode33_g80226.r * _SecondMetallicValue );
				float lerpResult278_g80226 = lerp( Main_Metallic237_g80226 , Second_Metallic226_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch299_g80226 = lerpResult278_g80226;
				#else
				float staticSwitch299_g80226 = Main_Metallic237_g80226;
				#endif
				half Blend_Metallic306_g80226 = staticSwitch299_g80226;
				
				half Main_Smoothness227_g80226 = ( tex2DNode35_g80226.a * _MainSmoothnessValue );
				half Second_Smoothness236_g80226 = ( tex2DNode33_g80226.a * _SecondSmoothnessValue );
				float lerpResult266_g80226 = lerp( Main_Smoothness227_g80226 , Second_Smoothness236_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g80226 = lerpResult266_g80226;
				#else
				float staticSwitch297_g80226 = Main_Smoothness227_g80226;
				#endif
				half Blend_Smoothness314_g80226 = staticSwitch297_g80226;
				
				float lerpResult240_g80226 = lerp( 1.0 , tex2DNode35_g80226.g , _MainOcclusionValue);
				half Main_Occlusion247_g80226 = lerpResult240_g80226;
				float lerpResult239_g80226 = lerp( 1.0 , tex2DNode33_g80226.g , _SecondOcclusionValue);
				half Second_Occlusion251_g80226 = lerpResult239_g80226;
				float lerpResult294_g80226 = lerp( Main_Occlusion247_g80226 , Second_Occlusion251_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g80226 = lerpResult294_g80226;
				#else
				float staticSwitch310_g80226 = Main_Occlusion247_g80226;
				#endif
				half Blend_Occlusion323_g80226 = staticSwitch310_g80226;
				
				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80226;
				float3 Normal = switchResult12_g80230;
				float3 Emission = Final_Emissive2476_g80226;
				float3 Specular = 0.5;
				float Metallic = Blend_Metallic306_g80226;
				float Smoothness = Blend_Smoothness314_g80226;
				float Occlusion = Blend_Occlusion323_g80226;
				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += BaseColor * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += BaseColor * transmission;
						}
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += BaseColor * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += BaseColor * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.ase_texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord3.zw = vertexToFrag11_g80228;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = clipPos;
				o.clipPosV = clipPos;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				float2 vertexToFrag11_g80228 = IN.ase_texcoord3.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.ase_texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord3.zw = vertexToFrag11_g80228;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				float2 vertexToFrag11_g80228 = IN.ase_texcoord3.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_EmissiveTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.texcoord0.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord4.zw = vertexToFrag11_g80228;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.vertex.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord4.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				float3 lerpResult6223_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80226).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g80226 = ( (_MainColor).rgb * lerpResult6223_g80226 );
				float2 vertexToFrag11_g80228 = IN.ase_texcoord4.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				float3 lerpResult6225_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80226).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g80226 = ( (_SecondColor).rgb * lerpResult6225_g80226 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80235 = 2.0;
				#else
				float staticSwitch1_g80235 = 4.594794;
				#endif
				float3 lerpResult4834_g80226 = lerp( ( Main_Albedo99_g80226 * Second_Albedo153_g80226 * staticSwitch1_g80235 ) , Second_Albedo153_g80226 , _DetailBlendMode);
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80226 = lerp( Main_Albedo99_g80226 , lerpResult4834_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80226 = lerpResult235_g80226;
				#else
				float3 staticSwitch255_g80226 = Main_Albedo99_g80226;
				#endif
				half3 Blend_Albedo265_g80226 = staticSwitch255_g80226;
				half3 Tint_Gradient_Color5769_g80226 = float3(1,1,1);
				float3 appendResult7790_g80226 = (float3(0.0 , IN.ase_texcoord8.xyz.y , 0.0));
				half Mesh_Spherical7697_g80226 = saturate( ( distance( IN.ase_texcoord8.xyz , appendResult7790_g80226 ) / _BoundsRadiusValue ) );
				float4 break33_g80296 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80296 = ( IN.ase_color.r * break33_g80296.x );
				float temp_output_29_0_g80296 = ( IN.ase_color.g * break33_g80296.y );
				float temp_output_31_0_g80296 = ( IN.ase_color.b * break33_g80296.z );
				float lerpResult7809_g80226 = lerp( Mesh_Spherical7697_g80226 , ( temp_output_30_0_g80296 + temp_output_29_0_g80296 + temp_output_31_0_g80296 + ( IN.ase_color.a * break33_g80296.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80301 = clamp( lerpResult7809_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80293 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80293 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80293 );
				half Occlusion_Mask6432_g80226 = saturate( ( ( clampResult17_g80301 - temp_output_7_0_g80293 ) / ( temp_output_10_0_g80293 + 0.0001 ) ) );
				float3 lerpResult2945_g80226 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80226);
				half3 Occlusion_Color648_g80226 = lerpResult2945_g80226;
				half3 Blend_Albedo_Tinted2808_g80226 = ( Blend_Albedo265_g80226 * Tint_Gradient_Color5769_g80226 * Occlusion_Color648_g80226 );
				half3 Blend_Albedo_Subsurface7608_g80226 = Blend_Albedo_Tinted2808_g80226;
				
				half3 Emissive_Color7162_g80226 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g80226 = ( ( IN.ase_texcoord4.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g80276 = _EmissiveTexMinValue;
				float3 temp_cast_1 = (temp_output_7_0_g80276).xxx;
				float temp_output_10_0_g80276 = ( _EmissiveTexMaxValue - temp_output_7_0_g80276 );
				half3 Emissive_Texture7022_g80226 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g80226 )).rgb - temp_cast_1 ) / ( temp_output_10_0_g80276 + 0.0001 ) ) );
				half3 Emissive_Mask6968_g80226 = Emissive_Texture7022_g80226;
				float3 temp_output_3_0_g80229 = ( Emissive_Color7162_g80226 * Emissive_Mask6968_g80226 );
				float temp_output_15_0_g80229 = _emissive_intensity_value;
				float3 temp_output_23_0_g80229 = ( temp_output_3_0_g80229 * temp_output_15_0_g80229 );
				half3 Final_Emissive2476_g80226 = temp_output_23_0_g80229;
				
				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80226;
				float3 Emission = Final_Emissive2476_g80226;
				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.ase_texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord2.zw = vertexToFrag11_g80228;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				float3 lerpResult6223_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80226).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g80226 = ( (_MainColor).rgb * lerpResult6223_g80226 );
				float2 vertexToFrag11_g80228 = IN.ase_texcoord2.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				float3 lerpResult6225_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80226).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g80226 = ( (_SecondColor).rgb * lerpResult6225_g80226 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80235 = 2.0;
				#else
				float staticSwitch1_g80235 = 4.594794;
				#endif
				float3 lerpResult4834_g80226 = lerp( ( Main_Albedo99_g80226 * Second_Albedo153_g80226 * staticSwitch1_g80235 ) , Second_Albedo153_g80226 , _DetailBlendMode);
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80226 = lerp( Main_Albedo99_g80226 , lerpResult4834_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80226 = lerpResult235_g80226;
				#else
				float3 staticSwitch255_g80226 = Main_Albedo99_g80226;
				#endif
				half3 Blend_Albedo265_g80226 = staticSwitch255_g80226;
				half3 Tint_Gradient_Color5769_g80226 = float3(1,1,1);
				float3 appendResult7790_g80226 = (float3(0.0 , IN.ase_texcoord6.xyz.y , 0.0));
				half Mesh_Spherical7697_g80226 = saturate( ( distance( IN.ase_texcoord6.xyz , appendResult7790_g80226 ) / _BoundsRadiusValue ) );
				float4 break33_g80296 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80296 = ( IN.ase_color.r * break33_g80296.x );
				float temp_output_29_0_g80296 = ( IN.ase_color.g * break33_g80296.y );
				float temp_output_31_0_g80296 = ( IN.ase_color.b * break33_g80296.z );
				float lerpResult7809_g80226 = lerp( Mesh_Spherical7697_g80226 , ( temp_output_30_0_g80296 + temp_output_29_0_g80296 + temp_output_31_0_g80296 + ( IN.ase_color.a * break33_g80296.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80301 = clamp( lerpResult7809_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80293 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80293 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80293 );
				half Occlusion_Mask6432_g80226 = saturate( ( ( clampResult17_g80301 - temp_output_7_0_g80293 ) / ( temp_output_10_0_g80293 + 0.0001 ) ) );
				float3 lerpResult2945_g80226 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80226);
				half3 Occlusion_Color648_g80226 = lerpResult2945_g80226;
				half3 Blend_Albedo_Tinted2808_g80226 = ( Blend_Albedo265_g80226 * Tint_Gradient_Color5769_g80226 * Occlusion_Color648_g80226 );
				half3 Blend_Albedo_Subsurface7608_g80226 = Blend_Albedo_Tinted2808_g80226;
				
				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80226;
				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainNormalTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.ase_texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord5.zw = vertexToFrag11_g80228;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				v.ase_tangent = v.ase_tangent;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 tangentWS = float4(TransformObjectToWorldDir( v.ase_tangent.xyz), v.ase_tangent.w);
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord5.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g80226 = temp_output_6555_0_g80226;
				float2 lerpResult3372_g80226 = lerp( float2( 0,0 ) , Main_Normal137_g80226 , _DetailNormalValue);
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3(WorldTangent.xyz,ase_worldBitangent,WorldNormal);
				float2 vertexToFrag11_g80228 = IN.ase_texcoord5.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				half4 Normal_Packed45_g80284 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				float2 appendResult58_g80284 = (float2(( (Normal_Packed45_g80284).x * (Normal_Packed45_g80284).w ) , (Normal_Packed45_g80284).y));
				half2 Normal_Default50_g80284 = appendResult58_g80284;
				half2 Normal_ASTC41_g80284 = (Normal_Packed45_g80284).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80284 = Normal_ASTC41_g80284;
				#else
				float2 staticSwitch38_g80284 = Normal_Default50_g80284;
				#endif
				half2 Normal_NO_DTX544_g80284 = (Normal_Packed45_g80284).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80284 = Normal_NO_DTX544_g80284;
				#else
				float2 staticSwitch37_g80284 = staticSwitch38_g80284;
				#endif
				float2 temp_output_6560_0_g80226 = ( (staticSwitch37_g80284*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80285 = temp_output_6560_0_g80226;
				float2 break64_g80285 = Normal_Planar45_g80285;
				float3 appendResult65_g80285 = (float3(break64_g80285.x , 0.0 , break64_g80285.y));
				float2 temp_output_7775_0_g80226 = (mul( ase_worldToTangent, appendResult65_g80285 )).xy;
				float2 ifLocalVar7776_g80226 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80226 = temp_output_7775_0_g80226;
				else
				ifLocalVar7776_g80226 = temp_output_6560_0_g80226;
				half2 Second_Normal179_g80226 = ifLocalVar7776_g80226;
				float2 temp_output_36_0_g80236 = ( lerpResult3372_g80226 + Second_Normal179_g80226 );
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float2 lerpResult3376_g80226 = lerp( Main_Normal137_g80226 , temp_output_36_0_g80236 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80226 = lerpResult3376_g80226;
				#else
				float2 staticSwitch267_g80226 = Main_Normal137_g80226;
				#endif
				half2 Blend_Normal312_g80226 = staticSwitch267_g80226;
				float3 appendResult6568_g80226 = (float3(Blend_Normal312_g80226 , 1.0));
				float3 temp_output_13_0_g80230 = appendResult6568_g80226;
				float3 temp_output_33_0_g80230 = ( temp_output_13_0_g80230 * _render_normals );
				float3 switchResult12_g80230 = (((ase_vface>0)?(temp_output_13_0_g80230):(temp_output_33_0_g80230)));
				
				float localCustomAlphaClip19_g80238 = ( 0.0 );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float3 Normal = switchResult12_g80230;
				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					return half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					return half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			//#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			//#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			//#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_EmissiveTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord8.zw = vertexToFrag11_g80228;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				v.ase_tangent = v.ase_tangent;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				float3 lerpResult6223_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode29_g80226).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g80226 = ( (_MainColor).rgb * lerpResult6223_g80226 );
				float2 vertexToFrag11_g80228 = IN.ase_texcoord8.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				float3 lerpResult6225_g80226 = lerp( float3( 1,1,1 ) , (tex2DNode89_g80226).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g80226 = ( (_SecondColor).rgb * lerpResult6225_g80226 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g80235 = 2.0;
				#else
				float staticSwitch1_g80235 = 4.594794;
				#endif
				float3 lerpResult4834_g80226 = lerp( ( Main_Albedo99_g80226 * Second_Albedo153_g80226 * staticSwitch1_g80235 ) , Second_Albedo153_g80226 , _DetailBlendMode);
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g80226 = lerp( Main_Albedo99_g80226 , lerpResult4834_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g80226 = lerpResult235_g80226;
				#else
				float3 staticSwitch255_g80226 = Main_Albedo99_g80226;
				#endif
				half3 Blend_Albedo265_g80226 = staticSwitch255_g80226;
				half3 Tint_Gradient_Color5769_g80226 = float3(1,1,1);
				float3 appendResult7790_g80226 = (float3(0.0 , IN.ase_texcoord9.xyz.y , 0.0));
				half Mesh_Spherical7697_g80226 = saturate( ( distance( IN.ase_texcoord9.xyz , appendResult7790_g80226 ) / _BoundsRadiusValue ) );
				float4 break33_g80296 = _vertex_occlusion_mask_mode;
				float temp_output_30_0_g80296 = ( IN.ase_color.r * break33_g80296.x );
				float temp_output_29_0_g80296 = ( IN.ase_color.g * break33_g80296.y );
				float temp_output_31_0_g80296 = ( IN.ase_color.b * break33_g80296.z );
				float lerpResult7809_g80226 = lerp( Mesh_Spherical7697_g80226 , ( temp_output_30_0_g80296 + temp_output_29_0_g80296 + temp_output_31_0_g80296 + ( IN.ase_color.a * break33_g80296.w ) ) , saturate( _VertexOcclusionMaskMode ));
				float clampResult17_g80301 = clamp( lerpResult7809_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80293 = _VertexOcclusionMinValue;
				float temp_output_10_0_g80293 = ( _VertexOcclusionMaxValue - temp_output_7_0_g80293 );
				half Occlusion_Mask6432_g80226 = saturate( ( ( clampResult17_g80301 - temp_output_7_0_g80293 ) / ( temp_output_10_0_g80293 + 0.0001 ) ) );
				float3 lerpResult2945_g80226 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g80226);
				half3 Occlusion_Color648_g80226 = lerpResult2945_g80226;
				half3 Blend_Albedo_Tinted2808_g80226 = ( Blend_Albedo265_g80226 * Tint_Gradient_Color5769_g80226 * Occlusion_Color648_g80226 );
				half3 Blend_Albedo_Subsurface7608_g80226 = Blend_Albedo_Tinted2808_g80226;
				
				half2 Main_Normal137_g80226 = temp_output_6555_0_g80226;
				float2 lerpResult3372_g80226 = lerp( float2( 0,0 ) , Main_Normal137_g80226 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				half4 Normal_Packed45_g80284 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				float2 appendResult58_g80284 = (float2(( (Normal_Packed45_g80284).x * (Normal_Packed45_g80284).w ) , (Normal_Packed45_g80284).y));
				half2 Normal_Default50_g80284 = appendResult58_g80284;
				half2 Normal_ASTC41_g80284 = (Normal_Packed45_g80284).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80284 = Normal_ASTC41_g80284;
				#else
				float2 staticSwitch38_g80284 = Normal_Default50_g80284;
				#endif
				half2 Normal_NO_DTX544_g80284 = (Normal_Packed45_g80284).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80284 = Normal_NO_DTX544_g80284;
				#else
				float2 staticSwitch37_g80284 = staticSwitch38_g80284;
				#endif
				float2 temp_output_6560_0_g80226 = ( (staticSwitch37_g80284*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g80285 = temp_output_6560_0_g80226;
				float2 break64_g80285 = Normal_Planar45_g80285;
				float3 appendResult65_g80285 = (float3(break64_g80285.x , 0.0 , break64_g80285.y));
				float2 temp_output_7775_0_g80226 = (mul( ase_worldToTangent, appendResult65_g80285 )).xy;
				float2 ifLocalVar7776_g80226 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7776_g80226 = temp_output_7775_0_g80226;
				else
				ifLocalVar7776_g80226 = temp_output_6560_0_g80226;
				half2 Second_Normal179_g80226 = ifLocalVar7776_g80226;
				float2 temp_output_36_0_g80236 = ( lerpResult3372_g80226 + Second_Normal179_g80226 );
				float2 lerpResult3376_g80226 = lerp( Main_Normal137_g80226 , temp_output_36_0_g80236 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g80226 = lerpResult3376_g80226;
				#else
				float2 staticSwitch267_g80226 = Main_Normal137_g80226;
				#endif
				half2 Blend_Normal312_g80226 = staticSwitch267_g80226;
				float3 appendResult6568_g80226 = (float3(Blend_Normal312_g80226 , 1.0));
				float3 temp_output_13_0_g80230 = appendResult6568_g80226;
				float3 temp_output_33_0_g80230 = ( temp_output_13_0_g80230 * _render_normals );
				float3 switchResult12_g80230 = (((ase_vface>0)?(temp_output_13_0_g80230):(temp_output_33_0_g80230)));
				
				half3 Emissive_Color7162_g80226 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g80226 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g80276 = _EmissiveTexMinValue;
				float3 temp_cast_2 = (temp_output_7_0_g80276).xxx;
				float temp_output_10_0_g80276 = ( _EmissiveTexMaxValue - temp_output_7_0_g80276 );
				half3 Emissive_Texture7022_g80226 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g80226 )).rgb - temp_cast_2 ) / ( temp_output_10_0_g80276 + 0.0001 ) ) );
				half3 Emissive_Mask6968_g80226 = Emissive_Texture7022_g80226;
				float3 temp_output_3_0_g80229 = ( Emissive_Color7162_g80226 * Emissive_Mask6968_g80226 );
				float temp_output_15_0_g80229 = _emissive_intensity_value;
				float3 temp_output_23_0_g80229 = ( temp_output_3_0_g80229 * temp_output_15_0_g80229 );
				half3 Final_Emissive2476_g80226 = temp_output_23_0_g80229;
				
				half Main_Metallic237_g80226 = ( tex2DNode35_g80226.r * _MainMetallicValue );
				half Second_Metallic226_g80226 = ( tex2DNode33_g80226.r * _SecondMetallicValue );
				float lerpResult278_g80226 = lerp( Main_Metallic237_g80226 , Second_Metallic226_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch299_g80226 = lerpResult278_g80226;
				#else
				float staticSwitch299_g80226 = Main_Metallic237_g80226;
				#endif
				half Blend_Metallic306_g80226 = staticSwitch299_g80226;
				
				half Main_Smoothness227_g80226 = ( tex2DNode35_g80226.a * _MainSmoothnessValue );
				half Second_Smoothness236_g80226 = ( tex2DNode33_g80226.a * _SecondSmoothnessValue );
				float lerpResult266_g80226 = lerp( Main_Smoothness227_g80226 , Second_Smoothness236_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g80226 = lerpResult266_g80226;
				#else
				float staticSwitch297_g80226 = Main_Smoothness227_g80226;
				#endif
				half Blend_Smoothness314_g80226 = staticSwitch297_g80226;
				
				float lerpResult240_g80226 = lerp( 1.0 , tex2DNode35_g80226.g , _MainOcclusionValue);
				half Main_Occlusion247_g80226 = lerpResult240_g80226;
				float lerpResult239_g80226 = lerp( 1.0 , tex2DNode33_g80226.g , _SecondOcclusionValue);
				half Second_Occlusion251_g80226 = lerpResult239_g80226;
				float lerpResult294_g80226 = lerp( Main_Occlusion247_g80226 , Second_Occlusion251_g80226 , Blend_Mask147_g80226);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g80226 = lerpResult294_g80226;
				#else
				float staticSwitch310_g80226 = Main_Occlusion247_g80226;
				#endif
				half Blend_Occlusion323_g80226 = staticSwitch310_g80226;
				
				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				float3 BaseColor = Blend_Albedo_Subsurface7608_g80226;
				float3 Normal = switchResult12_g80230;
				float3 Emission = Final_Emissive2476_g80226;
				float3 Specular = 0.5;
				float Metallic = Blend_Metallic306_g80226;
				float Smoothness = Blend_Smoothness314_g80226;
				float Occlusion = Blend_Occlusion323_g80226;
				float Alpha = Final_Clip914_g80226;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.clipPos;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.clipPos,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.ase_texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord.zw = vertexToFrag11_g80228;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				float2 vertexToFrag11_g80228 = IN.ase_texcoord.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord1.xyz;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				surfaceDescription.Alpha = Final_Clip914_g80226;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			#define TVE_IS_PROP_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IS_STANDARD_SHADER
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailMeshRemap;
			half4 _VertexOcclusionColor;
			half4 _SecondUVs;
			half4 _vertex_occlusion_mask_mode;
			half4 _second_uvs_mode;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _SecondColor;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _MainUVs;
			half4 _EmissiveColor;
			half4 _detail_mesh_mode;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			half4 _MainColor;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _EmissiveUVs;
			half4 _DetailMaskRemap;
			half3 _render_normals;
			half _DetailMaskMaxValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceNormalValue;
			half _MotionValue_30;
			half _MotionValue_20;
			half _IsStandardShader;
			half _MainNormalValue;
			half _SecondUVsScaleMode;
			half _MainAlbedoValue;
			half _DetailBlendMinValue;
			half _DetailMeshMinValue;
			half _SecondOcclusionValue;
			half _MainOcclusionValue;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _SecondMetallicValue;
			half _MainMetallicValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _EmissiveTexMinValue;
			half _SecondNormalValue;
			half _SecondUVsMode;
			half _DetailNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaskMode;
			half _BoundsRadiusValue;
			half _DetailValue;
			half _DetailMode;
			half _DetailBlendMaxValue;
			half _SubsurfaceAngleValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMode;
			half _SubsurfaceDirectValue;
			half _render_cull;
			half _SubsurfaceShadowValue;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsTVEShader;
			half _IsLiteShader;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderCull;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderSSR;
			half _RenderDecals;
			half _Cutoff;
			float _SubsurfaceDiffusion;
			float _IsPropShader;
			half _render_coverage;
			half _render_zw;
			half _render_dst;
			half _render_src;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _IsVersion;
			half _DetailAlphaMode;
			half _MessageBounds;
			half _SpaceSubsurface;
			half _MessageSubsurface;
			half _MessageSecondMask;
			half _EmissiveIntensityMode;
			half _CategoryGradient;
			half _EmissiveFlagMode;
			half _EmissiveIntensityValue;
			half _SubsurfaceAmbientValue;
			half _MessageMainMask;
			half _MessageSnow;
			half _CategoryOcclusion;
			half _CategoryObject;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _CategorySubsurface;
			half _CategoryDetail;
			half _CategoryMain;
			half _VertexVariationMode;
			half _HasEmissive;
			half _DetailSnowMode;
			half _AlphaClipValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g80226 = v.vertex.xyz;
				float3 Final_VertexPosition890_g80226 = VertexPosition3588_g80226;
				
				float4 break33_g80292 = _second_uvs_mode;
				float2 temp_output_30_0_g80292 = ( v.ase_texcoord.xy * break33_g80292.x );
				float2 temp_output_29_0_g80292 = ( v.ase_texcoord3.xy * break33_g80292.y );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g80226 = ase_worldPos;
				float3 WorldPosition3905_g80226 = vertexToFrag3890_g80226;
				float2 temp_output_31_0_g80292 = ( (WorldPosition3905_g80226).xz * break33_g80292.z );
				half2 Second_UVs_Tilling7781_g80226 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7782_g80226 = ( 1.0 / Second_UVs_Tilling7781_g80226 );
				float2 lerpResult7786_g80226 = lerp( Second_UVs_Tilling7781_g80226 , Second_UVs_Scale7782_g80226 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7777_g80226 = (_SecondUVs).zw;
				float2 vertexToFrag11_g80228 = ( ( ( temp_output_30_0_g80292 + temp_output_29_0_g80292 + temp_output_31_0_g80292 ) * lerpResult7786_g80226 ) + Second_UVs_Offset7777_g80226 );
				o.ase_texcoord.zw = vertexToFrag11_g80228;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g80226;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g80238 = ( 0.0 );
				half2 Main_UVs15_g80226 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g80226 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g80226 );
				half Main_Alpha316_g80226 = tex2DNode29_g80226.a;
				float2 vertexToFrag11_g80228 = IN.ase_texcoord.zw;
				half2 Second_UVs17_g80226 = vertexToFrag11_g80228;
				float4 tex2DNode89_g80226 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g80226 );
				half Second_Alpha5007_g80226 = tex2DNode89_g80226.a;
				float4 tex2DNode35_g80226 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				half Main_Mask57_g80226 = tex2DNode35_g80226.b;
				float4 tex2DNode33_g80226 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g80226 );
				half Second_Mask81_g80226 = tex2DNode33_g80226.b;
				float lerpResult6885_g80226 = lerp( Main_Mask57_g80226 , Second_Mask81_g80226 , _DetailMaskMode);
				float clampResult17_g80249 = clamp( lerpResult6885_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80248 = _DetailMaskMinValue;
				float temp_output_10_0_g80248 = ( _DetailMaskMaxValue - temp_output_7_0_g80248 );
				half Blend_Mask_Texture6794_g80226 = saturate( ( ( clampResult17_g80249 - temp_output_7_0_g80248 ) / ( temp_output_10_0_g80248 + 0.0001 ) ) );
				half4 Normal_Packed45_g80227 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g80226 );
				float2 appendResult58_g80227 = (float2(( (Normal_Packed45_g80227).x * (Normal_Packed45_g80227).w ) , (Normal_Packed45_g80227).y));
				half2 Normal_Default50_g80227 = appendResult58_g80227;
				half2 Normal_ASTC41_g80227 = (Normal_Packed45_g80227).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g80227 = Normal_ASTC41_g80227;
				#else
				float2 staticSwitch38_g80227 = Normal_Default50_g80227;
				#endif
				half2 Normal_NO_DTX544_g80227 = (Normal_Packed45_g80227).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g80227 = Normal_NO_DTX544_g80227;
				#else
				float2 staticSwitch37_g80227 = staticSwitch38_g80227;
				#endif
				float2 temp_output_6555_0_g80226 = ( (staticSwitch37_g80227*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g80226 = (float3(temp_output_6555_0_g80226 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord1.xyz;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g80226 = appendResult7388_g80226;
				float3 worldNormal7389_g80226 = float3(dot(tanToWorld0,tanNormal7389_g80226), dot(tanToWorld1,tanNormal7389_g80226), dot(tanToWorld2,tanNormal7389_g80226));
				half3 Main_NormalWS7390_g80226 = worldNormal7389_g80226;
				float4 break33_g80300 = _detail_mesh_mode;
				float temp_output_30_0_g80300 = ( IN.ase_color.r * break33_g80300.x );
				float temp_output_29_0_g80300 = ( IN.ase_color.g * break33_g80300.y );
				float temp_output_31_0_g80300 = ( IN.ase_color.b * break33_g80300.z );
				float lerpResult7836_g80226 = lerp( ((Main_NormalWS7390_g80226).y*0.5 + 0.5) , ( temp_output_30_0_g80300 + temp_output_29_0_g80300 + temp_output_31_0_g80300 + ( IN.ase_color.a * break33_g80300.w ) ) , saturate( _DetailMeshMode ));
				float clampResult17_g80247 = clamp( lerpResult7836_g80226 , 0.0001 , 0.9999 );
				float temp_output_7_0_g80246 = _DetailMeshMinValue;
				float temp_output_10_0_g80246 = ( _DetailMeshMaxValue - temp_output_7_0_g80246 );
				half Blend_Mask_Mesh1540_g80226 = saturate( ( ( clampResult17_g80247 - temp_output_7_0_g80246 ) / ( temp_output_10_0_g80246 + 0.0001 ) ) );
				float clampResult17_g80277 = clamp( ( Blend_Mask_Texture6794_g80226 * Blend_Mask_Mesh1540_g80226 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g80278 = _DetailBlendMinValue;
				float temp_output_10_0_g80278 = ( _DetailBlendMaxValue - temp_output_7_0_g80278 );
				half Blend_Mask147_g80226 = ( saturate( ( ( clampResult17_g80277 - temp_output_7_0_g80278 ) / ( temp_output_10_0_g80278 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g80226 = lerp( Main_Alpha316_g80226 , Second_Alpha5007_g80226 , Blend_Mask147_g80226);
				float lerpResult6785_g80226 = lerp( ( Main_Alpha316_g80226 * Second_Alpha5007_g80226 ) , lerpResult6153_g80226 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g80226 = lerpResult6785_g80226;
				#else
				float staticSwitch6158_g80226 = Main_Alpha316_g80226;
				#endif
				half Blend_Alpha6157_g80226 = staticSwitch6158_g80226;
				half AlphaTreshold2132_g80226 = _AlphaClipValue;
				float temp_output_3_0_g80238 = ( Blend_Alpha6157_g80226 - AlphaTreshold2132_g80226 );
				float Alpha19_g80238 = temp_output_3_0_g80238;
				float temp_output_15_0_g80238 = 0.01;
				float Treshold19_g80238 = temp_output_15_0_g80238;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#else
				clip(Alpha19_g80238 - Treshold19_g80238);
				#endif
				#endif
				}
				half Final_Clip914_g80226 = Alpha19_g80238;
				

				surfaceDescription.Alpha = Final_Clip914_g80226;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "TVEShaderLiteGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/Shader Graph/FallbackError"
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,384;Inherit;False;1280.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1281.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1278.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;171;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;172;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;173;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;174;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;397;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;175;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;386;-1088,512;Inherit;False;Compile All Shaders;-1;;76745;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;813;-1664,512;Inherit;False;Define ShaderType Prop;178;;76747;96e31a47d32deff49ba83d5b364f536d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;814;-1280,512;Inherit;False;Compile Lite;-1;;80224;e24430099ff589f45be1dd88516fd075;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;816;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;817;-1152,-384;Float;False;True;-1;2;TVEShaderLiteGUI;0;24;BOXOPHOBIC/The Vegetation Engine Lite/Geometry/Prop Standard Lit;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;2;True;_render_cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_render_zw;True;0;False;;True;False;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;True;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/Shader Graph/FallbackError;0;0;Standard;41;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638206966259286303;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;1;638206966314407997;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;0;638206966338476719;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;818;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;819;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;820;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;821;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;822;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;823;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;824;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;825;-1152,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;811;-2176,-384;Inherit;False;Base Lite;0;;80226;1f5c35e7b395a0a498f1140933e5e744;36,3880,1,4179,1,6791,1,1298,1,6792,1,1300,1,7741,1,6116,1,7558,1,1718,1,1717,1,1715,1,6729,1,1776,0,7611,0,3501,0,2807,0,6206,0,6320,1,6166,1,4837,1,6848,1,6161,1,6622,1,1737,1,1736,1,1734,1,1735,1,7560,0,7660,1,7656,1,7653,0,7652,1,7693,0,7737,1,5090,1;2;6205;FLOAT;1;False;6198;FLOAT;1;False;18;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;4867;FLOAT3;534
Node;AmplifyShaderEditor.FunctionNode;812;-1920,512;Inherit;False;Define Lighting Standard;176;;80305;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;815;-2176,512;Inherit;False;Define Pipeline Universal;-1;;80306;71dc7add32e5f6247b1fb74ecceddd3e;0;0;1;FLOAT;529
WireConnection;817;0;811;0
WireConnection;817;1;811;528
WireConnection;817;2;811;2489
WireConnection;817;3;811;529
WireConnection;817;4;811;530
WireConnection;817;5;811;531
WireConnection;817;6;811;532
WireConnection;817;8;811;534
ASEEND*/
//CHKSM=1EA82D7662EF1BCF8E53E57B9E75B3530A874A42