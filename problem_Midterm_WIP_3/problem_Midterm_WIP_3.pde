//channel suffing Cordell 
//inspired by tv
//heavy with array

// Might try to cretae a oject void Channel[] channel=new channel[11];

//new font
PFont Tvfont;

void setup(){
  size(1000,700);
  Tvframe();
   channels();
   mousePressed();
}

void draw(){
 
  
  //Testimage();
  Tvfont = createFont("PressStart2P-Regular.ttf",20);
  textFont(Tvfont);
  fill(0,128,0);
}
