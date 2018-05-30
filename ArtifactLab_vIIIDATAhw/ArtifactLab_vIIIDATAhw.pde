
import peasy.*;
import controlP5.*;
import nervoussystem.obj.*;
//import processing.sound.*;

import ddf.minim.*;

Minim minim;
AudioPlayer groove;

// camera and GUI
PeasyCam cam;
ControlP5 cp5;

// GUI vars
//Textlabel fpsLbl;
boolean toggle_axis = true, toggle_grid = true, auto_update = false;
float param_A, param_B;
float param_C, param_D;

// scene vars
Artifact shape;

void setup() {
  size(1024, 768, P3D);
  // Setup PeasyCam
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(4000);

  // Setup ControlP5
  setupGUI();

  // setup scene
  shape = new Plane(); // Plane // Artifact
  
  minim = new Minim(this);
  groove = minim.loadFile("sample.mp3", 1024);
  groove.loop();
}

void draw() {
  background(250);

  //noFill();
  fill(127);
  stroke(0);
  strokeWeight(10);

  shape.update();
  shape.draw(this.g);

  //drawGUI();
  

  
}

////////////////////////
// SETUP AND DRAW GUI
//////////////////////

// create a list of controlP5 library GUI elements
// See examples folder in processing
void setupGUI(){
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);

  // on/off toggle buttons
  cp5.addToggle("toggle_grid").setPosition(10,40).setSize(16,16);
  cp5.addToggle("toggle_axis").setPosition(10,80).setSize(16,16);
  cp5.addToggle("auto_update").setPosition(10,120).setSize(16,16);

  // float sliders
  cp5.addSlider("param_A")
     .setId(1)
     .setPosition(10,200)
     .setSize(128,16)
     .setRange(0,256);

  cp5.addSlider("param_B")
      .setId(2)
      .setPosition(10,220)
      .setSize(128,16)
      .setRange(0,256);

  // float sliders
  cp5.addSlider("param_C")
     .setId(3)
     .setPosition(10,240)
     .setSize(128,16)
     .setRange(0,256);

  cp5.addSlider("param_D")
      .setId(4)
      .setPosition(10,260)
      .setSize(128,16)
      .setRange(0,256);

  // buttons
  cp5.addButton("recreate").setPosition(10,300).setSize(64,16);
  cp5.addButton("exportMesh").setPosition(10,320).setSize(64,16);

}