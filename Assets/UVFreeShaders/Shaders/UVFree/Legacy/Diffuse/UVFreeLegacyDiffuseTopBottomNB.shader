// Upgrade NOTE: upgraded instancing buffer 'MyProperties' to new syntax.

Shader "UVFree/Legacy/DiffuseTopBottom Non-Batching" {
	Properties {
		// Triplanar space, for UI
		[Toggle(_UVFREE_LOCAL)] _UVFreeLocal ("Use Local Space (instead of Global)", Float) = 0.0		
		[Toggle(_UVFREE_VERTEX_COLOR)] _UVFreeVertexColor ("Use Vertex Color", Float) = 0.0
		[Toggle(_UVFREE_RIM)] _UVFreeRim ("Use Rim Lighting", Float) = 0.0
		[Toggle(_UVFREE_BOTTOM)] _UVFreeBottom ("Use Bottom", Float) = 1.0
		[Toggle(_EMISSION)] _Emission ("Use Emission", Float) = 0.0
				
		_TexPower("Texture Power", Range(0.0,20.0)) = 10.0
		_TopMultiplier ("Top Multiplier (+Y)", Range(0.0,8.0)) = 1.0
		_BottomMultiplier ("Bottom Multiplier (-Y)", Range(0.0,8.0)) = 0.0		
				
		_Color ("Tint", Color) = (1.0,1.0,1.0,1.0)
		_MainTex ("Base Color (RGB) Gloss (A)", 2D) = "white" {}
		
		_VertexColorStrength("Vertex Color Strength", Range(0.0,1.0)) = 0.0
		
		_BumpScale("Bump Scale", Range(-2.0, 2.0)) = 1.0
		_BumpMap("Normal Map", 2D) = "bump" {}
		
		_EmissionMultiplier("Emission Multiplier", Float) = 0.0
		_EmissionColor("Emission Color", Color) = (0.0,0.0,0.0)
		_EmissionMap("Emission", 2D) = "white" {}
				
		_RimMultiplier ("Rim Multiplier", Range(0.0,8.0)) = 0.0
		_RimColor ("Rim Color (RGB) Strength (A)", Color) = (1.0,1.0,1.0,1.0)
		_RimPower ("Rim Power", Range(0.0,16.0)) = 5.0
				
		_TopColor ("Tint", Color) = (1.0,1.0,1.0,1.0)
		_TopMainTex ("Base Color (RGB) Gloss (A)", 2D) = "white" {}
		
		_TopBumpScale("Bump Scale", Range(-2.0, 2.0)) = 1.0
		_TopBumpMap("Normal Map", 2D) = "bump" {}

		_TopEmissionMultiplier("Emission Multiplier", Float) = 0.0
		_TopEmissionColor("Emission Color", Color) = (0.0,0.0,0.0)
		_TopEmissionMap("Emission", 2D) = "white" {}

		_BottomColor ("Tint", Color) = (1.0,1.0,1.0,1.0)
		_BottomMainTex ("Base Color (RGB) Gloss (A)", 2D) = "white" {}
		
		_BottomBumpScale("Bump Scale", Range(-2.0, 2.0)) = 1.0
		_BottomBumpMap("Normal Map", 2D) = "bump" {}
		
		_BottomEmissionMultiplier("Emission Multiplier", Float) = 0.0
		_BottomEmissionColor("Emission Color", Color) = (0.0,0.0,0.0)
		_BottomEmissionMap("Emission", 2D) = "white" {}		
	}
	
	SubShader {
		Tags {
			"RenderType"="Opaque"
			"PerformanceChecks"="False"
			"DisableBatching"="True"
		}	

		LOD 300
		
		CGPROGRAM
				
		#pragma target 3.0
				
		#pragma shader_feature _UVFREE_LOCAL
		#pragma shader_feature _UVFREE_RIM
		#pragma shader_feature _UVFREE_BOTTOM
		#pragma shader_feature _UVFREE_VERTEX_COLOR
		#pragma shader_feature _EMISSION

		// Uncomment to enable experimental feature which flips
		// backward textures. Note: Causes some normals to be flipped.
		// #define _UVFREE_FLIP_BACKWARD_TEXTURES

		#pragma surface surf Lambert vertex:vert fullforwardshadows

		#include "UnityCG.cginc"

		// Instanced Properties
		// https://docs.unity3d.com/Manual/GPUInstancing.html
		
		UNITY_INSTANCING_BUFFER_START (MyProperties)
		UNITY_DEFINE_INSTANCED_PROP(fixed4, _Color)
#define _Color_arr MyProperties
		UNITY_INSTANCING_BUFFER_END(MyProperties)
		
		// Non-instanced properties
		//
		
		// MAIN
		half _TexPower;
		sampler2D	_MainTex;
		float4 _MainTex_ST;
		sampler2D	_BumpMap;
		half _BumpScale;
		sampler2D	_EmissionMap;
		fixed _VertexColorStrength;
		fixed4 _RimColor;
		half _RimPower;
		half _RimMultiplier;
		half _EmissionMultiplier;
		half4 _EmissionColor;

		// TOP
		sampler2D	_TopMainTex;
		sampler2D	_TopBumpMap;
		half _TopBumpScale;
		sampler2D	_TopEmissionMap;
		fixed4 _TopColor;
		half _TopMultiplier;
		float4 _TopMainTex_ST;
		half _TopEmissionMultiplier;
		half4 _TopEmissionColor;
		
		// BOTTOM
		#ifdef _UVFREE_BOTTOM
			sampler2D	_BottomMainTex;
			sampler2D	_BottomBumpMap;
			half _BottomBumpScale;
			sampler2D	_BottomEmissionMap;
			half _BottomMultiplier;
			float4 _BottomMainTex_ST;
			fixed4 _BottomColor;
			half _BottomEmissionMultiplier;
			half4 _BottomEmissionColor;			
		#endif

		struct Input {
			fixed3 powerNormal;
			fixed3 normal;
			float3 worldPos;

			#ifdef _UVFREE_RIM
				fixed3 viewDir;
			#endif

			#ifdef _UVFREE_VERTEX_COLOR
				fixed4 color:COLOR;
			#endif

			UNITY_VERTEX_INPUT_INSTANCE_ID
		};

		void vert (inout appdata_full v, out Input o) {
		
			UNITY_INITIALIZE_OUTPUT(Input,o);
						
			#ifdef _UVFREE_LOCAL
				o.normal = v.normal;
				fixed3 powerNormal = v.normal;
				fixed3 weightedPowerNormal = v.normal;
				
			#else
				fixed3 worldNormal = normalize(mul(unity_ObjectToWorld, fixed4(v.normal, 0.0)).xyz);
				o.normal = worldNormal;
				fixed3 powerNormal = worldNormal;
				fixed3 weightedPowerNormal = worldNormal;
				
			#endif	

			// texpower sets the sharpness
			powerNormal = pow(abs(powerNormal), _TexPower);
			powerNormal = max(powerNormal, 0.0001);
			powerNormal /= dot(powerNormal, 1.0);
			o.powerNormal = powerNormal;

			#ifdef _UVFREE_BOTTOM
				weightedPowerNormal.y = max(0.0, weightedPowerNormal.y)*_TopMultiplier + min(0.0, weightedPowerNormal.y)*_BottomMultiplier;
			#else
				weightedPowerNormal.y = max(0.0, weightedPowerNormal.y)*_TopMultiplier + min(0.0, weightedPowerNormal.y);
			#endif
			
			weightedPowerNormal = pow(abs(weightedPowerNormal), _TexPower);
			weightedPowerNormal = max(weightedPowerNormal, 0.0001);
			weightedPowerNormal /= dot(weightedPowerNormal, 1.0);
			
			fixed3 lerpedPowerNormal = lerp(powerNormal, weightedPowerNormal, weightedPowerNormal.y);

			#ifdef _UVFREE_LOCAL
				
				v.tangent.xyz = 
					cross(v.normal, fixed3(0.0,sign(v.normal.x),0.0)) * (lerpedPowerNormal.x)
				  + cross(v.normal, fixed3(0.0,0.0,sign(v.normal.y))) * (lerpedPowerNormal.y)
				  + cross(v.normal, fixed3(0.0,sign(v.normal.z),0.0)) * (lerpedPowerNormal.z)
				;
				
				v.tangent.w = dot(-v.normal, lerpedPowerNormal);

			#else
				
				v.tangent.xyz = 
					cross(v.normal, mul(unity_WorldToObject,fixed4(0.0,sign(worldNormal.x),0.0,0.0)).xyz * (lerpedPowerNormal.x))
				  + cross(v.normal, mul(unity_WorldToObject,fixed4(0.0,0.0,sign(worldNormal.y),0.0)).xyz * (lerpedPowerNormal.y))
				  + cross(v.normal, mul(unity_WorldToObject,fixed4(0.0,sign(worldNormal.z),0.0,0.0)).xyz * (lerpedPowerNormal.z))
				;
				
				v.tangent.w = dot(-worldNormal, lerpedPowerNormal);

			#endif				
		}
		
		void surf (Input IN, inout SurfaceOutput o) {

			fixed topLerp = smoothstep(0.0, 1.0, _TopMultiplier);
			
			#ifdef _UVFREE_BOTTOM
				fixed bottomLerp = smoothstep(0.0, 1.0, _BottomMultiplier);
			#endif
			
			fixed3 weightedPowerNormal = IN.normal;
			#ifdef _UVFREE_BOTTOM
				weightedPowerNormal.y = max(0.0, weightedPowerNormal.y)*_TopMultiplier + min(0.0, weightedPowerNormal.y)*_BottomMultiplier;
			#else
				weightedPowerNormal.y = max(0.0, weightedPowerNormal.y)*_TopMultiplier + min(0.0, weightedPowerNormal.y);
			#endif
			
			weightedPowerNormal = pow(abs(weightedPowerNormal), _TexPower);
			weightedPowerNormal = max(weightedPowerNormal, 0.0001);
			weightedPowerNormal /= dot(weightedPowerNormal, 1.0);

			fixed topBottomLerp = sign(IN.normal.y)*0.5 + 0.5;
			fixed yLerp = weightedPowerNormal.y;
			
			// TRIPLANAR UVs BASED ON WORLD OR LOCAL POSITION
			//
			
			#ifdef _UVFREE_LOCAL
				float3 pos = mul(unity_WorldToObject, float4(IN.worldPos, 1.0)).xyz;
				
				float2 posX = pos.zy;
				float2 posY = pos.xz;
				float2 posZ = float2(-pos.x, pos.y);
			#else
				float2 posX = IN.worldPos.zy;
				float2 posY = IN.worldPos.xz;
				float2 posZ = float2(-IN.worldPos.x, IN.worldPos.y);				
			#endif

			float2 xUV = posX * _MainTex_ST.xy + _MainTex_ST.zw;
			
			float2 yUVTop = posY * _TopMainTex_ST.xy + _TopMainTex_ST.zw;

			#ifdef _UVFREE_BOTTOM
			float2 yUVBottom = posY * _BottomMainTex_ST.xy + _BottomMainTex_ST.zw;
			#endif

			float2 yUV = posY * _MainTex_ST.xy + _MainTex_ST.zw;
			
			float2 zUV = posZ * _MainTex_ST.xy + _MainTex_ST.zw;
			
			#ifdef _UVFREE_FLIP_BACKWARD_TEXTURES
				fixed3 powerSign = sign(IN.normal);
				xUV.x *= powerSign.x;
				zUV.x *= powerSign.z;
				yUV.y *= powerSign.y;
				yUVTop.y *= powerSign.y;
				#ifdef _UVFREE_BOTTOM
				yUVBottom.y *= powerSign.y;
				#endif
			#endif
						
			// DIFFUSE
			//
			fixed4 tint = UNITY_ACCESS_INSTANCED_PROP (_Color_arr, _Color);

			fixed4 texX = tex2D(_MainTex, xUV) * tint;
			fixed4 texY = tex2D(_MainTex, yUV) * tint;
			fixed4 texZ = tex2D(_MainTex, zUV) * tint;

			fixed4 texTop = tex2D(_TopMainTex, yUVTop) * _TopColor;
			texTop = lerp(texY, texTop, topLerp);

			#ifdef _UVFREE_BOTTOM					
				fixed4 texBottom = tex2D(_BottomMainTex, yUVBottom) * _BottomColor;
				texBottom = lerp(texY, texBottom, bottomLerp);
				texTop = lerp(texBottom, texTop, topBottomLerp);
			#else
				texTop = lerp(texY, texTop, topBottomLerp);
			#endif
			
			fixed4 tex = 
			    lerp(texX * IN.powerNormal.x, texTop * weightedPowerNormal.x, yLerp)
			  + lerp(texY * IN.powerNormal.y, texTop * weightedPowerNormal.y, yLerp)
			  + lerp(texZ * IN.powerNormal.z, texTop * weightedPowerNormal.z, yLerp)
			;
			
			#ifdef _UVFREE_VERTEX_COLOR			 
				tex *= lerp(fixed4(1.0,1.0,1.0,1.0), IN.color, _VertexColorStrength);
			#endif
			
			o.Albedo = max(fixed3(0.001,0.001,0.001), tex.rgb);
			o.Alpha = 1.0;
			
			// NORMAL
			//
			fixed3 bumpX = UnpackScaleNormal(tex2D(_BumpMap, xUV), _BumpScale);
			fixed3 bumpY = UnpackScaleNormal(tex2D(_BumpMap, yUV), _BumpScale);
			fixed3 bumpZ = UnpackScaleNormal(tex2D(_BumpMap, zUV), _BumpScale);

			fixed3 bumpTop = UnpackScaleNormal(tex2D(_TopBumpMap, yUVTop), _TopBumpScale);
			bumpTop = lerp(bumpY, bumpTop, topLerp);

			#ifdef _UVFREE_BOTTOM
		
				fixed3 bumpBottom = UnpackScaleNormal(tex2D(_BottomBumpMap, yUVBottom), _BottomBumpScale);			
				bumpBottom = lerp(bumpY, bumpBottom, bottomLerp);
				bumpTop = lerp(bumpBottom, bumpTop, topBottomLerp);
			#else
				bumpTop = lerp(bumpY, bumpTop, topBottomLerp);
			#endif

			fixed3 bump = 
			    lerp(bumpX * IN.powerNormal.x, bumpTop * weightedPowerNormal.x, yLerp)
			  + lerp(bumpY * IN.powerNormal.y, bumpTop * weightedPowerNormal.y, yLerp)
			  + lerp(bumpZ * IN.powerNormal.z, bumpTop * weightedPowerNormal.z, yLerp)
			;
			
			o.Normal = normalize(bump);
			
			// RIM
			//
			#ifdef _UVFREE_RIM
				half rimStrength = 1.0 - max(0.0, dot(normalize(IN.viewDir), o.Normal));
				o.Emission = _RimMultiplier * _RimColor.rgb * pow(rimStrength, _RimPower) * _RimColor.a;
			#endif
			
			// EMISSION
			//
			
			#ifdef _EMISSION

				half3 emissionX = tex2D(_EmissionMap, xUV).rgb * _EmissionColor.rgb * _EmissionMultiplier;
				half3 emissionY = tex2D(_EmissionMap, yUV).rgb * _EmissionColor.rgb * _EmissionMultiplier;
				half3 emissionZ = tex2D(_EmissionMap, zUV).rgb * _EmissionColor.rgb * _EmissionMultiplier;

				half3 emissionYTop = tex2D(_TopEmissionMap, yUVTop).rgb * _TopEmissionColor.rgb * _TopEmissionMultiplier;
				emissionYTop = lerp(emissionY, emissionYTop, topLerp);

				#ifdef _UVFREE_BOTTOM
					half3 emissionYBottom = tex2D(_BottomEmissionMap, yUVBottom).rgb * _BottomEmissionColor.rgb * _BottomEmissionMultiplier;
					emissionYBottom = lerp(emissionY, emissionYBottom, bottomLerp);
					emissionYTop = lerp(emissionYBottom, emissionYTop, topBottomLerp);
				#else
					emissionYTop = lerp(emissionY, emissionYTop, topBottomLerp);				
				#endif
				
				o.Emission += 
				    lerp(emissionX * IN.powerNormal.x, emissionYTop * weightedPowerNormal.x, yLerp)
				  + lerp(emissionY * IN.powerNormal.y, emissionYTop * weightedPowerNormal.y, yLerp)
				  + lerp(emissionZ * IN.powerNormal.z, emissionYTop * weightedPowerNormal.z, yLerp)
				;
			#endif
		}
		ENDCG
	} 
	FallBack "Diffuse"	
	CustomEditor "UVFreeLegacyTopBottomGUI"
	
}
