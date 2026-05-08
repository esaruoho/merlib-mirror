int screen_width=320;
int screen_height=320;

lattice world=new lattice(screen_width,screen_height);

void setup(){
  size(320,320);
  //noStroke();
  frameRate(25);

  background(0);  

  // initial condition
  for(int j=0; j<height; j++){
     for(int i=0; i<width; i++){
       float x=i-width/2;
       float y=j-height/2;
       float r=sqrt(x*x+y*y);       
       if(r<42){
         for(int n=0; n<6; n++){
           if(random(1)>0.5)       
             world.igrid[j*width+i].setGraph(n,1);
         }
       }
     }
  }
}

void draw(){

  // propagate lattice particles
  world.propagate();

  background(0);
  
  loadPixels();

  // draw lattice state
  for(int j=0; j<height; j++){
     for(int i=0; i<width; i++){
       for(int n=0; n<6; n++){       
         if(world.igrid[j*width+i].state!=0)    
           pixels[j*width+i]=#00ff00;
       }
     }
  }

  updatePixels();
}

class node{
  int state;
  
  // constructor
  node(){
    state=0;
  }

  int returnGraph(int graphNum){
    return (int)((state>>graphNum)&1);
  }

  void setGraph(int graphNum, int graphState){
    state=(state&(~(1<<graphNum)))|(graphState<<graphNum);
  }
}

class lattice{
  
  int latticeHeight,latticeWidth;

  node[] igrid;
  node[] rgrid;

  // constructor
  lattice(int width, int height){
    latticeHeight=height;
    latticeWidth=width;
    igrid=new node[height*width];
    rgrid=new node[height*width];
    // initialize lattice state
    for(int j=0; j<latticeHeight; j++){
      for(int i=0; i<latticeWidth; i++){
        // instantiate nodes to the grid arrays
        igrid[j*width+i]=new node();
        rgrid[j*width+i]=new node();
        for(int n=0; n<6; n++){
          // set up a random initial state
          if(random(1)>0.92)
            igrid[j*width+i].setGraph(n,1);
        }
      }
    }
    //igrid[(width/2-1)*width+width/2+8].setGraph(0,1);
    //igrid[(width/2-1)*width+width/2-8].setGraph(3,1);
    //igrid[(width/2-1)*width+width/2-8].setGraph(3,1);
  }

