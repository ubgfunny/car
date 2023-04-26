precision mediump float;
varying vec2 vTextureCoord;
varying float malpha;
varying float my;

uniform sampler2D Texture0;

void main(void) 
{
	float textureColor = (texture2D(Texture0, vTextureCoord.st).r+my)*malpha;	
	if (textureColor<0.3) discard;
	if (textureColor<0.5)  
	gl_FragColor = vec4(0.5,0.5,1.0,0.1);
	else
        gl_FragColor = vec4(1.0,1.0,1.0,0.25);
}
