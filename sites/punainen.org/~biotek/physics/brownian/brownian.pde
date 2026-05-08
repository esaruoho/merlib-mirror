int n=6000;

Particle[] world = new Particle[n];

PFont font;

void setup() 
{
  size(400, 400);
  noStroke();
  frameRate(0);
  smooth();

  background(00);

  for(int i=0; i<n; i++){
    world[i] = new Particle(0,0,0,0,1,-1.0);
  }

  font = loadFont("DejaVuSans-48.vlw");
  textFont(font, 12);
}

void draw() 
{
  float rate=1.0;
  float mean=0;
  float var=0;
  float k=0.65;
  float fx,fy;
  
  background(00);
  
  loadPixels();
  
  for(int i=0; i<n; i++){    
    // random walk particles
    fx=boxmuller();
    fy=boxmuller();
    fx+=-k*world[i].vx;
    fy+=-k*world[i].vy;
    world[i].force(fx,fy);
  }
  
  // plot pixels
  for(int i=0;i<n;i++){
    world[i].draw();
  }

  // calculate mean and variance
  for(int i=0;i<n;i++){
    mean+=world[i].px;
    var+=world[i].px*world[i].px;
  }
  mean=mean/n;
  var=var/n;

  updatePixels();

  text("mean: "+mean,10,394);
  text("variance: "+var,150,394);
  text("particles: "+n,290,394);
}

float boxmuller()
{
  return sqrt(-2.0*log(random(0.0001,1)))*cos(2*PI*random(0.0001,1));  
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
  }

  void draw(){
    int x,y;
  
    // plot pixel on screen
    x = floor(px+width/2);
    y = floor(height/2-py);

    if( x<width-1 && x>0 && y>0 && y<height-20 )
      pixels[y*(width)+x] = #00ff00;
  }
}
