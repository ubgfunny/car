attribute vec4 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform vec3 lightDirection;
uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat3 uNMatrix;
uniform mat4 uShadowMatrix;
uniform mat4 CamMatrix;

uniform vec3 BonesPosition[80];



varying vec2 vTextureCoord;
varying vec4 DebugNormals;
varying vec2 LightTex;
varying vec4 ShadowCoord;


void main(void) 
{



 int BoneID = int(aVertexPosition.w*4.0);	
 mat4 ThisBoneMatrix = mat4(
 BonesPosition[BoneID+1].x,	BonesPosition[BoneID+1].y,	BonesPosition[BoneID+1].z,	0.0, 
 BonesPosition[BoneID+2].x,	BonesPosition[BoneID+2].y,	BonesPosition[BoneID+2].z,	0.0,
 BonesPosition[BoneID+3].x,	BonesPosition[BoneID+3].y,	BonesPosition[BoneID+3].z,	0.0,
 BonesPosition[BoneID].x,	BonesPosition[BoneID].y,	BonesPosition[BoneID].z,	1.0);	
	
 mat4 ThisBoneNormalMatrix = mat4(
 BonesPosition[BoneID+1].x,	BonesPosition[BoneID+1].y,	BonesPosition[BoneID+1].z,	0.0, 
 BonesPosition[BoneID+2].x,	BonesPosition[BoneID+2].y,	BonesPosition[BoneID+2].z,	0.0,
 BonesPosition[BoneID+3].x,	BonesPosition[BoneID+3].y,	BonesPosition[BoneID+3].z,	0.0,
 0.0,0.0,0.0,	0.0);	


vec4 vNormal = ThisBoneNormalMatrix * vec4(aVertexNormal.xyz, 1.0) ;

vec3 N =  normalize (uNMatrix *  normalize(vNormal.xyz)) ;
LightTex.y = N.y*0.49+0.5;
LightTex.x = clamp ( dot(normalize (lightDirection), N ),0.01, 0.999);

//DebugNormals =  vec4(N.xyz*0.5+0.5,1.0);
//DebugNormals =  vec4(normalize(vNormal.xyz)*0.5+0.5,1.0);
 
vec4 PInShadow = uShadowMatrix * ThisBoneMatrix * vec4(aVertexPosition.xyz, 1.0);
ShadowCoord = PInShadow/PInShadow.w * 0.5 + 0.5;
 
gl_Position = uPMatrix * CamMatrix * uMVMatrix * ThisBoneMatrix * vec4(aVertexPosition.xyz, 1.0);
vTextureCoord = aTextureCoord;
    
}