precision mediump float;
varying vec2 vTextureCoord;
varying vec4 Cols;


uniform sampler2D Texture0;
uniform sampler2D Texture1;

void main(void) 
{
	vec4 textureColor = vec4 ( texture2D(Texture0, vTextureCoord.xy).rgb, Cols.a);

	vec2 TexBCoord = gl_FragCoord.xy;
	float WaveEffect = (1.0-gl_FragCoord.z)*0.3;	
	
	TexBCoord.x /= Cols.x;	
	TexBCoord.y /= Cols.y; 	
	TexBCoord.x = 1.0-TexBCoord.x;
	TexBCoord.x += (textureColor.r-0.3)*WaveEffect;
	TexBCoord.y += (textureColor.b-0.9)*WaveEffect;

	vec3 Reflect = texture2D(Texture1, TexBCoord.st).rgb;

	textureColor.a		+= Reflect.g+Reflect.r*0.2;
	textureColor.a		*=1.0-Reflect.b;
	textureColor.rgb	+= Reflect.g-Reflect.r*0.3;
	
	gl_FragColor = textureColor;
}
