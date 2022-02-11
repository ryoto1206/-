//座標系の設定
void xyzC(float len){//座標軸の長さを設定
  //x座標の設定
  fill(255,0,0);//色を赤に設定
  pushMatrix();//このときの座標を記録
  translate (len/2,0,0);//x座標軸の中心に移動
  box(len,1,1);//x座標軸の寸法の設定
  popMatrix();//記録した座標に戻る
  
  //y座標の設定
  fill(0,255,0);//色を緑に設定
  pushMatrix();//このときの座標を記録
  translate(0,len/2,0);///y座標軸の中心に移動
  box(1,len,1);//y座標軸の寸法の設定
  popMatrix();//記録した座標に戻る
  
  //z座標の設定
  fill(0,0,255);//色を青に設定
  pushMatrix();//このときの座標を記録
  translate(0,0,len/2);///z座標軸の中心に移動
  box(1,1,len);//z座標軸の寸法の設定
  popMatrix();//記録した座標に戻る
  }

  
  
