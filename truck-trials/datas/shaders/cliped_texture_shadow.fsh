precision mediump float;
varying vec2 vTextureCoord;
uniform sampler2D Texture0;
uniform sampler2D Texture1;

uniform vec4 uColors;

varying float PosY;
varying vec4 ShadowCoord;

void main(void) 
{
	if (PosY>0.0) discard;
	
	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	if (textureColor.a<0.5) discard;

	float DepthBuffer = texture2D(Texture1, ShadowCoord.xy).r;
	if ( ShadowCoord.z>DepthBuffer+0.00005)
	{
	textureColor.rgb*=uColors.rgb;
	}

	textureColor.rg +=PosY*0.0005;
    gl_FragColor = textureColor;

}
