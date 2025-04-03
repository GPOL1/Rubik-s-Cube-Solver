
import peasy.*;

PeasyCam cam;

int dim = 3;
Box[] cube = new Box[dim*dim*dim];
Move move;
String turning = "";
int direction = 0;
int position = 0;

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
  move = new Move(0, 0, 0, 0);
}

void turnZ(int pos, int dir) {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].z == pos){
      animate("z", dir, pos);
    }
  }
}

void turnY(int pos, int dir) {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].y == pos){
      animate("y", dir, pos);
    }
  }
}

void turnX(int pos, int dir) {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].x == pos){
      animate("x", dir, pos);
    }
  }
}

void turnZ1(int pos, int dir) {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].z == pos){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI * dir);
      matrix.translate(cube[i].x,cube[i].y);
      cube[i].update(round(matrix.m02),round(matrix.m12),cube[i].z);
      cube[i].turnFacesZ(dir);
    }
  }
}

void turnY1(int pos, int dir) {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].y == pos){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI * dir);
      matrix.translate(cube[i].x,cube[i].z);
      cube[i].update(round(matrix.m02),cube[i].y,round(matrix.m12));
      cube[i].turnFacesY(dir);
    }
  }
}

void turnX1(int pos, int dir) {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].x == pos){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI * dir);
      matrix.translate(cube[i].y,cube[i].z);
      cube[i].update(cube[i].x,round(matrix.m02),round(matrix.m12));
      cube[i].turnFacesX(dir);
    }
  }
}

void animate(String axis, int dir, int pos){
  turning = axis;
  direction = dir;
  position = pos;
  if (turning == "z"){
    move = new Move(0, 0, position, direction);
  } else if (turning == "y"){
    move = new Move(0, position, 0, direction);
  } else if (turning == "x"){
    move = new Move(position, 0, 0, direction);
  }
  move.start();
}

void keyPressed(){
  if (move.animating == false){
    switch (key){
    case 'f':
      turnZ(1,1);
      break;
    case 'F':
      turnZ(1,-1);
      break;
    case 'b':
      turnZ(-1,1);
      break;
    case 'B':
      turnZ(-1,-1);
      break;
    case 'd':
      turnY(1,1);
      break;
    case 'D':
      turnY(1,-1);
      break;
    case 'u':
      turnY(-1,1);
      break;
    case 'U':
      turnY(-1,-1);
      break;
    case 'l':
      turnX(-1,1);
      break;
    case 'L':
      turnX(-1,-1);
      break;
    case 'r':
      turnX(1,1);
      break;
    case 'R':
      turnX(1,-1);
      break;
    case '1':
      turnX(0,1);
      break;
    case '2':
      turnX(0,-1);
      break;
    case '3':
      turnY(0,1);
      break;
    case '4':
      turnY(0,-1);
      break;
    }
  }
}

void draw() {
  background(51);
  scale(60);
  
  move.update();

  for (int i = 0; i < cube.length; i++){
    push();
    if (turning != ""){
      if (cube[i].z == move.z && turning == "z"){
        rotateZ(move.angle);
      } else if (cube[i].y == move.y && turning == "y"){
        rotateY(-move.angle);
      } else if (cube[i].x == move.x && turning == "x"){
        rotateX(move.angle);
      }
    }
    
    cube[i].show();
    pop();

    if (move.animating == false){
      if (turning == "z"){
        turnZ1(position, direction);
      } else if (turning == "y"){
        turnY1(position, direction);
      } else if (turning == "x"){
        turnX1(position, direction);
      }
      turning = "";s
      direction = 0;
    }
  }
}
