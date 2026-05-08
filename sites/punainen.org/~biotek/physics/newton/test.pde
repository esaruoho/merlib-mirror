float xvelocity = 4.923525;
float yvelocity = 0;

float xacc = 0;
float yacc = 0;

float px = 0;
float py = 0;

float mass = 1;

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(100);
  smooth();

  background(00);

  // Set the starting position of the shape
  px = width/2;
  py = height;
}

void draw() 
{
  int x,y;
  float ccoeff=0.49;      // collision coefficient
  
  // wipe screen
  //
  //background(00);

  xvelocity += 0;
  yvelocity += mass*(-0.325);

  px += xvelocity;
  py += yvelocity;

  // handle collisions
  //
  if( px>width || px<0 ){
    xvelocity *= -1;  

    // inelastic collision
    if(xvelocity>0)
      xvelocity -= mass*ccoeff;
    else
      xvelocity += mass*ccoeff;
    
    // don't lose energy into discrete time resolution  
    if( px<=0 )
      px = -px;
    else
      px = 2*width-px;
  }

  if( py>height || py<0 ){
    yvelocity *= -1;

    // inelastic collision
    if(yvelocity>0)
      yvelocity -= mass*ccoeff;
    else
      yvelocity += mass*ccoeff;
    
    // don't lose energy into discrete time resolution
    if( py<=0 )
      py = -py;
    else
      py = 2*height-py;
  }

  // plot pixel on screen
  //
  x = floor(px);
  y = floor(height-py);

  if( x>width-1 )
    x = width-1;
  if( x<0 )
    x = 0;
  if( y>height-1 )
    y = height-1;
  if( y<0 )
    y = 0;
    
  loadPixels();
  pixels[y*width+x] = #00ff00;
  updatePixels();
}
