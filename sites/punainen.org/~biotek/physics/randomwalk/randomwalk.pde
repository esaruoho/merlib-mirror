int n=20000;

Particle[] world = new Particle[n];

void setup() 
{
  size(400, 400);
  noStroke();
  frameRate(0);
  smooth();

  background(00);

  for(int i=0; i<n; i++){
    world[i] = new Particle(0,0,0,0,1.0,-1.0);
  }
}

void draw() 
{
  float rate=1.0;
  
  background(00);
  
  loadPixels();
  
  for(int i=0; i<n; i++){    
    // random walk particles

    world[i].px+=random(-rate,rate);
    world[i].py+=random(-rate,rate);
  }
  
  // plot pixels
  for(int i=0;i<n;i++){
    world[i].draw();
  }

  updatePixels();
}

class Particle
{
  // position
  float px;
  float py;
  // velocity
  float vx;
  float vy;  
  // acceleration
  float ax;
  float ay;
  // mass
  float mass;
  // radius
  float radius;
  // charge
  float charge;

  // constructor
  Particle(float ipx, float ipy, float ivx, float ivy, float imass, float icharge){
    px=ipx;
    py=ipy;
    
    vx=ivx;
    vy=ivy;
    
    mass=imass;

    charge=icharge;
  } 

  // F=mA -> A=F/m
  void force(float fx, float fy){
    // calculate acceleration
    ax=fx/mass;
    ay=fy/mass;     
    // integrate velocity
    vx+=ax;
    vy+=ay;
    // integrate position
    px+=vx;
    py+=vy; 

    // handle collisions
    if( px>(width-1) || px<0 ){
      px=random(0,width-1);
      py=height-1;
      ax=ay=vx=vy=0;
      vy=-0.1;
     /*
      vx *= -ccoeff;  
      
      if( px<=0 )
        px = 0;
      else
        px = width-1;
      */
    }

    if( py>(height-1) || py<0 ){
      px=random(0,width-1);
      py=height-1;
      ax=ay=vx=vy=0;
      vy=-0.01;
      /*
      vy *= -ccoeff;

      if( py<0 )
        py = 0;
      else
        py = height-1;
      */
    }
  }

  void draw(){
    int x,y;
  
    // plot pixel on screen
    x = floor(px+width/2);
    y = floor(height/2-py);

    if( x<width-1 && x>0 && y>0 && y<height-1 )
      pixels[y*(width)+x] = #00ff00;
  }
}
