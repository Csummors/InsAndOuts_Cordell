//Draft one 
//inspired by tv
//heavy with array

//Channel[] channel=new channel[11];
//testimage
PImage t1;
PImage t2;
PImage t3;

String[]chL={"CHANNEL 1","CHANNEL 2","CHANNEL 3","CHANNEL 4","CHANNEL 5"};
String[]chR={"CHANNEL 6","CHANNEL 7","CHANNEL 8","CHANNEL 9","CHANNEL 10"};

void setup(){
  size(600,400);
//test image
t1=loadImage("test1.jpg");
t2=loadImage("test2.jpg");
t3=loadImage("test3.jpg");
}

void draw(){
turnChannel();
}

 void turnChannel(){
  if(mousePressed &&(mouseButton == LEFT)){
     image(t1,0,0,600,400);
     text(chL[0],10,20);
     
  } else if(mousePressed &&(mouseButton == RIGHT)){
    image(t3,0,0,600,400);
    text(chR[0],10,20);
  } else{ 
    image(t2,0,0,600,400);
     text(chL[2],10,20);
   
  }
}
