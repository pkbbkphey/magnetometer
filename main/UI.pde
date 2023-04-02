/*
 *  CODE BY PBK in 2023.3.31
 *  this code works with the .ino file in the same folder
 */
import processing.serial.*;
Serial myPort;

import peasy.*;
PeasyCam cam;

float[] magn = new float[3];

void setup() {
  size(1200, 1000, P3D);
  cam = new PeasyCam(this, 250);
  myPort = new Serial(this, "COM6", 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(0);
  strokeWeight(2);
  stroke(255,0,0);
  line(0,0,0,200,0,0);
  stroke(0,255,0);
  line(0,0,0,0,200,0);
  stroke(0,0,255);
  line(0,0,0,0,0,200);
  strokeWeight(1);
  stroke(200,0,0);
  line(0,0,0,-200,0,0);
  stroke(0,200,0);
  line(0,0,0,0,-200,0);
  stroke(0,0,200);
  line(0,0,0,0,0,-200);
  
  strokeWeight(3);
  stroke(255,255,60);
  line(0,0,0,magn[0],magn[1],magn[2]);
  strokeWeight(1);
  stroke(150,150,150);
  line(0,magn[1],magn[2],magn[0],magn[1],magn[2]);
  line(magn[0],0,magn[2],magn[0],magn[1],magn[2]);
  line(magn[0],magn[1],0,magn[0],magn[1],magn[2]);
  line(0,magn[1],magn[2],0,magn[1],0);
  line(0,magn[1],magn[2],0,0,magn[2]);
  line(magn[0],0,magn[2],magn[0],0,0);
  line(magn[0],0,magn[2],0,0,magn[2]);
  line(magn[0],magn[1],0,magn[0],0,0);
  line(magn[0],magn[1],0,0,magn[1],0);
  //line(0,0,0,magn[0],magn[1],0);
  //line(magn[0],magn[1],0,magn[0],magn[1],magn[2]);

  cam.beginHUD();  
  fill(130);
  rect(250,6,magn[0],10);
  rect(250,29,magn[1],10);
  rect(250,52,magn[2],10);
  textSize(20);
  fill(255,0,0);
  text("X", 8, 20);
  fill(0,220,0);
  text("Y", 8, 42);
  fill(0,0,255);
  text("Z", 8, 64);
  fill(200);
  text(str(magn[0]), 30, 20);
  text(str(magn[1]), 30, 42);
  text(str(magn[2]), 30, 64);
  cam.endHUD();
}

void serialEvent(Serial myPort){
  String input = myPort.readString();
  String[] data = split(input, ',');
  magn = float(data);
  magn[0]/=10;
  magn[1]/=10;
  magn[2]/=10;
}
