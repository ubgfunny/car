precision mediump float;
varying vec2 vTextureCoord;
uniform sampler2D Texture0;
varying float PosY;

void main(void) 
{
	if (PosY<25.0) discard;
	float Alpha = texture2D(Texture0, vTextureCoord.st).a;
	if (Alpha<0.8) discard;
	gl_FragColor = vec4(1.0,1.0,1.0,1.0);
}
