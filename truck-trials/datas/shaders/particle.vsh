attribute vec3 aVertexPosition;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat4 CamMatrix;

uniform float ParticleData[91];
 
varying vec2 vTextureCoord;
varying float MyAlpha;



void main(void) 
{
	int ParticleID = int(aVertexPosition .z);

	float Scale = ParticleData[ParticleID+3];
		
	mat4 modelView = CamMatrix;
	modelView[0][0] = Scale;  //modelView[0][1] = 0.0; modelView[0][2] = 0.0;
	modelView[1][1] = Scale;  //modelView[1][0] = 0.0; modelView[1][2] = 0.0;
	modelView[2][2] = Scale;  //modelView[2][0] = 0.0; modelView[2][1] = 0.0; 
	modelView[3][0] = 0.0;  modelView[3][1] = 0.0;  modelView[3][2] = 0.0; 
	
	vec4 Face = modelView * 
	
	vec4( aVertexPosition.x, aVertexPosition.y, 0, 1.0) * 
	
	mat4(	cos(ParticleData[ParticleID+5]),		-sin(ParticleData[ParticleID+5]),	0,	0, 
			sin(ParticleData[ParticleID+5]),		cos(ParticleData[ParticleID+5]),	0,	0,
			0,										0,									1,	0,
			0,										0,									0,	1) ;

	vec4 FaceB = CamMatrix * vec4( ParticleData[ParticleID], ParticleData[ParticleID+1], ParticleData[ParticleID+2], 1.0);
	
	Face.xyz +=FaceB.xyz;
	gl_Position = uPMatrix  * Face;
	vTextureCoord = aTextureCoord;
	MyAlpha = ParticleData[ParticleID+4];

}