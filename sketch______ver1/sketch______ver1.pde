Walker w;

void setup(){
   size(500,500);
   //create a walker object
   w = new Walker();
   background(0);
}

void draw(){
  fill(0,5);
  rect(0,0,width,height);
  //Run the Walker object
  w.step();
  w.render();
}

class Walker{
  int x,y;
  
  Walker(){
   x= width/2;
   y= height/2;
  }
  
  void render(){
    fill(255);
    ellipse(x,y,20,20);
  }
  
  void step(){
    
    int choise = int(random(4));
    
    if(choise == 0){
      x++;
    }else if (choise == 1){
      x--;
    }else if (choise == 2){
      y++;
    }else {
      y--;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}
