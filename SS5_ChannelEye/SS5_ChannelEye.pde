//ChannelEye by cordell lane

Float r = random(0,256);
Float b = random(0,256);
Float g = random(0,256);
PFont font;
String s = "Welcome to The Eye ";
String t = "Big Brother is watching You";
PImage c1;
PImage c2;
PImage c3;


void setup(){
size(600,400);
c1 = loadImage("Ad1.jpg");
c2 = loadImage("Ad2.jpg");
c3 = loadImage("OldTv.jpg");

}

void draw(){
  //channel1();
 // channel2();
 // channel3();                                                       
 // tvStatic();
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
