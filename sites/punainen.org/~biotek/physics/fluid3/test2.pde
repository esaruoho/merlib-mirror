// global collision coefficient
float ccoeff=0.1;      

int n=1000;

Particle[] world = new Particle[n];

int iwidth=450;
int iheight=250;

float phase=0;

void setup() 
{
  size(450, 250);
  noStroke();
  frameRate(0);

  background(00);

  for(int i=0; i<n; i++){
    world[i] = new Particle(random(0,width),random(0,height),0,0,6.0);
  }
}

void draw() 
{
  float fx=0,fy=0;
  float gravity=-0.85;
  
  float dx,dy,r,f1x,f1y,irx,iry,ir;
  float ks=0.28;
  float kd=0.08;
  float rl=16.0;

  float k=0.35;

  background(00);

  loadPixels();
 
  // compute particle forces and draw
  for(int i=0; i<n; i++){
    // calculate crop box
    float cxmin,cxmax,cymin,cymax,cropRadius=40;
    cxmin=world[i].px-cropRadius/2;
    cxmax=world[i].px+cropRadius/2;
    cymin=world[i].py-cropRadius/2;
    cymax=world[i].py+cropRadius/2;

    // reset force accumulators
    fx=fy=0;

    // calculate viscous drag
    fx+=-k*world[i].vx;
    fy+=-k*world[i].vy;
    
    // calculate spatial interaction force
    for(int j=0; j<n; j++){
      if(i!=j && world[j].px<cxmax && world[j].px>cxmin && world[j].py<cymax && world[j].py>cymin)
      {
        dx=world[i].px-world[j].px;
        dy=world[i].py-world[j].py;
        r=sqrt(dx*dx+dy*dy);        
        if(r<rl){
          if(r<0.01)
            r=0.01;
          ir=1/r;
          r=ks*(r-rl);
          irx=ir*dx;
          iry=ir*dy;
          f1x=-(r+kd*((world[i].vx-world[j].vx)*irx))*irx;
          f1y=-(r+kd*((world[i].vy-world[j].vy)*iry))*iry;
          fx+=f1x;
          fy+=f1y;
        }
      }
    }

    // calculate particle collision
    /*
    for(int j=0; j<n; j++){
      float dx,dy,r,fg,ux,uy;
      float unx,uny;
      float utx,uty;
      float v1n,v1t;
      float v2n,v2t;
      float v1n_new;
      float v2n_new;
      float v1t_new;
      float v2t_new;
      float v1n_new_x,v1n_new_y;
      float v2n_new_x,v2n_new_y;
      float v1t_new_x,v1t_new_y;
      float v2t_new_x,v2t_new_y;
      if(i!=j){
        dx=world[i].px-world[j].px;
        dy=world[i].py-world[j].py;
        r=sqrt(dx*dx+dy*dy);
        // check for collision
        if(r<=(world[i].radius+world[j].radius)){
          // find normal vector
          unx=dx/r;
          uny=dy/r;
          // find unit tangent vector
          utx=-uny;
          uty=unx;
          // projection to normal and tangent vectors by dot product
          v1n=unx*world[i].vx+uny*world[i].vy;
          v1t=utx*world[i].vx+uty*world[i].vy;
          v2n=unx*world[j].vx+uny*world[j].vy;
          v2t=utx*world[j].vx+uty*world[j].vy;
          // find new tangential velocities
          v1t_new=ccoeff*v1t;
          v2t_new=ccoeff*v2t;
          // find new normal velocities
          v1n_new=ccoeff*(v1n*(world[i].mass-world[j].mass)+2*world[j].mass*v2n)
                  /(world[i].mass+world[j].mass);
          v2n_new=ccoeff*(v2n*(world[j].mass-world[i].mass)+2*world[i].mass*v1n)
                  /(world[i].mass+world[j].mass);
          // convert scalar and tangential velocities to vectors
          v1n_new_x=v1n_new*unx;
          v1n_new_y=v1n_new*uny;
          v1t_new_x=v1t_new*utx;
          v1t_new_y=v1t_new*uty;
          v2n_new_x=v2n_new*unx;
          v2n_new_y=v2n_new*uny;
          v2t_new_x=v2t_new*utx;
          v2t_new_y=v2t_new*uty;
          // add up the vectors into new velocities
          world[i].vx=v1n_new_x+v1t_new_x;
          world[i].vy=v1n_new_y+v1t_new_y;
          world[j].vx=v2n_new_x+v2t_new_x;
          world[j].vy=v2n_new_y+v2t_new_y;
        }
      }
    }
    */
    
    // calculate gravitational forces between particles    
    /*
    for(int j=0; j<n; j++){
      float ux,uy,fg,gcoeff=1.9;
      if(i!=j && world[j].px<cxmax && world[j].px>cxmin && world[j].py<cymax && world[j].py>cymin)     
      {
        // calculate the distance between the particles
        dx=world[i].px-world[j].px;
        dy=world[i].py-world[j].py;
        r=sqrt(dx*dx+dy*dy);  
        // crop radius
        if(r<1.0)
          r=1.0;
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
    */
    
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

    radius=8.0;
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

    // handle collision with boundaries
    if( px>=(width-1) || px<=0 ){
      vx *= -ccoeff;  
      vy *= -ccoeff;
      if( px<=0 )
        px = 0;
      else
        px = width-1;
    }

    if( py>=(height-1) || py<=0 ){      
      vy *= -ccoeff;
      vx *= -ccoeff;

      //if(py<=1.0)
      //  vx *= 0.7995;

      if( py<=0 )
        py = 0;
      else
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
