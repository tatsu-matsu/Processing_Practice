/*
マウス座標を白い丸が追いかけるサンプル
微妙にeasingをかけて気持ちよく
*/

float x;
float y;
float easing = 0.05;//この値で追従の仕方が変わる


void setup(){
 size(600,400); //ウインドウサイズを定義
 noStroke();//図形の描画時に枠線を描かない
}

void draw(){
  
  //background(0);
  
  //半透明な黒で、マイループ塗りつぶす＝残像が残る
  fill(0,20);
  rect(0,0,width,height);
  
  float targetX = mouseX;//目標点のx座標
  float targetY = mouseY;//目標点のy座標
  
  x += (targetX - x)*easing;//白い丸のx座標を更新
  y += (targetY - y)*easing;//白い丸のy座標を更新
  
  fill(255);
  ellipse(x,y,12,12);//丸を描画
  
  //fill(255,0,0);
  //ellipse(mouseX,mouseY,12,12);
}
