precision mediump float;
varying vec2 vTextureCoord;

uniform sampler2D Texture0;
uniform vec4 uColors;
varying float PosY;

void main(void) 
{
	if (PosY>130.0) discard;

	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	if (textureColor.a<0.5) discard;
       gl_FragColor = textureColor*uColors;
}
