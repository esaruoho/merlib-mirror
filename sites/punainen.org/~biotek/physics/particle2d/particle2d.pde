int xlen=50;
int ylen=50;

double[] yrr = new double[xlen*ylen];
double[] yii = new double[xlen*ylen];
double[] yr = new double[xlen*ylen];
double[] yi = new double[xlen*ylen];
double[] dyr = new double[xlen*ylen];
double[] dyi = new double[xlen*ylen];
double[] packet = new double[xlen*ylen];

double timediv=800;
double dt=1/timediv;

void setup() 
{
  size(xlen*2, ylen*2);
  noStroke();
  frameRate(5);

  background(00);

  for(int i=0; i<xlen*ylen; i++){
    yrr[i]=yii[i]=yr[i]=yi[i]=dyr[i]=dyi[i]=packet[i]=0.0;
  }

  for(int dy=0;dy<ylen;dy++){
    for(int dx=0;dx<xlen;dx++){
      float ax=dx-xlen/2;
      float ay=dy-ylen/2;
      float r=sqrt(ax*ax+ay*ay);
      float a;
      if(r<14.0){
        a=cos(r/(2.0*14.0)*3.14159265358979);
        a=a*a*a;
      }else{
        a=0;
      }
      yr[dx+dy*ylen]=a*cos((float)dx/(float)xlen*5.0*3.14159265358979);
      yi[dx+dy*ylen]=a*sin((float)dx/(float)xlen*5.0*3.14159265358979);
    }
  }  

  // inital displacement
  /*
  if(true){
    // set up width of the particle wave packet
    for(int i=0;i<len/2;i++){
      double a;
      a=sin((i/(len/2.0))*3.14159265358979);
      yr[len/2+i-len/2/2]=a*a*a;
    }
    // set up momentum of the particle
    for(int i=0;i<len;i++){
      yi[i]=yr[i]*cos(64.0*i/len*3.14159265358979);
    }
    for(int i=0;i<len;i++){
      yr[i]=yr[i]*sin(64.0*i/len*3.14159265358979);
    }
  }
  else{
    yr[len/2]=180;
  }
  */

  for(int dy=1;dy<ylen-1;dy++){
    for(int dx=1;dx<xlen-1;dx++){
      //dyr[dx+dy*ylen]=dt*(yi[(dx+1)+(dy)*ylen]+yi[(dx-1)+(dy)*ylen]-4*yi[(dx)+(dy)*ylen]
      //                   +yi[(dx)+(dy+1)*ylen]+yi[(dx)+(dy-1)*ylen]);
      dyi[dx+dy*ylen]=-0.5*dt*(yr[(dx+1)+(dy)*ylen]+yr[(dx-1)+(dy)*ylen]-4*yr[(dx)+(dy)*ylen]
                          +yr[(dx)+(dy+1)*ylen]+yr[(dx)+(dy-1)*ylen]);
    }
  }
  
  /*
  for (int i=1;i<len-1;i++){    
    dyr[i]=dt*(yi[i-1]+yi[i+1]-2*yi[i]);
    dyi[i]=-dt*(yr[i-1]+yr[i+1]-2*yr[i]);
  }
  */
}

void draw() 
{
  int px,py;
  int c=(int)timediv;

  for (int jj=0; jj<c; jj++) {            
    for(int dy=1;dy<ylen-1;dy++){
      for(int dx=1;dx<xlen-1;dx++){
        yrr[dx+dy*ylen]=yr[dx+dy*ylen]+dyr[dx+dy*ylen]*0.5;
        yii[dx+dy*ylen]=yi[dx+dy*ylen]+dyi[dx+dy*ylen]*0.5;
      }
    }
    /*
    for (int i=1; i<len-1; i++) {       
      yrr[i]=yr[i]+dyr[i]/2;
      yii[i]=yi[i]+dyi[i]/2;
    }
    */

    for(int dy=1;dy<ylen-1;dy++){
      for(int dx=1;dx<xlen-1;dx++){
        dyr[dx+dy*ylen]=dt*(yi[(dx+1)+(dy)*ylen]+yi[(dx-1)+(dy)*ylen]-4*yi[(dx)+(dy)*ylen]
                           +yi[(dx)+(dy+1)*ylen]+yi[(dx)+(dy-1)*ylen]);
        dyi[dx+dy*ylen]=-dt*(yr[(dx+1)+(dy)*ylen]+yr[(dx-1)+(dy)*ylen]-4*yr[(dx)+(dy)*ylen]
                            +yr[(dx)+(dy+1)*ylen]+yr[(dx)+(dy-1)*ylen]);
        yr[dx+dy*ylen]=yr[dx+dy*ylen]+dyr[dx+dy*ylen];
        yi[dx+dy*ylen]=yi[dx+dy*ylen]+dyi[dx+dy*ylen];
      }
    }
    /*
    for (int i=1; i<len-1; i++) {             
      dyr[i]=dt*(yii[i-1]+yii[i+1]-2*yii[i]);
      dyi[i]=-dt*(yrr[i-1]+yrr[i+1]-2*yrr[i]);
      yr[i]=yr[i]+dyr[i];
      yi[i]=yi[i]+dyi[i];
    }
    */
  }

  // update graphics
  background(00);
  
  loadPixels();  

  for(int dy=0;dy<ylen-1;dy++){
    color col;
    int yval,a;
    for(int dx=0;dx<xlen-1;dx++){
      a=dx+dy*ylen;
      yval=(int)((yr[a]*yr[a]+yi[a]*yi[a])*520.0);
      col=color(yval,yval,yval);
      pixels[dx*2+(dy)*4*ylen]=col;
      pixels[dx*2+1+(dy)*4*ylen]=col;
      pixels[dx*2+(dy)*4*ylen+ylen*2]=col;
      pixels[dx*2+1+(dy)*4*ylen+ylen*2]=col;
    }
  }

  /*
  for(int i=0; i<len; i++){
    // plot probability density (|y|*|y|)
    py=100-(int)((yr[i]*yr[i]+yi[i]*yi[i])*64.0);
    px=i;

    if(py>200-1)
      py=200-1;
    if(py<0)
      py=0;
    
    pixels[py*len+px] = #0000ff;
  }
  */
  updatePixels();
}
