attribute vec4 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 CamMatrix;

uniform vec3 BonesPosition[80];
 
varying vec2 vTextureCoord;
varying vec4 vNormal;


void main(void) 
{


 int BoneID = int(aVertexPosition.w*4.0);	
 mat4 ThisBoneMatrix = mat4(
 BonesPosition[BoneID+1].x,	BonesPosition[BoneID+1].y,	BonesPosition[BoneID+1].z,	0.0, 
 BonesPosition[BoneID+2].x,	BonesPosition[BoneID+2].y,	BonesPosition[BoneID+2].z,	0.0,
 BonesPosition[BoneID+3].x,	BonesPosition[BoneID+3].y,	BonesPosition[BoneID+3].z,	0.0,
 BonesPosition[BoneID].x,	BonesPosition[BoneID].y,	BonesPosition[BoneID].z,	1.0);	



vec4 mvPosition = uMVMatrix * ThisBoneMatrix * vec4(aVertexPosition.xyz, 1.0);
  
vec3 myCameraPos = vec3(0,0,0);
vec3 CameratoVecNormal = normalize( vec3(myCameraPos.x-mvPosition.x, myCameraPos.y-mvPosition.y, myCameraPos.z-mvPosition.z));

mat4 NormalMVMatrix =  uMVMatrix;
NormalMVMatrix[3][0] = 0.0; NormalMVMatrix[3][1] = 0.0; NormalMVMatrix[3][2] = 0.0;
ThisBoneMatrix[3][0] = 0.0; ThisBoneMatrix[3][1] = 0.0; ThisBoneMatrix[3][2] = 0.0;
vNormal = NormalMVMatrix*ThisBoneMatrix * vec4(aVertexNormal.xyz, 1.0);
  

mvPosition.xyz+= vNormal.xyz*5.0;
mvPosition.xyz-=CameratoVecNormal.xyz*19.0;
 
    
    gl_Position = uPMatrix * CamMatrix * mvPosition;
    vTextureCoord = aTextureCoord;
    
}