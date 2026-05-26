// actual simulation area plus absorbing boundaries
int len=400;
int slen=(len+2*(len/2));
int ilen=len+len/2;

double[] yrr = new double[slen];
double[] yii = new double[slen];
double[] yr = new double[slen];
double[] yi = new double[slen];
double[] dyr = new double[slen];
double[] dyi = new double[slen];

double [] v = new double[slen];

double timediv=100;
double dt=(1/timediv);

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(50);
  smooth();

  background(00);

  // init potential
  for(int i=0;i<slen;i++){
    v[i]=0.0;
  }

  for(int i=slen/2+50;i<slen/2+40+50;i++){
    v[i]=-0.45;
  }
  
  // inital displacement
  if(true){
    // set up width of the particle wave packet
    for(int i=200;i<300;i++){
      yr[i]=sin(((float)(i-200)/(float)(100))*3.14159265358979);
      yr[i]*=yr[i];
    }
    
    // set up momentum of the particle
    for(int i=200;i<200+400;i++){
      yi[i]=yr[i]*cos(6*32.0*i/slen*3.14159265358979);
    }
    for(int i=200;i<200+400;i++){
      yr[i]=yr[i]*sin(6*32.0*i/slen*3.14159265358979);
    }
  }
  else{
    yr[slen/2]=1.0;
  }

  for (int i=1;i<slen-1;i++){    
    dyr[i]=dt*(yi[i-1]+yi[i+1]-2*yi[i]+v[i]*yii[i]);
    dyi[i]=-dt*(yr[i-1]+yr[i+1]-2*yr[i]+v[i]*yrr[i]);
  }
}

void draw() 
{
  int px,py;
  int c=(int)timediv;

  for (int jj=0; jj<c; jj++) {            
    for (int i=1; i<slen-1; i++) {       
      yrr[i]=yr[i]+dyr[i]*0.5;
      yii[i]=yi[i]+dyi[i]*0.5;
    }
    for (int i=1; i<slen-1; i++) {             
      dyr[i]=dt*(yii[i-1]+yii[i+1]-2*yii[i]+v[i]*yii[i]);
      yr[i]=yr[i]+dyr[i];
      dyi[i]=-dt*(yrr[i-1]+yrr[i+1]-2*yrr[i]+v[i]*yrr[i]);
      yi[i]=yi[i]+dyi[i];
    }
    for (int i=0; i<200; i++){
      yr[i]=0.9998*yr[i];
      yi[i]=0.9998*yi[i];
    }
    for (int i=200+400; i<800; i++){
      yr[i]=0.9998*yr[i];
      yi[i]=0.9998*yi[i];
    }
  }
  
  // update graphics
  background(00);
  
  loadPixels();  
  for(int i=0; i<len; i++){
    // plot potential
    py=100+(int)(v[i+len/2]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #a0a0a0;

    /*
    // plot imaginary part
    py=100-(int)(yi[i+len/2]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #8f0000;

    // plot real part
    py=100-(int)(yr[i+len/2]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #00ff00;
    */
    
    // plot probability density (|y|*|y|)
    py=100-(int)((yr[i+len/2]*yr[i+len/2]+yi[i+len/2]*yi[i+len/2])*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #0000ff;
  }
  updatePixels();
}
