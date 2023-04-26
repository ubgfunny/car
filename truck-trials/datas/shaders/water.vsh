attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;
 
varying vec2 vTextureCoord;
varying vec4 Cols;

uniform vec4 uColors;

void main(void) 
{

        gl_Position = uPMatrix * CamMatrix * uMVMatrix * vec4(aVertexPosition.x,0.0,aVertexPosition.z, 1.0);
       
        vTextureCoord = aTextureCoord;
        vTextureCoord.x += cos( uColors.b+vTextureCoord.x*33.0-vTextureCoord.y*20.0)*0.12;
        vTextureCoord.y += sin(-uColors.b-vTextureCoord.x*10.0+vTextureCoord.y*49.0)*0.12;
		Cols = uColors;
        
}