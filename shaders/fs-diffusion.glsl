uniform sampler2D t_og;
uniform sampler2D t_rainbow;
uniform sampler2D t_crystal;
uniform sampler2D t_matcap;
varying vec2 vUv;
varying vec2 vSEM;
varying vec3 vNorm;
varying float vDis;

varying float vFR;

void main(){


  vec4 t = texture2D( t_crystal , vUv );
  vec4 m = texture2D( t_matcap , vSEM );
  vec4 og = texture2D( t_og , vUv );

  vec4 c = texture2D( t_rainbow , vec2( abs(sin(vDis * 2.) ), 0. ) );
  //gl_FragColor = vec4( t.r * .5 , .1 , t.r * 2. , 1. );
  gl_FragColor = vec4(-og.xyz+ ((1.- vFR) * (vNorm * .5 + .8 ) + vFR *m.xyz ) , vDis *10. );

}


