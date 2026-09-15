attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;
 
varying vec2 vTextureCoord;
varying float malpha;
varying float my;

uniform vec4 uColors;

void main(void) 
{
	my = uColors.b;
	
	vec4 mvPosition = uMVMatrix * vec4(aVertexPosition.x, 10.0,aVertexPosition.z, 1.0);
     malpha = aVertexPosition.y;
     gl_Position = uPMatrix * CamMatrix * mvPosition;
     
vTextureCoord = aTextureCoord;
vTextureCoord.s -= uColors.r;
vTextureCoord.t -= uColors.g;
}