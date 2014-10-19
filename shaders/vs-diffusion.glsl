

uniform sampler2D t_crystal;
varying vec2 vUv;

void main(){


  vec4 d = texture2D( t_crystal , position.xy );

  vUv = position.xy;

  vec3 pos = position.xyz - vec3( .5 , .5 , 0. ) + vec3( 0. , 0. , .1 * d.r );

  gl_PointSize = 3.;
  gl_Position = projectionMatrix * modelViewMatrix * vec4( pos * 50., 1.0 );


}
