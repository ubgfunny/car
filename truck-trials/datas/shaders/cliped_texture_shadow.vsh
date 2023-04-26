attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;
uniform mat4 uShadowMatrix;
varying vec4 ShadowCoord;

varying float PosY;
 
varying vec2 vTextureCoord;

void main(void) 
{
	vec4 mvPosition = uMVMatrix * vec4(aVertexPosition, 1.0);
    PosY = mvPosition.y;
   
  vec4 PInShadow = uShadowMatrix * vec4(aVertexPosition, 1.0);
 ShadowCoord = PInShadow/PInShadow.w * 0.5 + 0.5;
 
        gl_Position = uPMatrix * CamMatrix * mvPosition;
        vTextureCoord = aTextureCoord;
}