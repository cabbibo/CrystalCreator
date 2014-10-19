uniform float depth;
uniform vec3 lightPos;

varying vec2 vUv;
varying vec3 vEye;
varying vec3 vLight;

varying vec3 vMVPos;
varying vec3 vMPos;
void main(){
  vUv = uv;
  
  vMVPos = (modelViewMatrix * vec4( position , 1. )).xyz; 
  vMPos  = (modelMatrix * vec4( position , 1. )).xyz; 

  vLight = normalize((modelMatrix * vec4( position , 1. )).xyz - lightPos); 

  gl_Position = projectionMatrix * modelViewMatrix * vec4( position , 1. );

}
