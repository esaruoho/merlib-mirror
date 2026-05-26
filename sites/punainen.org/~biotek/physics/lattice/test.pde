// global collision coefficient
float ccoeff=1.0;      

float viscosity=0.01;

int n=160;

Particle[] world = new Particle[n];

void setup() 
{
  size(200, 200);
  noStroke();
  frameRate(100);
  smooth();

  background(00);

  for(int i=0; i<n; i++){
    world[i] = new Particle(random(0,width-1),random(0,height-1),random(-2,2),random(-2,2),1);
  }
}

void draw() 
{
  float fx=0,fy=0;
  float gravity=-0.0;
  
  background(00);

  loadPixels();

  /*
  for(int i=0; i<height*width; i++){
    color a;
    int r,g,b;
    a=pixels[i];
    g=int(green(a)*0.7);
    a=color(0,g,0);
    pixels[i]=a;
  }
  */
  
  for(int i=0; i<n; i++){
    float gcoeff=1;
    float dx,dy,r,fg,ux,uy;

    fx=fy=0;
    
    // calculate gravitational forces between particles
    for(int j=0; j<n; j++){
      if(i!=j){     
        // calculate the distance between the particles
        dx=world[i].px-world[j].px;
        dy=world[i].py-world[j].py;
        r=sqrt(dx*dx+dy*dy);  
        if(r<0.1)
          r=0.1;
        // calculate magnitude of the vector
        fg=gcoeff*world[i].mass*world[j].mass/(r*r);
        // calculate vector
        ux=fg*dx/r;
        uy=fg*dy/r;
        // sum up the result
        fx+=ux;
        fy+=uy;
      }
    }

    // sum up gravity field
    fy+=gravity;
    
    world[i].force(fx, fy);
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

  // constructor
  Particle(float ipx, float ipy, float ivx, float ivy, float imass){
    px=ipx;
    py=ipy;
    
    vx=ivx;
    vy=ivy;
    
    mass=imass;
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

    // viscosity
    vx*=(1.0-viscosity);
    vy*=(1.0-viscosity);

    // handle collisions
    if( px>(width-1) || px<0 ){
      vx *= -ccoeff;  
      
      if( px<=0 )
        px = 0;
      else
        px = width-1;
    }

    if( py>(height-1) || py<0 ){
      vy *= -ccoeff;

      if( py<0 )
        py = 0;
      else if(py>(height-1))
        py = height-1;
    }
  }

  void draw(){
    int x,y;
  
    // plot pixel on screen
    x = floor(px);
    y = floor((height-1)-py);

    /*
    if( x>width-1 )
      x = width-1;
    if( x<0 )
      x = 0;
    if( y>height-1 )
      y = height-1;
    if( y<0 )
     y = 0;
    */
    
    pixels[y*(width)+x] = #00ff00;
  }
}
