//EyeTv by cordell lane

Float r = random(0,256);
Float b = random(0,256);
Float g = random(0,256);
PFont font;
String s = "Welcome to The Eye ";
String t = "Big Brother is watching You";
String[]chT={"CHANNEL 1","CHANNEL 2","CHANNEL 3"};
String[]subT={"Don't eat it stupid","Subway, it not horse meat","EMERGENCY ALERT SYSTEM","Internation Weather Society is issue a Warning to Stay Home"};
String Ch1 ="CHANNEL 1";
String Ch2 ="CHANNEL 2";
String Ch3 ="CHANNEL 3";
PImage c1;
PImage c2;
PImage c3;
int timer=3000;
int m;


void setup(){
size(600,400);
c1 = loadImage("Ad1.jpg");
c2 = loadImage("Ad2.jpg");
c3 = loadImage("OldTv.jpg");

}

void draw(){
  //channel1();
  //channel2();
  //channel3();                                                       
  //tvStatic();
    turnChannel();
    font = createFont("PressStart2P-Regular.ttf",20);
    textFont(font);
  }


void tvStatic(){
  stroke(255);
  strokeWeight(2);
  for(float a=400; a>0;a=a-1){
  line(0, a, width, a); 
  a = a - 15;
   if (a < 0) { 
     a = height;
   }
  //a = a - 15;
  }
}

void channel1(){
image(c1,0,0,600,400);
}

void channel2(){
image(c2,0,0,600,400);
}

void channel3(){
image(c3,0,0,600,400);
 if (keyPressed == true) {
    background(0);
    fill(r,b,g);
    triangle(100,300,300,100,500,300);
    text(s, 100, 70);
    text(t, 20, 400);
    if(keyPressed == true){
      fill(255);
      ellipse(width/2,height/2,100,100);
    }
    if(keyPressed == true){
      fill(0);
      ellipse(width/2,height/2,60,60);
    }
 }
}

void subT1(){
 text(chT[0],10,20);
 text(subT[1],100,70);
 text(subT[2],20,400);
}

void subT2(){
 text(chT[1],10,20);
 text(subT[0],20,400);
  }

void subT3(){
  text(chT[2],10,20);
 }

void turnChannel(){
  if(mousePressed &&(mouseButton == LEFT)){
     channel1();
     
  } else if(mousePressed &&(mouseButton == RIGHT)){
     channel2();
  } else{ 
    channel3();
    tvStatic();
  }
}
