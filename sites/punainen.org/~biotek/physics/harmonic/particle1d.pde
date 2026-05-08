int len=400;

double[] yr = new double[len];
double[] yi = new double[len];
double[] p = new double[len];
double[] v = new double[len];

double timestep=256;
double dt=1/256.0;

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(0);
  //smooth();

  background(00);

  // inital displacement
  if(true){
    // set up width of the particle wave packet
    for(int i=0;i<len/5;i++){
      double a;
      a=sin((i/(len/5.0))*3.14159265358979);      
      yr[len/2+i-len/5/2]=a*a;
    }
    // set up momentum of the particle
    for(int i=0;i<len;i++){
      //yi[i]=yr[i]*sin(64.0*i/len*3.14159265358979);
    }
    for(int i=0;i<len;i++){
      yr[i]=yr[i]*cos(64.0*i/len*3.14159265358979);
    }
  }
  else{
    yr[len/2]=180;
  }

  for(int i=0;i<len;i++){
    v[i]=0;
  }
  for(int i=0;i<len;i++){
    v[i]=(double)(i-len/2)/(len/2);
    v[i]*=2*v[i];
    //v[i]-=1.0;
  }
  
  /*
  // initial solution
  for (int i=1;i<len-1;i++){    
    //dyr[i]=dt*(yi[i-1]+yi[i+1]-2*yi[i]);
    dyi[i]=-0.5*dt*(yr[i-1]+yr[i+1]-2*yr[i]);
  }
  for (int i=1; i<len-1; i++) {       
    //yrr[i]=yr[i]+dyr[i]/2;
    yii[i]=yi[i]+dyi[i]/2;
  }
  for (int i=1; i<len-1; i++) {             
    //dyr[i]=dt*(yii[i-1]+yii[i+1]-2*yii[i]);
    dyi[i]=-0.5*dt*(yrr[i-1]+yrr[i+1]-2*yrr[i]);
    //yr[i]=yr[i]+dyr[i];
    yi[i]=yi[i]+dyi[i];
  }
  */
}

void draw() 
{
  int px,py;
  int c=(int)timestep;
  double d;

  // fast explicit visscher integration
  for (int jj=0; jj<c; jj++) {            
    for(int i=1;i<len-1;i++){
      d=-0.5*(yi[i-1]+yi[i+1]-2*yi[i])+v[i]*yi[i];
      yr[i]+=d*dt;
      d=-0.5*(yr[i-1]+yr[i+1]-2*yr[i])+v[i]*yr[i];
      p[i]=yi[i];
      yi[i]-=d*dt;
      p[i]=p[i]*yi[i]+yr[i]*yr[i];
    }
  }

  // update graphics
  background(00);
  
  loadPixels();  
  for(int i=0; i<len; i++){
    // plot potential
    py=100-(int)(v[i]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #6666ff;

    // plot probability density
    py=100-(int)(p[i]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #0000ff;

    // plot imaginary part
    py=100-(int)(yi[i]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #8f0000;

    // plot real part
    py=100-(int)(yr[i]*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #00ff00;
  }
  updatePixels();
}
