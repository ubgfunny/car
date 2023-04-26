precision mediump float;
varying vec2 vTextureCoord;

uniform sampler2D Texture0;
uniform sampler2D Texture1;
uniform sampler2D Texture2;
uniform vec4 uColors;
varying vec4 DebugNormals;
varying vec2 LightTex;
varying vec4 ShadowCoord;


void main(void) 
{



	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	if (textureColor.a<0.5) discard;

	vec2 LightTx = LightTex;
	
	if (LightTx.x >0.01)
	{
	float DepthBuffer = texture2D(Texture2, ShadowCoord.xy).r;
	if ( ShadowCoord.z*0.99996>DepthBuffer) {LightTx.x = 0.01;}
	}

	textureColor.rgb *= texture2D(Texture1, LightTx).rgb*2.0;


	gl_FragColor = textureColor;
	
//gl_FragColor = DebugNormals*0.5+0.5;


}
