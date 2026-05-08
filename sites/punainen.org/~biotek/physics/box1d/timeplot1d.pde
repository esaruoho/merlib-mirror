int len=400;

double[] yr = new double[len];
double[] yi = new double[len];
double[] yi2 = new double[len];
double[] p = new double[len];
double[] v = new double[len];

float odt=64.0;

double timestep=odt*4;
double dt=1/odt;

void setup() 
{
  size(400, 200);
  noStroke();
  frameRate(0);
  //smooth();

  background(00);

  // inital value
  for(int i=0;i<len;i++){
    float pi=3.14159265358979323846264;
    float var=8;
    float k=(2.0*32.0-1.0)*pi/(2.0*len);
    float b=((float)i-(float)len/2.0);
    float a=(1.0/(sqrt(2.0*pi*var)))*exp(-b*b/(2*var*var));
    yi[i]=a*sin(k*(float)i);
    yr[i]=a*cos(k*(float)i);
  }

  for(int i=0;i<(len);i++){
    v[i]=0;
  }
  /*
  for(int i=0;i<len;i++){
    v[i]=(float)(i-len/2)/len;
    v[i]*=100*v[i];
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
    for(int i=1;i<(len)-1;i++){
      d=-0.5*(yi[i-1]+yi[i+1]-2*yi[i])+v[i]*yi[i];
      yr[i]+=d*dt;
      d=-0.5*(yr[i-1]+yr[i+1]-2*yr[i])+v[i]*yr[i];
      yi2[i]=yi[i];
      yi[i]-=d*dt;   
    }
  }

  // update probability density vector
  for(int i=0;i<len;i++){
    p[i]=yr[i]*yr[i]+yi2[i]*yi[i];
  }
  
  // update graphics
  //background(00);
  
  loadPixels();  

  // scroll
  for(int y=0;y<(200-1);y++){
    for(int i=0;i<len;i++){
      pixels[y*len+i]=pixels[(y+1)*len+i];
    }
  }

  // update new line
  for(int i=0;i<len;i++){
    float r=(float)p[i]*256*64*4;      
    color col=color(r,r,r);
    pixels[199*len+i]=col;
  }

  updatePixels();
}
