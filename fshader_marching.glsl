#version 110

varying vec3 fN;
varying vec3 fE;
varying vec3 fL;

uniform vec4 ambientPdk,diffusePdk,specularPdk;
uniform mat4 modelView;
uniform vec4 lightPos;
uniform float shininess;

void main()
{

	//Normalize input lighting Parameters
	vec3 N = normalize(fN);
	vec3 E = normalize(fE);
	vec3 L = normalize(fL);

	vec3 H = normalize(E+L);

	vec4 ambient = ambientPdk;

	float kD = max(dot(L,N),0.0);
	vec4 diffuse = kD * diffusePdk;

	
	float kS = pow(max(dot(N,H),0.0),shininess);
	vec4 specular = kS * specularPdk;

	if(dot(L,N)<0.0)
	{
		specular = vec4(0.0,0.0,0.0,1.0);
	}

	gl_FragColor = vec4(vec3(ambient+diffuse+specular),1.0);

	//gl_FragColor = vec4(1.0,0.0,0.0,1.0);
}