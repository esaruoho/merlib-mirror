int xlen=250;
int ylen=250;

float[] u0 = new float[xlen*ylen];
float[] u1 = new float[xlen*ylen];
float[] u2 = new float[xlen*ylen];
float[] m = new float[xlen*ylen];

float phase=0;

void setup() 
{
  size(250, 250);
  noStroke();
  frameRate(50);
  smooth();

  background(00);

  // init mass distribution
  for(int dy=1;dy<ylen-1;dy++){
    for(int dx=1;dx<xlen-1;dx++){
      m[dx+(dy)*ylen]=0.0;
    }
  }    
  // init disk
  for(int dy=1;dy<ylen-1;dy++){
    for(int dx=1;dx<xlen-1;dx++){
      float ax=dx-xlen/2;
      float ay=dy-ylen/2;
      if(sqrt(ax*ax+ay*ay)<ylen/2)
        m[dx+(dy)*ylen]=1.0;
    }
  }    

  // insert double slit
  /*
  for(int dy=0;dy<ylen/2-20;dy++){
    for(int dx=xlen/2-5;dx<xlen/2+5;dx++){
      m[dx+(dy)*ylen]=0.991;
    }
  }
  for(int dy=ylen/2-10;dy<ylen/2+10;dy++){
    for(int dx=xlen/2-5;dx<xlen/2+5;dx++){
      m[dx+(dy)*ylen]=0.01;
    }
  }      
  for(int dy=ylen/2+20;dy<ylen;dy++){
    for(int dx=xlen/2-5;dx<xlen/2+5;dx++){
      m[dx+(dy)*ylen]=0.991;
    }
  } 
  */  
}

void draw() 
{
  float gamma=0.25;
  float c0=0.9973172;
  
  // calculate so0rce
  phase += 0.0765;
  
  if(phase>2*3.141592653)
    phase -= 2*3.141592653;

  u1[xlen/2+80+(ylen/2)*ylen] += 500*sin(phase);
  //u1[xlen/2-80+(ylen/2)*ylen] -= 100*sin(phase);

  // iterate displacement
  for(int dy=1;dy<ylen-1;dy++){
    for(int dx=1;dx<xlen-1;dx++){
      float grid=u1[dx+1+(dy)*ylen]+
                 u1[dx-1+(dy)*ylen]+
                 u1[dx+(dy+1)*ylen]+
                 u1[dx+(dy-1)*ylen]-
                 4*u1[dx+(dy)*ylen];
      u0[dx+dy*ylen]=2*u1[dx+dy*ylen]-u2[dx+dy*ylen]+
                     gamma*(grid);
    }
  }
  
  for(int i=0; i<(xlen*ylen); i++){
    u2[i]=u1[i];
    u1[i]=c0*u0[i]*m[i];
  }
  
  // update graphics
  background(00);  
  loadPixels();  
  for(int dy=0; dy<ylen; dy++){
    color c;
    int yval;
    for(int dx=0; dx<xlen; dx++){
      yval=(int)(u0[dx+dy*ylen]*0.5+0.5*255);    
      if(yval>255)
        yval=255;
      else if(yval<0)
        yval=0;
      c=color(yval,yval,yval);
      pixels[dx+dy*ylen] = c;
    }
  }
  updatePixels();
}
