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

}

void ChannelL(){
  if(mousePressed &&(mouseButton == LEFT)){
     image(t1,0,0,600,400);
  } else{ 
        image(t2,0,0,600,400);

  }
}
 void ChannelR(){   
 if(mousePressed &&(mouseButton == RIGHT)){
    image(t3,0,0,600,400);

   } else{ 
    image(t2,0,0,600,400);

  }    
 }  
