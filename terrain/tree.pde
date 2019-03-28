class tree {
  int x;
  int y;
  int z;
  int h;
  tree (int x, int y, int z) {
    this.x=x;
    this.y=y;
    this.z=z;
    h=int(random(7,10));
  }
  void show() {
    //if ( this.x > transX-renderdist && this.x <transX+renderdist && this.y > transY-renderdist && this.y < transY+renderdist) {
      pushMatrix();
      translate(x+0.5, y+0.5, z);
      //for (int i =0; i<h;i++) {
        translate(0,0,ceil(-h/2+1));
        fill(200,0,0);
        box(1,1,h);
        //translate(0,0,-1);
      //}
      translate(0,0,ceil(-h/2+1));
      fill(0,200,0);
      box(5);
      popMatrix();
    //}
  }
  
}
