class obstacle{
  float x;
  float y;
  float w;
  float h;
  
  obstacle(float X, float Y, float W, float H){
    x=X;
    y=Y;
    w=W;
    h=H;
  }
  
  void show() {
    rect(x,y,w,h);
  }
}
