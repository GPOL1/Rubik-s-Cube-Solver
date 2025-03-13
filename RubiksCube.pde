import peasy.*;

PeasyCam cam;

int dim = 3;
Box[][][] cube = new Box[dim][dim][dim];
void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  for (int i = 0; i < dim; i++){
    for (int j = 0; j < dim; j++){
      for (int k = 0; k < dim; k++){

        float len = 50;
        float offset = ((dim - 1) * len) * 0.5;
        float x = len * i - offset;
        float y = len * j - offset;
        float z = len * k - offset; 
        cube[i][j][k] = new Box(x,y,z,len);

      }
    }
  }
}

void draw() {
  background(51);
  for (int i = 0; i < dim; i++){
    for (int j = 0; j < dim; j++){
      for (int k = 0; k < dim; k++){

        cube[i][j][k].show();

      }
    }
  }
}
