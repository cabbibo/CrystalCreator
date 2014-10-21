function CrystalPlayback( timer , crystal ){

  this.timer = timer;
  this.crystal = crystal;

  this.timingMap = crystal.timingMap;
  this.normalMap = crystal.normalMap;

  this.geometry = new THREE.PlaneGeometry( 100 , 100 );

  this.uniforms = {
    t_normal: { type:"t"    , value: normalMapper.output    },
    t_timing: { type:"t"    , value: timingMap.output       },
    lightPos: { type:"v3v"  , value: crystal.lightPositions },
    lightCol: { type:"v3v"  , value: cyrstal.lightCol       },
    timer:    this.timer
  }

  this.material = new THREE.ShaderMaterial({
    uniforms:       uniforms,
    vertexShader:   shaders.vs.playback,
    fragmentShader: shaders.fs.playback,
    transparent:    true,
    blending:       THREE.AdditiveBlending
  );

  this.body = new THREE.Mesh( this.geometry, this.material );

}

CrystalPlayback.startPlayback = function(){


}


CrystalPlayback.prototype.update = function(){



}


CrystalPlayback.prototype.update = function(){


}
