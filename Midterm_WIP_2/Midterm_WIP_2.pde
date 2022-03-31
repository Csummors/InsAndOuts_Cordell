//Draft one 
//inspired by tv
//heavy with array

// Might try to cretae a oject void Channel[] channel=new channel[11];

//new font
PFont font;

String[]chL={"CHANNEL 1","CHANNEL 2","CHANNEL 3","CHANNEL 4","CHANNEL 5"};
String[]chR={"CHANNEL 6","CHANNEL 7","CHANNEL 8","CHANNEL 9","CHANNEL 10"};

void setup(){
  size(600,400);

}

void draw(){
  //channelL();
  //channelR();
  Testimage();
  font = createFont("PressStart2P-Regular.ttf",20);
  textFont(font);
}
