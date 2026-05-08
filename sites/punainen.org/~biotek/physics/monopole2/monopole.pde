// global collision coefficient
float ccoeff=1.0;      

int n=2;

Particle[] world = new Particle[n];

int iwidth=450;
int iheight=250;

float phase=0;

int iterations=64000;
float dt=1.0/iterations;

void setup() 
{
  size(450, 250);
  noStroke();
  frameRate(0);

  background(00);

  world[0]=new Particle(0,0,0,-4,1.0,-1.0);
  world[1]=new Particle(0,0,0,-1,1.0,1.0);
}

float boxmuller()
{
  return sqrt(-2.0*log(random(0,1)))*cos(2*PI*random(0,1));    
}

void draw() 
{
  float fx=0,fy=0;
  float gravity=0.0;
  
  float dx,dy,r,f1x,f1y,irx,iry,ir;
  float ks=0.28;
  float kd=0.08;
  float rl=16.0;

  float k=0.0;

  //background(00);

  loadPixels();
  
  /*
  for(int i=0; i<width*height; i++){
    float g=green(pixels[i]);
    g=floor(g*0.99999993);
    pixels[i]=color(0,g,0);
  }
  */

  for(int iter=0;iter<iterations;iter++){   
    // compute particle forces and draw
    for(int i=0; i<n; i++){
      // reset force accumulators
      fx=fy=0;
    
      // calculate magnetic lorentz force
      // F=q(v x B)
      float bx=0,by=0,bz=0.09;
      float lfx,lfy,lfz;

      // compute magnetic field 
      bz=zmagfield(world[i].px, world[i].py);

      // compute cross-product
      lfx=world[i].vy*bz;
      lfy=-world[i].vx*bz;
      //lfz=world[j].vx*by-world[j].vy*bx;
      fx+=lfx*world[i].charge;
      fy+=lfy*world[i].charge;
    
      // sum up gravity field
      //fy+=gravity;
    
      world[i].force(fx, fy);
    }
  }

  /*
  // plot magnetic field
  for(int py=0;py<height;py++){
    for(int px=0;px<width;px++){
      color c;
      float mag=128+zmagfield(px-width/2,py-height/2)*1024;
      c=color(mag,mag,mag);
      pixels[py*(width)+px]=c;
    }  
  }
  */
  
  for(int i=0; i<n; i++){
    world[i].draw();
  }
  
  updatePixels();
}

float zmagfield(float x, float y){
  return 0.001*sqrt(x*x+y*y);
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
  float ax,ax2;
  float ay,ay2;
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

    radius=8.0;

    charge=icharge;
  } 

  // F=mA -> A=F/m
  void force(float fx, float fy){
    // calculate acceleration with speed-verlet method
    px+=vx*dt+0.5*ax*dt*dt;
    py+=vy*dt+0.5*ay*dt*dt;    
    ax2=fx/mass;
    ay2=fy/mass;     
    vx+=0.5*(ax+ax2)*dt;
    vy+=0.5*(ay+ay2)*dt;
    ax=ax2;
    ay=ay2;
    
    /*
    // calculate acceleration with euler approximation method
    ax=fx/mass;
    ay=fy/mass;     
    // integrate velocity
    vx+=ax;
    vy+=ay;
    // integrate position
    px+=vx;
    py+=vy; 
    */
  }

  void draw(){
    int x,y;
  
    // plot pixel on screen
    x = floor(px)+width/2;
    y = floor(py)+height/2;

    if(x>0 && x<(width-1) && y>0 && y<(height-1)){    
      // only draw positive mass particles
      if(charge>0)
        pixels[y*(width)+x] = #ff0000;    
      else
        pixels[y*(width)+x] = #00ff00;  
    }
  }
}
