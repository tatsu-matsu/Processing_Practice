import gab.opencv.*;
import processing.video.*;
import java.awt.*; 

Capture video;
OpenCV opencv; 
Rectangle[] faces;

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
int unk = 0;

PImage img1;     //画像を格納するための変数（PImage型）

void setup() {
  size(1440, 900);
  //fullScreen();
  background(0);
  noStroke();
  
  //ファイルから画像を読み込み、imgに格納
  img1 = loadImage("now loading.png");

  x = width/2+4;
  y = height/2-30;

  video = new Capture(this, width/2, height/2, "FaceTime HD Camera");
  opencv = new OpenCV(this, width/2, height/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);//顔用のデータをロード

  video.start();//キャプチャ開始
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
   
  image(img1, width/2-48,350,90,13);
  tint(200);
  pushMatrix();
  scale(2);//画像を二倍に
  opencv.loadImage(video);//ビデオ画像をメモリに展開
  //image(video, 0, 0 );//表示
  Rectangle[]faces = opencv.detect();//顔を検出
  println(faces.length);//検出した数をprint（printはデバッグ用に、下の黒枠に数値を表示する一般的なコマンド）

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);//検出した位置をprint
  }

  popMatrix();

  //background(255);
  fill(0, 15);
  rect(0, 0, width, height);

  if (faces.length == 1 || cnt < 6*PI) {//顔が一つ検出されて
    easing = 0.01;

    cnt=cnt+0.1;
    targetX = width/2 + 300*cos(cnt);
    targetY = height/2 + 300*sin(cnt);
    x += (targetX - x)*easing;
    y += (targetY - y)*easing;
  } else if (faces.length == 0 ) {//顔が検出されない場合
    easing = 0.02;

    cnt2++;
    if (cnt2>=40) {
      cnt2=0;      
      targetX = random(width);
      targetY = random(height);
    }    
    ram_X += (targetX - ram_X)*easing;
    ram_Y += (targetY - ram_Y)*easing;
    x += (ram_X - x)*easing;
    y += (ram_Y - y)*easing;
  }  

  if (dist(px[1], py[1], px[0], py[0] )> 30 ) { //点同士の距離30で軌跡を描く
    for (int i=num-1; i>=1; i--) {
      px[i]=px[i-1];
      py[i]=py[i-1];
    }
  }
  px[0]=x; //先頭の点のx座標
  py[0]=y; //先頭の点のy座標   

  for (int i=0; i<1; i++) {
    colorMode(HSB);
    fill(unk,80,180);
    ellipse(px[i], py[i], 20, 20);
  }
  unk += 1;
  if (unk > 255){
  unk = 0;
  }
}
