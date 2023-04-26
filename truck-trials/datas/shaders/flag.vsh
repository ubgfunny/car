attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;

uniform vec4 uColors;

varying vec2 vTextureCoord;

void main(void) 
{
	vec4 mvPosition = uMVMatrix * vec4(aVertexPosition, 1.0);
 mvPosition.x += cos(uColors.a + mvPosition.x*63.0)*uColors.r*(1.0-aTextureCoord.y)*130.0;
 mvPosition.z += sin(uColors.a + mvPosition.z*91.0)*uColors.g*(1.0-aTextureCoord.y)*130.0;
 
        gl_Position = uPMatrix * CamMatrix * mvPosition;
        vTextureCoord = aTextureCoord;
}