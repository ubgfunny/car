precision mediump float;
varying vec2 vTextureCoord;
uniform sampler2D Texture0;
varying float MyAlpha;

void main(void) 
{
	vec4 textureColor = texture2D(Texture0, vTextureCoord.st);
   textureColor.a *=MyAlpha;
   
        gl_FragColor = textureColor;
}
