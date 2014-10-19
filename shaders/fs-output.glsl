uniform sampler2D t_normal;

uniform float depth;

varying vec2 vUv;
varying vec3 vEye;

void main(){

  vec4 normal = texture2D( t_normal , vUv );
  gl_FragColor = abs(dot(normal,vEye))* vec4(.1);

}


