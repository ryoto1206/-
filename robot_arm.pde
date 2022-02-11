//土台の寸法
float baseh=7;//土台の高さ
float basey=0;//横移動
float baset=0;//縦移動

float arm1w=15;//アーム1の幅
float arm1d=15;//アーム1の奥行
float arm1h=45;//アーム1の高さ

float arm2w=10;//アーム2の幅
float arm2d=10;//アーム2の奥行
float arm2h=50;//アーム2の高さ
 
float arm3w=5;//アーム3の幅
float arm3d=5;//アーム3の奥行
float arm3h=20;//アーム3の高さ

float arm4w=10;//つかみ部の土台の幅
float arm4d=5;//つかみ部の土台の奥行
float arm4h=2;//つかみ部の土台の高さ

float arm5w=2;//つかみ部の横部分の幅
float arm5d=5;//つかみ部の横部分の奥行
float arm5h=7;//つかみ部の横部分の高さ

float angle0=0;//土台部(座標系)の回転角度(z軸回転)
float angle1=0;//アーム1の回転角度(土台を基準としたz軸回転)
float angle2=0;//アーム2の回転角度(アーム1を基準としたx軸回転)
float angle3=0;//アーム3の回転角度(アーム2を基準としたx軸回転)
float angle4=0;//つかみ部の土台の回転角度(アーム3を基準としたz軸回転)
float angle5=0;//つかみ部の横部分の回転角度(つかみ部の土台を基準としたy軸回転)

float add = 0.5;//角度、移動の増加分

