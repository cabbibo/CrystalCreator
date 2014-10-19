uniform sampler2D t_crystal;
varying vec2 vUv;

void main(){

  vec4 t = texture2D( t_crystal , vUv );
  gl_FragColor = vec4( t.r * .5 , .1 , t.r * 2. , 1. );

}


