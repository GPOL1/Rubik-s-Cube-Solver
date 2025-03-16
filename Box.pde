class Box {
  PMatrix3D matrix;
  int x;
  int y;
  int z;
  boolean highlight = false;
  
  Box(PMatrix3D m, int x_, int y_, int z_) {
    matrix = m;
    x = x_;
    y = y_;
    z = z_;
  }
  
  void update(int x_, int y_, int z_) {
    matrix.reset();
    matrix.translate(x,y,z);
    x = x_;
    y = y_;
    z = z_;
  }

  void show() {
    fill(255);
    if(highlight == true){
      fill(255,0,0);
    }
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix);

    box(1);

    popMatrix();
  }
}
