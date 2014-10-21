
// TODO:
// Somehow create or get  a t_og
// Somehow get t_block
// Pull out diffusion parameters into uniforms, and allow them
// to be passable!

function CrystalCreator( renderer ){


  this.crystalizing = false;

  this.size = 1024;

  this.normalMapper = new NormalMapper( this.size , renderer );
  
  this.ss = shaders.setValue( shaders.ss.diffusion , 'SIZE' , 1. / this.size );
  
  this.simulation = new PhysicsRenderer( this.size , this.ss , renderer );
  this.clock = new THREE.Clock();

  var seed = THREE.ImageUtils.loadTexture('../img/seed.png');
  var empty = THREE.ImageUtils.loadTexture('../img/empty.png');
 
  this.dT       = { type:"f" , value: 0 };
  this.time     = { type:"f" , value: 0 };
  this.t_og     = { type:"t" , value: seed };
  this.t_block  = { type:"t" , value: empty };

  this.ss.setUniform( 't_og'    , this.t_og     );
  this.ss.setUniform( 't_block' , this.t_block  );
  this.ss.setUniform( 'dT'      , this.dT       );
  this.ss.setUniform( 'time'    , this.t_og     );

  //this.depthMapper  = new DepthMapper( 1024 , renderer );

}


CrystalCreator.prototype.update = function(){

  // Make sure to only do the tough GPU
  // stuff when the simulation is actually running
  if( this.crystalizing == true ){

    this.dT.value = this.clock.getDelta();
    this.time.value += this.dT.value;

    this.simulation.update();

    var o = this.simulation.output;
    var d = this.depth;
    var s = 1 / this.size;
    this.normalMapper.createNormalMap( o , d , s );

  }


}

CrystalCreator.prototype.crystalize = function(params){

  // reset time, so that we can accurately pass
  // through information in the simulation
  this.time.value = 0;

  this.simulation.reset( this.t_og );
  this.crystalizing = true;

}



// For Others to do
CrystalCreator.prototype.createSurroundingCrystals = function(){

  // Create a canvas
  // find the surrounding crystals,
  // draw the surrounding crysals onto the image
  // return the image
  var texture = new THREE.Texture();

  return texture;

}


CrystalCreator.prototype.export = function(){

  var normalMap = this.createNormal();
  var timingMap = this.createTiming();

  var exports = { 

    x:         this.x,
    y:         this.y,
    normalMap: normalMap

  }

  return exports 

}


CrystalCreator.prototype.createNormalMap = function(){

}

CrystalCreator.prototype.createTimingMap = function(){

}



