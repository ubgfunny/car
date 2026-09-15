precision mediump float;
varying vec2 vTextureCoord;
varying vec4 Cols;


uniform sampler2D Texture0;
uniform sampler2D Texture1;
uniform sampler2D Texture2;

void main(void) 
{
	vec4 textureColor = vec4 ( texture2D(Texture0, vTextureCoord.xy).rgb, 1.0);

	vec2 TexBCoord = gl_FragCoord.xy;
	float WaveEffect = (1.0-gl_FragCoord.z)*0.3;	
	
	TexBCoord.x /= Cols.x;	
	TexBCoord.y /= Cols.y; 	

	vec2 TexCcoord = TexBCoord;
	vec2 textureColorB = texture2D(Texture0, vTextureCoord.yx*0.5).xy;
	TexCcoord.x -= (textureColorB.y-0.8)*WaveEffect;
	TexCcoord.y -= (textureColorB.x-0.4)*WaveEffect;

	TexBCoord.x = 1.0-TexBCoord.x;
	TexBCoord.x += (textureColor.r-0.3)*WaveEffect;
	TexBCoord.y += (textureColor.b-0.9)*WaveEffect;


	vec3 Reflect = texture2D(Texture1, TexBCoord.st).rgb;
	vec3 Refract = texture2D(Texture2, TexCcoord.st).rgb;

	textureColor.rgb *=0.4;
	textureColor.rgb += Refract.rgb*0.7;
	
	textureColor.a		*=1.0-Reflect.b;
	textureColor.rgb	+= Reflect.g*0.7;
	textureColor.rg	-= Reflect.r*0.2;


	textureColor.r *= 0.8;
	
	gl_FragColor = textureColor;
}
