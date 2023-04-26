precision mediump float;
varying vec2 vTextureCoord;
uniform sampler2D Texture0;
varying float PosY;

void main(void) 
{
	if (PosY>0.0) discard;
	
	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
	if (textureColor.a<0.5) discard;
	textureColor.rg +=PosY*0.0005;
    gl_FragColor = textureColor;

}
