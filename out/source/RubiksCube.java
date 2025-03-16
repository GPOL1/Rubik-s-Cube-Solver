/* autogenerated by Processing revision 1296 on 2025-03-16 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import peasy.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class RubiksCube extends PApplet {



PeasyCam cam;

int UPP = 0;
int DWN = 1;
int RGT = 2;
int LFT = 3;
int FRT = 4;
int BCK = 5;

int[] colors = {0xFFFFFFFF, 0xFFFFFF00, 0xFFFFA500, 0xFFFF0000, 0xFF00FF00, 0xFF0000FF};

int dim = 3;
Box[] cube = new Box[dim*dim*dim];

public void setup() {
  /* size commented out by preprocessor */;
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

public void turnZ() {
  for (int i = 0; i < cube.length; i++){
    if (cube[i].z == 1){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cube[i].x,cube[i].y);
      cube[i].update(round(matrix.m02),round(matrix.m12),round(cube[i].z));
    }
  }
}

public void keyPressed(){
  if (key == '1'){
    turnZ();
  }
}

public void draw() {
  background(51);
  scale(60);
  cube[2].highlight = true;
  for (int i = 0; i < cube.length; i++){
    cube[i].show();
  }
}
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
  
  public void update(int x_, int y_, int z_) {
    matrix.reset();
    matrix.translate(x,y,z);
    x = x_;
    y = y_;
    z = z_;
  }

  public void show() {
    fill(255);
    if(highlight == true){
      fill(255,0,0);
    }
    stroke(0);
    strokeWeight(0.1f);
    pushMatrix();
    applyMatrix(matrix);

    box(1);

    popMatrix();
  }
}


  public void settings() { size(600, 600, P3D); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RubiksCube" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
