precision mediump float;
varying vec2 vTextureCoord;
varying vec4 vNormal;
uniform vec4 uColors;

uniform sampler2D Texture0;

void main(void) 
{

	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	if (textureColor.a<0.5) discard;
       gl_FragColor = vec4( uColors.xyz, 1.0);
}
