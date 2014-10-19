uniform sampler2D t_og;
uniform sampler2D t_rainbow;
uniform sampler2D t_crystal;
uniform sampler2D t_matcap;
uniform sampler2D t_audio;


varying vec2 vUv;
varying vec2 vSEM;
varying vec3 vNorm;
varying float vDis;

varying float vFR;
varying vec3 vEye;
varying vec3 vLight;

void main(){


  vec4 t = texture2D( t_crystal , vUv );
  vec4 m = texture2D( t_matcap , vSEM );
  vec4 og = texture2D( t_og , vUv );

  vec4 c = texture2D( t_audio , vec2( pow(vFR ,4.) , 0. ) );

  float lamb = max(0. ,dot( -vLight ,  vNorm ) );
  vec3 refl = reflect( -vLight , vNorm );

  float rFR =  max(0. ,dot( vEye,  refl ) );

  //gl_FragColor = vec4( t.r * .5 , .1 , t.r * 2. , 1. );
  gl_FragColor =pow(rFR,5.)*vec4(1., 0. , 0. ,1.) + lamb * vec4( 0.,0.,1. ,1. );//  * vec4(1.);//* vec4(-og.xyz+ ((1.- vFR) * (vNorm * .5 + .8 ) + vFR *m.xyz ) , vDis *10. );

}


