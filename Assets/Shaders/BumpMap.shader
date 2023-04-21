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
		
			//Initialize the values and textures for the shader
			sampler2D _MainTex;
			sampler2D _BumpMap;
			float _BumpScale;
			float4 _Color;

			//Input struct
			struct Input {
				float2 uv_MainTex;
				float2 uv_BumpMap;
			};

			//standard surface shader
			void surf (Input IN, inout SurfaceOutput o)
			{
				fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color; //use the main texture to determine the base color of the objects albedo, multiply with color variable
				o.Albedo = c.rgb;
				
				o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap)).rgb; //Use bumpmap to determine the normal of the object
				o.Normal *= float3(_BumpScale, _BumpScale, 1); //Scale bump map intensity
			}
        ENDCG
    }
    FallBack "Diffuse"
}
