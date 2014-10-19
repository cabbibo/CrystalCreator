uniform sampler2D t_normal;
uniform vec3 lightPos;
uniform float depth;

varying vec2 vUv;
varying vec3 vEye;
varying vec3 vLight;
varying vec3 vMVPos;
varying vec3 vMPos;
void main(){

  vec3 eye = normalize( vMVPos.xyz );
  vec3 light = normalize( vMPos.xyz - lightPos); 
  vec4 normal = texture2D( t_normal , vUv );
  gl_FragColor = abs(max(0.,dot(normalize(normal.xyz),normalize(-light))))* vec4(1.);

}


