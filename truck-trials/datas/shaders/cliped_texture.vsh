attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;

varying float PosY;
 
varying vec2 vTextureCoord;

void main(void) 
{
	vec4 mvPosition = uMVMatrix * vec4(aVertexPosition, 1.0);
   PosY = mvPosition.y;
   
   
        gl_Position = uPMatrix * CamMatrix * mvPosition;
        vTextureCoord = aTextureCoord;
}