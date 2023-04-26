attribute vec4 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;

uniform vec3 BonesPosition[80];
varying vec2 vTextureCoord;
varying float PosY;


void main(void) 
{



 int BoneID = int(aVertexPosition.w*4.0);	
 mat4 ThisBoneMatrix = mat4(
 BonesPosition[BoneID+1].x,	BonesPosition[BoneID+1].y,	BonesPosition[BoneID+1].z,	0.0, 
 BonesPosition[BoneID+2].x,	BonesPosition[BoneID+2].y,	BonesPosition[BoneID+2].z,	0.0,
 BonesPosition[BoneID+3].x,	BonesPosition[BoneID+3].y,	BonesPosition[BoneID+3].z,	0.0,
 BonesPosition[BoneID].x,	BonesPosition[BoneID].y,	BonesPosition[BoneID].z,	1.0);	

	
 vec4 mvPosition = uMVMatrix * ThisBoneMatrix * vec4(aVertexPosition.xyz, 1.0);
   PosY = mvPosition.y;
   
    gl_Position = uPMatrix * CamMatrix * mvPosition;
    vTextureCoord = aTextureCoord;
    
}