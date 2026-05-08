int len=400;

float timediv=1;
float dt=1.0/timediv;

float[] y = new float[len];
float[] v = new float[len];

float c0 = 0.991;
float c1 = 0.9993;

float tension = 1;
float mass = 8;

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(100);
  smooth();

  background(00);

  // inital displacement
  if(true){
    for(int i=0;i<16;i++){
      y[len/2+i-16/2]=180.0*sin((i/16.0)*3.14159265358979);
    }
  }
  else{
    y[len/2]=180;
  }
  
  // feynman halfstep
  for(int i=1;i<len-1;i++){
    v[i]+=(tension/mass)*(c0*(y[i-1]+y[i+1])-2*y[i])*dt/2;
  }
}

void draw() 
{
  int px,py;

  for(int n=0;n<timediv;n++){
    // iterate string displacement
    for(int i=1;i<len-1;i++){
      y[i]=c1*y[i]+v[i]*dt;
    }
    // iterate newtonian acceleration
    for(int i=1;i<len-1;i++){
      v[i]+=(tension/mass)*(c0*(y[i-1]+y[i+1])-2*y[i])*dt;
    }
  }
  
  // update graphics
  background(00);
  
  loadPixels();  
  for(int i=0; i<len; i++){
    py=floor(100.0-y[i]);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #00ff00;
  }
  updatePixels();
}
