precision mediump float;
varying vec2 vTextureCoord;
 
uniform sampler2D Texture0;
uniform sampler2D Texture1;
uniform vec4 uColors;
varying vec4 DebugNormals;
varying vec2 LightTex;

void main(void) 
{



	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
		if (textureColor.a<0.5) discard;

	textureColor.rgb *= texture2D(Texture1, LightTex).rgb*2.0;

	
    gl_FragColor = textureColor*uColors;
	//gl_FragColor = DebugNormals;
}
