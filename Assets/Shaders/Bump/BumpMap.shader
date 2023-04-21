Shader "Custom/BumpMap"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}
		_BumpScale ("Normal Scale", Range(0, 2)) = 0.2
    }
    SubShader
    {
		CGPROGRAM
			#pragma surface surf Lambert
		
			sampler2D _MainTex;
			sampler2D _BumpMap;
			float _BumpScale;
			float4 _Color;

			struct Input {
				float2 uv_MainTex;
				float2 uv_BumpMap;
			};

			void surf (Input IN, inout SurfaceOutput o)
			{
				fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
				o.Albedo = c.rgb;
				o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap)).rgb;
				o.Normal *= float3(_BumpScale, _BumpScale, 1);
			}
        ENDCG
    }
    FallBack "Diffuse"
}
