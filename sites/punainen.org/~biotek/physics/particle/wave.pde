int len=400;

double[] yrr = new double[len];
double[] yii = new double[len];
double[] yr = new double[len];
double[] yi = new double[len];
double[] dyr = new double[len];
double[] dyi = new double[len];

double timediv=200;
double dt=1/timediv;

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(100);
  smooth();

  background(00);

  // inital displacement
  if(true){
    // set up width of the particle wave packet
    for(int i=0;i<len/2;i++){
      yr[len/2+i-len/2/2]=sin((i/(len/2.0))*3.14159265358979);
    }
    // set up momentum of the particle
    for(int i=0;i<len;i++){
      yi[i]=yr[i]*cos(24.0*i/len*3.14159265358979);
    }
    for(int i=0;i<len;i++){
      yr[i]=yr[i]*sin(24.0*i/len*3.14159265358979);
    }
  }
  else{
    yr[len/2]=180;
  }

  for (int i=1;i<len-1;i++){    
    dyr[i]=dt*(yi[i-1]+yi[i+1]-2*yi[i]);
    dyi[i]=-dt*(yr[i-1]+yr[i+1]-2*yr[i]);
  }
}

void draw() 
{
  int px,py;
  int c=(int)timediv;

  for (int jj=0; jj<c; jj++) {            
    for (int i=1; i<len-1; i++) {       
      yrr[i]=yr[i]+dyr[i]/2;
      yii[i]=yi[i]+dyi[i]/2;
    }
    for (int i=1; i<len-1; i++) {             
      dyr[i]=dt*(yii[i-1]+yii[i+1]-2*yii[i]);
      yr[i]=yr[i]+dyr[i];
      dyi[i]=-dt*(yrr[i-1]+yrr[i+1]-2*yrr[i]);
      yi[i]=yi[i]+dyi[i];
    }
  }

  // update graphics
  background(00);
  
  loadPixels();  
  for(int i=0; i<len; i++){
    // plot probability density (|y|*|y|)
    py=100-(int)((yr[i]*yr[i]+yi[i]*yi[i])*32.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #0000ff;

    // plot imaginary part
    py=100-(int)(yi[i]*32.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #8f0000;

    // plot real part
    py=100-(int)(yr[i]*32.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #00ff00;
  }
  updatePixels();
}
