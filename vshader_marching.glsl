#version 110 

attribute vec4 vPosition;
attribute vec3 vNormal;

varying vec3 fN;
varying vec3 fE;
varying vec3 fL;

uniform mat4 modelView;
uniform mat4 projection;
uniform vec4 lightPos;

void main()
{
	
	fN = vNormal;
	fE = vPosition.xyz;
	fL = lightPos.xyz;

	if(lightPos.w != 0.0)
	{
		fL = lightPos.xyz - vPosition.xyz;
	}

	gl_Position = projection * modelView * vPosition;
	
	 //gl_Position = vPosition; 
     //pcolor = color; 
}

