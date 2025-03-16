import peasy.*;

PeasyCam cam;

int UPP = 0;
int DWN = 1;
int RGT = 2;
int LFT = 3;
int FRT = 4;
int BCK = 5;

color[] colors = {#FFFFFF, #FFFF00, #FFA500, #FF0000, #00FF00, #0000FF};

int dim = 3;
Box[] cube = new Box[dim*dim*dim];

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++){
    for (int y = -1; y <= 1; y++){
      for (int z = -1; z <= 1; z++){

        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x,y,z);

        cube[index] = new Box(matrix, x, y, z);
        index++;

      }
    }
  }
}

void turnZ() {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].z == 1){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cube[i].x,cube[i].y);
      cube[i].update(round(matrix.m02),round(matrix.m12),round(cube[i].z));
    }
  }
}

void keyPressed(){
  if (key == '1'){
    turnZ();
  }
}

void draw() {
  background(51);
  scale(60);
  cube[2].highlight = true;
  for (int i = 0; i < cube.length; i++){
    cube[i].show();
  }
}
