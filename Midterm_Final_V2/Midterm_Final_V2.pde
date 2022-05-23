import processing.video.*;

//channel surffing Cordell 
//inspired by tv

// Might try to cretae a oject void Channel[] channel=new channel[11];
//new font
PFont font;
//add capture video
Capture video;

void setup(){
  size(600,400);
  TvSet();
  channels();
  mousePressed();  
  //OnOff();
}
void captureEvent(Capture video){
  video.read();
}
void draw(){
  //Testimage();
  font = createFont("PressStart2P-Regular.ttf",20);
  textFont(font);
}
