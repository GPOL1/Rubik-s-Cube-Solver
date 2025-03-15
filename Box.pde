class Box {
  PMatrix3D matrix;
  
  Box(PMatrix3D m) {
    matrix = m;
  }
  
  void show() {
    fill(255);
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix);

    box(1);

    popMatrix();
  }
}
