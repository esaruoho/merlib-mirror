int len=400;

float timediv=1.643001;
float dt=1/timediv;

float[] y = new float[len];
float[] v = new float[len];

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(100);
  smooth();

  background(00);

  // inital displacement
  for(int i=0;i<16;i++){
    y[len/2+i-16/2]=180.0*sin((i/16.0)*3.14159265358979);
  }

  // feynman halfstep
  for(int i=1;i<len-1;i++){
    v[i]+=(y[i-1]+y[i+1]-2*y[i])*dt/2;
  }
  
 }

void draw() 
{
  int px,py;

  // iterate string displacement
  for(int i=1;i<len-1;i++){
    y[i]+=v[i]*dt;
  }
  // iterate newtonian acceleration
  for(int i=1;i<len-1;i++){
    v[i]+=(y[i-1]+y[i+1]-2*y[i])*dt;
  }

  // update graphics
  background(00);
  
  loadPixels();  
  for(int i=0; i<len; i++){
    py=floor(100.0+y[i]);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #00ff00;
  }
  updatePixels();
}
