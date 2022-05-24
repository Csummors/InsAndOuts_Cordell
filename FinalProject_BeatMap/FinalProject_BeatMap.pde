 //<>//
//cordell lane
// Code and idea from JasonMDavey
//who shows step by step how to setup which i followed on his youtube
import processing.sound.*;
import processing.serial.*;

Serial myPort; // creates object from Serial class
int vaL1=0;



// Timing / gameplay-related constants
 int NUM_NOTE_TYPES = 3;
 float perfectTime = 0.05f;
 float greatTime = 0.1f;
 float okTime = 0.2f;

 int PERFECT_SCORE = 100;
 int GREAT_SCORE = 50;
 int OK_SCORE = 20;

 int COMBO_UP_INTERVAL = 10;
 int COMBO_MAX_MULTIPLIER = 10;

// Audio-visual-related constants
 float BAR_LENGTH_PIXELS = 400f;
 float LANE_SPACING_PIXELS = 175f;

 float NOTE_FADE_TIME_SECONDS = 0.5f;


  color[] NOTE_COLORS = new color[]{
  color(255,0,0),
  color(0,255,0),
  color(80,80,255),
};

// Assets
SoundFile musicTrack;
TrackData trackData;

PImage hitMarkerImage, hitMarkerFailureImage, hitMarkerSuccessImage;

// State
int score = 0;
int comboMultiplier = 1;
int comboUpCounter = 0;

void setup() {
  size(1012,700,P3D);
  hint(ENABLE_DEPTH_SORT);
  
  // Load images  
  hitMarkerImage = loadImage("hitMarker.png");
  hitMarkerFailureImage = loadImage("hitMarker_failure.png");
  hitMarkerSuccessImage = loadImage("hitMarker_success.png");
 
  
  // Load audio file
  //add any music you want but Wav file is better
  musicTrack = new SoundFile(this, "NYG.wav");
  
  // Load track metadata
  // go to sketch and data then copy the dir 
  trackData = new TrackData("C:/Users/cordell/Desktop/InsAndOuts_Cordell/FinalProject_BeatMap/data/trackinfo.txt");
  
  //musicTrack.jump(30);
  // Start the music!
  musicTrack.play();
  
  //serial port
  // this line prints the port list to the console
  printArray(Serial.list()); 
  String portName = Serial.list()[0]; //Port number is 2
  myPort = new Serial(this, portName, 9600);
  
  LightShow();
}

void draw() {
  background(0);
  detectFailedHits();
  
  textSize(30);
  textAlign(LEFT);
  text("Score: " + score, 10, 30);
  textAlign(RIGHT);
  text(comboMultiplier+"x", width-10, 30);
 
  
  drawTrack();
  
  //LED();
}