  // do lattice propagation
  void propagate(){
    // propagate uneven lattice rows  
    for(int j=1; j<latticeHeight-1; j+=2){
      for(int i=1; i<latticeHeight-1; i++){    
        // two body collisions
        if(igrid[j*width+i].state==9){
          if(random(1)>0.5){
            rgrid[(j-1)*width+(i)].setGraph(4,1);
            rgrid[(j+1)*width+(i-1)].setGraph(1,1);            
          }  
          else{
            rgrid[(j-1)*width+(i-1)].setGraph(5,1);
            rgrid[(j+1)*width+(i)].setGraph(2,1);            
          }
        }
        else if(igrid[j*width+i].state==18){
          if(random(1)>0.5){
            rgrid[(j)*width+(i+1)].setGraph(3,1);
            rgrid[(j)*width+(i-1)].setGraph(0,1);            
          }  
          else{
            rgrid[(j-1)*width+(i-1)].setGraph(5,1);
            rgrid[(j+1)*width+(i)].setGraph(2,1);            
          }
        }
        else if(igrid[j*width+i].state==36){
          if(random(1)>0.5){
            rgrid[(j)*width+(i+1)].setGraph(3,1);
            rgrid[(j)*width+(i-1)].setGraph(0,1);            
          }  
          else{
            rgrid[(j-1)*width+(i)].setGraph(4,1);
            rgrid[(j+1)*width+(i-1)].setGraph(1,1);            
          }
        }
        // three body collisions
        else if(igrid[j*width+i].state==42){
          rgrid[(j-1)*width+(i)].setGraph(4,1);
          rgrid[(j)*width+(i-1)].setGraph(0,1);
          rgrid[(j+1)*width+(i)].setGraph(2,1);
        }
        else if(igrid[j*width+i].state==21){
          rgrid[(j)*width+(i+1)].setGraph(3,1);
          rgrid[(j-1)*width+(i-1)].setGraph(5,1);
          rgrid[(j+1)*width+(i-1)].setGraph(1,1);
        }
        else{        
          rgrid[j*width+(i-1)].setGraph(0,igrid[j*width+i].returnGraph(0));
          rgrid[(j+1)*width+(i-1)].setGraph(1,igrid[j*width+i].returnGraph(1));
          rgrid[(j+1)*width+(i)].setGraph(2,igrid[j*width+i].returnGraph(2));
          rgrid[(j)*width+(i+1)].setGraph(3,igrid[j*width+i].returnGraph(3));
          rgrid[(j-1)*width+(i)].setGraph(4,igrid[j*width+i].returnGraph(4));
          rgrid[(j-1)*width+(i-1)].setGraph(5,igrid[j*width+i].returnGraph(5));
        }
      }
    }
    // propagate even lattice rows  
    for(int j=2; j<latticeHeight-1; j+=2){
      for(int i=1; i<latticeWidth-1; i++){
        // two body collisions
        if(igrid[j*width+i].state==9){
          if(random(1)>0.5){
            rgrid[(j-1)*width+(i+1)].setGraph(4,1);
            rgrid[(j+1)*width+(i)].setGraph(1,1);            
          }  
          else{
            rgrid[(j-1)*width+(i)].setGraph(5,1);
            rgrid[(j+1)*width+(i+1)].setGraph(2,1);            
          }
        }
        else if(igrid[j*width+i].state==18){
          if(random(1)>0.5){
            rgrid[(j)*width+(i+1)].setGraph(3,1);
            rgrid[(j)*width+(i-1)].setGraph(0,1);            
          }  
          else{
            rgrid[(j-1)*width+(i)].setGraph(5,1);
            rgrid[(j+1)*width+(i+1)].setGraph(2,1);            
          }
        }
        else if(igrid[j*width+i].state==36){
          if(random(1)>0.5){
            rgrid[(j)*width+(i+1)].setGraph(3,1);
            rgrid[(j)*width+(i-1)].setGraph(0,1);            
          }  
          else{
            rgrid[(j-1)*width+(i+1)].setGraph(4,1);
            rgrid[(j+1)*width+(i)].setGraph(1,1);            
          }
        }
        // three body collisions
        else if(igrid[j*width+i].state==42){
          rgrid[(j-1)*width+(i+1)].setGraph(4,1);
          rgrid[(j)*width+(i-1)].setGraph(0,1);
          rgrid[(j+1)*width+(i+1)].setGraph(2,1);
        }
        else if(igrid[j*width+i].state==21){
          rgrid[(j)*width+(i+1)].setGraph(3,1);
          rgrid[(j-1)*width+(i)].setGraph(5,1);
          rgrid[(j+1)*width+(i)].setGraph(1,1);
        }
        else{
          rgrid[j*width+(i-1)].setGraph(0,igrid[j*width+i].returnGraph(0));
          rgrid[(j+1)*width+(i)].setGraph(1,igrid[j*width+i].returnGraph(1));
          rgrid[(j+1)*width+(i+1)].setGraph(2,igrid[j*width+i].returnGraph(2));
          rgrid[(j)*width+(i+1)].setGraph(3,igrid[j*width+i].returnGraph(3));
          rgrid[(j-1)*width+(i+1)].setGraph(4,igrid[j*width+i].returnGraph(4));
          rgrid[(j-1)*width+(i)].setGraph(5,igrid[j*width+i].returnGraph(5));
        }
      }
    }    
    // handle bounceback boundary collisions
    // left boundary, uneven rows
    for(int j=1; j<latticeHeight-1; j+=2){
      rgrid[j*width+1].setGraph(3,igrid[j*width+0].returnGraph(0));
      rgrid[(j+1)*width+0].setGraph(2,igrid[j*width+0].returnGraph(1));
      rgrid[(j-1)*width+0].setGraph(4,igrid[j*width+0].returnGraph(5));      
    }
    // left boundary, even rows
    for(int j=2; j<latticeHeight-1; j+=2){
      rgrid[j*width+1].setGraph(3,igrid[j*width+0].returnGraph(0));
      rgrid[(j+1)*width+1].setGraph(2,igrid[j*width+0].returnGraph(1));
      rgrid[(j-1)*width+1].setGraph(4,igrid[j*width+0].returnGraph(5));      
    }
    // right boundary, uneven rows
    for(int j=1; j<latticeHeight-1; j+=2){
      rgrid[j*width+width-1-1].setGraph(0,igrid[j*width+width-1].returnGraph(3));     
      rgrid[(j+1)*width+width-1-1].setGraph(1,igrid[j*width+width-1].returnGraph(2));     
      rgrid[(j-1)*width+width-1-1].setGraph(5,igrid[j*width+width-1].returnGraph(4));     
    }
    // right boundary, even rows
    for(int j=2; j<latticeHeight-1; j+=2){
      rgrid[j*width+width-1-1].setGraph(0,igrid[j*width+width-1].returnGraph(3));           
      rgrid[(j+1)*width+width-1].setGraph(1,igrid[j*width+width-1].returnGraph(2));     
      rgrid[(j-1)*width+width-1].setGraph(5,igrid[j*width+width-1].returnGraph(4));     
    }
    // top boundary    
    for(int i=1; i<latticeWidth-1; i++){
      rgrid[width+1+i].setGraph(2,igrid[0+i].returnGraph(4));
      rgrid[width+i-1].setGraph(1,igrid[0+i].returnGraph(5));
    }    
    // bottom boundary    
    for(int i=1; i<latticeWidth-1; i++){
      rgrid[(height-1-1)*width+i-1].setGraph(5,igrid[(height-1)*width+i].returnGraph(1));
      rgrid[(height-1-1)*width+i+1].setGraph(4,igrid[(height-1)*width+i].returnGraph(2));
    }        
    // form incidence from reflections
    for(int j=0; j<latticeHeight; j++){
      for(int i=0; i<latticeWidth; i++){
        igrid[j*width+i].state=rgrid[j*width+i].state;
        rgrid[j*width+i].state=0;
      }
    }
  }
}

