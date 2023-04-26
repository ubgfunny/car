attribute vec4 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform vec3 lightDirection;
uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;

varying vec2 vTextureCoord;

varying vec4 DebugNormals;


varying vec3 N;
varying vec3 v;

varying vec2 LightTex;

    
void main(void) 
{
	
vec4 p = vec4( aVertexPosition.xyz , 1.0 );
vec3 N =  normalize (uNMatrix * normalize(aVertexNormal.xyz)) ;

LightTex.y = N.y*0.49+0.5;
LightTex.x = clamp ( dot(normalize (lightDirection), N ),0.01, 0.999);

    vTextureCoord = aTextureCoord;
    gl_Position = uPMatrix * CamMatrix * uMVMatrix * p;
    DebugNormals = vec4(N, 1.0);

}