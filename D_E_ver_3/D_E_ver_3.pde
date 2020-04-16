import gab.opencv.*;
import processing.video.*;
import java.awt.*; 
 
 Capture video;
 OpenCV opencv; 
 Rectangle[] faces;
  
 float t;
 float x,y;
//角度
 int r;
 float easing = 0.1;
//円の半径
 void setup(){
  size(640,480);
  background(0);
  t = 0;
  r = 100;
  noStroke();
  
  video = new Capture(this, 640, 480, "FaceTime HD Camera");
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start();
 }
 
 void draw() { 
   opencv.loadImage(video);//ビデオをメモリに展開
   //image(video, 0, 0 );//表示
   
   fill(0,5);//5%透明度の描写
   rect(0,0,width,height);//画面サイズで
   
   Rectangle[]faces = opencv.detect();

      
   t += 0.05;
   float targetX = r*cos(t);
   float targetY = r*sin(t);
   
   //x += (targetX - x)*easing;//白い丸のx座標を更新
   //y += (targetY - y)*easing;//白い丸のy座標を更新
   
  fill(255);//白にする
  //ellipse(x+250,y+250,20,20);
  ellipse(targetX+640/2,targetY+480/2,20,20);//丸の場所とサイズ
    
 }
 
 //次のところ
 void captureEvent(Capture c) {
  c.read();
}
