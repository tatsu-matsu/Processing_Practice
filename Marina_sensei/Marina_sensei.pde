// now
float x, y = 0;
// target
float targetX, targetY = 0;
// ram
float ram_X, ram_Y = 0;

float easing = 0.02;

float cnt=0;
int cnt2 = 0;

// origin
float px0, py0 = 0; // current
float px1, py1 = 0; // next

void setup(){
  size(500,500);
  background(0);
  noStroke();
}

void draw(){
   fill(0,20);
   rect(0,0,width,height);
  
  if(mousePressed){ 
    //System.out.println("pressed");
    cnt += 0.1;
    targetX = width/2 + 100*cos(cnt);//画面中心から円運動のx座標を行う
    targetY = height/2 + 100*sin(cnt);
    //System.out.print("target=("+targetX+","+ targetY+") | ");
    x += (targetX - x)*easing;
    y += (targetY - y)*easing;
    //System.out.println("(x,y)=("+x+","+y+")");
  } else {
    cnt2++;
    //System.out.print("cnt2="+cnt2+" | ");
    //System.out.print("target=("+targetX+","+targetY+") | ");
    if(cnt2>=40){
      cnt2=0;      
      targetX = random(width);
      targetY = random(height);
      //System.out.print("after: target=("+targetX+","+ targetY+") | ");
    }    
    ram_X += (targetX - ram_X)*easing;
    ram_Y += (targetY - ram_Y)*easing;
    //System.out.print("ram=("+ram_X+","+ram_Y+") | ");
    x += (ram_X - x)*easing;
    y += (ram_Y - y)*easing;
    //System.out.print("(x,y)=("+x+","+y+") | ");
  }  
  
  //System.out.println("dist="+dist(px1,py1,px0,py0));
  if(dist(px1,py1,px0,py0) > 30 ){ //点同士の距離30で軌跡を描く
    //System.out.println("Hello");
    px1 = px0;
    py1 = py0;
  } 
 
  px0=x; //先頭の点のx座標
  py0=y; //先頭の点のy座標
  //System.out.println("px0="+px0+", py0="+py0);
  
  fill(255);
  ellipse(px0,py0,20,20);

}
