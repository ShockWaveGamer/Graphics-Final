Shader "Custom/MudShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Water Tex", 2D) = "white" {}
		
		_FoamTex ("Foam Tex", 2D) = "white" {}
		_ScrollX ("Scroll X", Range(-5,5)) = 0.5
		_ScrollY ("Scroll Y", Range(-5,5)) = 0.5
		
		_Freq ("Frequency", Range(0, 5)) = 3
		_Speed ("Speed", Range(0, 100)) = 10
		_Amp ("Amp", Range(0, 1)) = 0.5
    }
	
    SubShader
    {
			
        CGPROGRAM
			
			#pragma surface surf Lambert vertex:vert

		    struct Input {
                float2 uv_MainTex;
                float2 uv_FoamTex;

				float3 vertColor;
            };

			sampler2D _MainTex;
			
			sampler2D _FoamTex;
			float _ScrollX;
			float _ScrollY;

		    float4 _Color;
			float _Freq;
			float _Speed;
			float _Amp;

			struct appdata {
                float4 vertex: POSITION;
				float3 normal: NORMAL;
				float4 texcoord: TEXCOORD0;
				float4 texcoord1: TEXCOORD1;
				float4 Texcoord2: TEXCOORD2;
            };
			
			void vert (inout appdata v, out Input o){
				UNITY_INITIALIZE_OUTPUT(Input, o);
				float t = _Time * _Speed;
				float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp + sin(t*2 + v.vertex.y * _Freq*2) * _Amp;
				v.vertex.y += waveHeight;

				v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
				o.vertColor = (waveHeight + 0.5);
			}

			void surf (Input IN, inout SurfaceOutput o){
				float2 newMainUV = IN.uv_MainTex + float2(_ScrollX, _ScrollY) * _Time;
				float2 newFoamUV = IN.uv_FoamTex + float2(_ScrollX, _ScrollY) * _Time * 2;
				
				float4 mainColor = tex2D(_MainTex, newMainUV);
				float4 foamColor = tex2D(_FoamTex, newFoamUV);
				
				float4 color = (mainColor + foamColor) / 2;
				o.Albedo = color * IN.vertColor.rgb;
			}
			
        ENDCG
    }
    FallBack "Diffuse"
}
