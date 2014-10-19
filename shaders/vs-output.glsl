uniform float depth;

varying vec2 vUv;
varying vec3 vEye;

void main(){
  vUv = uv;
  vec4 mvPos = modelViewMatrix * vec4( position , 1. ); 
  vec3 vEye = normalize( mvPos.xyz );
  gl_Position = projectionMatrix * mvPos;
}
