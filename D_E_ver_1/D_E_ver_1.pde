 float t;
 float x,y;
//角度
 int r;
 float easing = 0.1;
//円の半径
 void setup(){
  size(500,500);
  t = 0;
  r = 100;
  noStroke();
 }
 void draw() { 
   //background(0);
   
   
   fill(0,5);
   rect(0,0,width,height);
   
   t += 0.05;
   float targetX = r*cos(t);
   float targetY = r*sin(t);
   
   //x += (targetX - x)*easing;//白い丸のx座標を更新
   //y += (targetY - y)*easing;//白い丸のy座標を更新
   
  fill(255);
  //ellipse(x+250,y+250,20,20);
  ellipse(targetX+250,targetY+250,20,20);
 }
