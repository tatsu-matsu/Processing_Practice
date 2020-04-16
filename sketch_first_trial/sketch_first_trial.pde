int num = 12;//丸の数
 
 int c[] = new int[num];//各丸の色（グレースケール）
 
 int cnt=0;
 int dark_i=0;//一番暗い色の丸は何番か？
 
 
 void setup() {
   
   size(640, 480);
   noStroke();
   smooth();
   
   for (int i = 0; i < num; i++) {
     c[i] = 220;
   }
   
 }
 
 void draw() {
   
   cnt ++;  //１ループ毎にカウンとアップ
   if(cnt>=6){  //６ループ進む毎に
     dark_i ++;  //一番庫色の濃い丸をとなりに切替える
     if(dark_i>=num){
       dark_i =0;
     }
     
     for (int i = 0; i < num; i++) {
       if(i==dark_i){
         c[i] = 0;//色を一番濃く
       }
       else{
          c[i] = c[i] + 30;//色を段々薄く
          if(c[i]>=220){
            c[i] = 255;
          }
       }
     }
     
     cnt=0;
   }
   
   background(255);
   
   pushMatrix();
   
    translate(width/2,height/2);
    
    for (int i = 0; i < num; i++) {
 
      float x = 60 *cos(PI*2/num *i);
      float y = 60 *sin(PI*2/num *i);
      
      fill(131,164,250,c[i]);
      ellipse(x,y,0.03*c[i],0.03*c[i]);
    }
   
   popMatrix();
   
 }
