

import processing.sound.*;

SoundFile musicTrack;

void setup(){
size(1000,700);
musicTrack=new SoundFile(this, "NYG.wav");
musicTrack.play();
}

void draw(){
  background(0);
  
  float playbackPos=musicTrack.position();
  text("pos: " + playbackPos,10,10);
  
}