//setup 関数を開始
void setup(){
  size(1500,900,P3D);//
 camera( 0 , 300, 100, 0, 0, 0, 0, 0, -1);//視点を画面のを中心を0として画角を調整する
  stroke(0);//線を黒にする
}
void draw(){ //draw関数を開始
  background(255);//常に背景を白にする
  //キーボード関数を開始
  if(keyPressed){
  if(key=='y'){//yを押すとx軸正の方向に移動
    basey = basey + add;
  }
if(key=='Y'){//Yを押すとx軸負の方向に移動
    basey = basey - add;
   }
   if(key=='t'){//tを押すとy軸正の方向に移動
    baset = baset + add;
   }
   if(key=='T'){//Tを押すとy軸負の方向に移動
    baset = baset - add;
   }
    if(key=='a'){//aを押すと土台部(座標系)をz軸正回転
  angle0 = angle0 + add;
  }
  if(key=='A'){//Aを押すと土台部(座標系)をz軸負回転
  angle0 = angle0 - add;
  }
  if(key=='b'){//bを押すとアーム1を土台を基準としたz軸正方向に回転
  angle1 = angle1 + add;
  }
  if(key=='B'){//Bを押すとアーム1を土台を基準としたz軸負方向に回転
  angle1 = angle1 - add;
  }
  if(key=='c'){//cを押すとアーム2をアーム1を基準としたx軸正方向に回転
  angle2 = angle2 + add;
  }
  if(key=='C'){//Cを押すとアーム2をアーム1を基準としたx軸負方向に回転
  angle2 = angle2 - add;
  }
  if(key=='d'){//dを押すとアーム3をアーム2を基準としたx軸正方向に回転
  angle3 = angle3 + add;
  }
  if(key=='D'){//Dを押すとアーム3をアーム2を基準としたx軸負方向に回転
  angle3 = angle3 - add;
  }
  if(key=='e'){//eを押すとつかみ部の土台をアーム3を基準としたz軸正方向に回転
  angle4 = angle4 + add;
  }
  if(key=='E'){//Eを押すとつかみ部の土台をアーム3を基準としたz軸負方向に回転
  angle4 = angle4 - add;
  }
  if(key=='f'){//fを押すとつかみ部の横部分をつかみ部の土台を基準としたy軸正方向に回転
  angle5 = angle5 + add;
  }
  if(key=='F'){//Fを押すとつかみ部の横部分をつかみ部の土台を基準としたy軸負方向に回転
  angle5 = angle5 - add;
  }
 if((angle5>45)||(angle5<-75)){//つかみ部の横部分の回転角度を45°以上または-75°以下になると逆方向に回転する
   add =-1*add;
   }
  
  if((key=='O') || (key=='o')){//oまたはOを押すと初期値に戻る
   basey = 0;
   baset = 0;
  angle0 = 0;
  angle1 = 0;
  angle2 = 0;
  angle3 = 0;
  angle4 = 0;
  angle5 = 0;
  }
  }
  
  //土台()座標系が前後左右に移動
  translate(basey,baset,0);
 
  //土台
  rotateZ(radians(angle0));//土台部(座標系)をz軸回転
  xyzC(150);//座標軸を入れる
  translate(0,0,baseh/2);//座標を土台の中心へ移動
  fill(25);//土台の色を決定
  box(60,40,baseh);//土台の寸法を設定
  
   //キャスター
  pushMatrix();//このときの座標を記録する
  translate(26,16,-8);//一つ目のキャスターの位置に移動
  fill(25);//色の決定
  sphere(7);//キャスターの形状、寸法を設定
  translate(-52,0,0);//同様にして4つのキャスターを設定
  fill(25);
  sphere(7);
  translate(0,-32,0);
  fill(25);
  sphere(7);
  translate(52,0,0);
  fill(25);
  sphere(7);
 popMatrix();//記録した座標系に戻す
  
  //一つ目のアーム
  rotateZ(radians(angle1));//アーム1を土台を基準としたz軸方向に回転
  translate(0,0,baseh/2+arm1h/2);//アーム1の中心に移動
  fill(50);//色の決定
  box(arm1w,arm1d,arm1h);//アーム1の寸法の設定
  
  //二つ目のアーム
  translate(0,0,arm1h/2);//アーム1とアーム2の接続部分に移動
  rotateX(radians(angle2));//アーム2をアーム1を基準としたx軸方向に回転
  translate(0,0,arm2h/2);//アーム2の中心に移動
  fill(100);//色の決定
  box(arm2w,arm2d,arm2h);//アーム2の寸法の設定
  
  //三つ目のアーム
  translate(0,0,arm2h/2);//アーム2とアーム3の接続部分に移動
  rotateX(radians(angle3));//アーム3をアーム2を基準としたx軸方向に回転
  translate(0,0,arm3h/2);//アーム3の中心に移動
  fill(150);//色の決定
  box(arm3w,arm3d,arm3h);//アーム3の寸法の設定
  
  //つかみ部分土台
  translate(0,0,arm3h/2);//アーム3とつかみ部土台の接続部分に移動
  rotateZ(radians(angle4));//つかみ部の土台をアーム3を基準としたz軸方向に回転
  translate(0,0,arm4h/2);//つかみ部土台の中心に移動
  fill(200);//色の決定
  box(arm4w,arm4d,arm4h);//つかみ部土台の寸法の設定
  
  //つかみ部横①
  pushMatrix();//このときの座標を記録
  translate(arm4w/2,0,0);//つかみ部の土台と横①の接続部分に移動
  rotateY(radians(-angle5));//つかみ部の横①をのつかみ部土台を基準としたy軸方向に回転
  translate(0,0,arm5h/2);//つかみ部横①の中心に移動
  fill(200);//色の決定
  box(arm5w,arm5d,arm5h);//つかみ部横①の寸法の設定
 popMatrix();//記録した座標に戻る
 
 //つかみ部横②
 translate(-arm4w/2,0,0);//つかみ部の土台と横②の接続部分に移動
 rotateY(radians(angle5));//つかみ部の横①をのつかみ部土台を基準としたy軸方向に横①と逆に回転
 translate(0,0,arm5h/2);//つかみ部横②の中心に移動
 fill(200);//色の決定
 box(arm5w,arm5d,arm5h);//つかみ部横②の寸法の設定
 }
 
  
  
  
  

  
