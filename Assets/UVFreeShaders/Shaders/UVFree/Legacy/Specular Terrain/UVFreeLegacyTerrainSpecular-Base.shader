Shader "Hidden/UVFree/Terrain/LegacySpecular-Base" {
	Properties {
		_SpecColor ("Specular Color", Color) = (0.5, 0.5, 0.5, 1.0)
		_Shininess ("Shininess", Range (0.03, 1.0)) = 0.078125
		_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" {}

		// used in fallback on old cards
		_Color ("Main Color", Color) = (1.0,1.0,1.0,1.0)
		
		[Toggle(_UVFREE_RIM)] _UVFreeRim ("Use Rim Lighting", Float) = 0.0
		_RimMultiplier ("Rim Multiplier", Range(0.0,8.0)) = 0.2
		_RimColor ("Rim Color (RGB) Strength (A)", Color) = (1.0,1.0,1.0,1.0)
		_RimPower ("Rim Power", Range(0.0,16.0)) = 5.0
	}

	SubShader { 
		Tags {
			"RenderType" = "Opaque"
			"Queue" = "Geometry-100"
		}
		LOD 200

		CGPROGRAM
		#pragma surface surf BlinnPhong fullforwardshadows
		#pragma multi_compile __ _UVFREE_RIM
		
		sampler2D _MainTex;
		half _Shininess;
		fixed4 _RimColor;
		half _RimPower;
		half _RimMultiplier;
		
		struct Input {
			float2 uv_MainTex;
			#ifdef _UVFREE_RIM
				fixed3 viewDir;
			#endif			
		};

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 tex = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = tex.rgb;
			o.Gloss = tex.a;
			o.Alpha = 1.0f;
			o.Specular = _Shininess;
			
			// RIM
			//
			#ifdef _UVFREE_RIM
				half rimStrength = 1.0 - max(0.0, dot(normalize(IN.viewDir), normalize(o.Normal)));
				o.Emission = _RimMultiplier * _RimColor.rgb * pow(rimStrength, _RimPower) * _RimColor.a;
			#endif			
		}
		ENDCG
	}

	FallBack "Legacy Shaders/Specular"
}
