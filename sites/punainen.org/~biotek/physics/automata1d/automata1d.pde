int[] rule = {0,0,1,
              0,1,0,
              1,0,0};

int worldx=600;

int[][] world = new int[4][worldx];

int frame;

void setup() 
{
  size(600, 600);
  noStroke();
  frameRate(0);
  smooth();

  // generate rule
  for(int i=0;i<9;i++){
    if(random(0,1)>0.5)
      rule[i]=1;
    else
      rule[i]=0;
  }

  // initial condition
  background(00);  
  world[0][worldx/2]=1;

  frame=0;
}

void draw() 
{  
  loadPixels();

  if(frame==height){
    // initialize state
    for(int i=0;i<width;i++){
      world[0][i]=0;
      world[1][i]=0;
      world[2][i]=0;
      world[3][i]=0;
    }
    // generate rule
    for(int i=0;i<9;i++){
      if(random(0,1)>0.5)
        rule[i]=1;
      else
        rule[i]=0;
    }
    world[0][worldx/2]=1;
    frame=0;
  }

  // roll
  for(int uy=0; uy<height-1; uy++){  
    for(int ux=0; ux<width; ux++){            
      pixels[uy*width+ux]=pixels[(uy+1)*width+ux];
    }
  }
  // update
  for(int ux=0; ux<width; ux++){  
    if(world[0][ux]==1)
      pixels[(height-1)*width+ux]=#00ff00;
    else
      pixels[(height-1)*width+ux]=#000000;

    world[3][ux]=world[2][ux];
    world[2][ux]=world[1][ux];
    world[1][ux]=world[0][ux];
  }
  // evaluate rule
  for(int ux=1; ux<width-1; ux++){
    /*  
    if((world[1][ux-1]==rule[0])&&(world[1][ux]==rule[1])&&
       (world[1][ux+1]==rule[2])&&
       (world[2][ux-1]==rule[3])&&(world[2][ux]==rule[4])&&
       (world[2][ux+1]==rule[5]))
      world[0][ux]=1;
    else
      world[0][ux]=0;
    */
    
    int sum=(world[1][ux-1]*rule[0]+world[1][ux]*rule[1]+world[1][ux+1])*rule[2]+
            (world[2][ux-1]*rule[3]+world[2][ux]*rule[4]+world[2][ux+1]*rule[5])+
            (world[3][ux-1]*rule[6]+world[3][ux]*rule[7]+world[3][ux+1]*rule[8]);
    if(sum==1)
      world[0][ux]=1;
    else
      world[0][ux]=0;
  }
  
  frame++;

  updatePixels();
}

