precision mediump float;
varying vec2 vTextureCoord;
uniform sampler2D Texture0;

void main(void) 
{
	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	if (textureColor.a<0.5) discard;

        gl_FragColor = textureColor;
}
