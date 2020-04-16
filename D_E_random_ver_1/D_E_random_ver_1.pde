float x;
float y;
float targetX;//目標点
float targetY;
float ram_X;//目標点2
float ram_Y;
float easing;

float cnt=0;
int cnt2=0;

int num = 12;
float[] px = new float[num];
float[] py = new float[num];

void setup(){
  size(500,500);
  background(0);
  noStroke();
}

void draw(){
   //background(255);
   fill(0,20);
   rect(0,0,width,height);
  
  if(mousePressed){
    easing = 0.02;
    
    cnt=cnt+0.1;
    targetX = width/2 + 100*cos(cnt);
    targetY = height/2 + 100*sin(cnt);
    x += (targetX - x)*easing;
    y += (targetY - y)*easing;
  }
  else{
    easing = 0.02;
    
    cnt2++;
    if(cnt2>=40){
      cnt2=0;      
      targetX = random(width);
      targetY = random(height);
    }    
    ram_X += (targetX - ram_X)*easing;
    ram_Y += (targetY - ram_Y)*easing;
    x += (ram_X - x)*easing;
    y += (ram_Y - y)*easing;
  }  
  
  if(dist(px[1],py[1],px[0],py[0] )> 30 ){ //点同士の距離30で軌跡を描く
    for(int i=num-1;i>=1;i--){
      px[i]=px[i-1];
      py[i]=py[i-1];
    }
  }
  px[0]=x; //先頭の点のx座標
  py[0]=y; //先頭の点のy座標   
   
  for(int i=0;i<1;i++){
    fill(255);
    ellipse(px[i],py[i],20,20);
  }
  
}
