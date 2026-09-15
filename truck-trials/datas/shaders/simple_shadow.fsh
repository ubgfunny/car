precision mediump float;

uniform vec4 uColors;
uniform sampler2D Texture0;
uniform sampler2D Texture2;

varying vec4 ShadowCoord;
varying vec2 vTextureCoord;

void main(void) 
{
	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	
	float DepthBuffer = texture2D(Texture2, ShadowCoord.xy).r;
	if ( ShadowCoord.z>DepthBuffer+0.00005)
	{
	textureColor.rgb *=uColors.rgb;
	}
	
	gl_FragColor = textureColor;
}
