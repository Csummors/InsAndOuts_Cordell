//EyeTv by cordell lane
//part 2 of the eye tv design


//still need to work on timer, i was acting up so i delted it
//create random color helpful
Float r = random(0,256);
Float b = random(0,256);
Float g = random(0,256);
//created font & import images 
PFont font;
PImage c1;
PImage c2;
PImage c3;
//text 
//text for the easter egg
String s = "Welcome to The Eye ";
String t = "Big Brother is watching You";
//subtitles for the channels
String[]chT={"CHANNEL 1","CHANNEL 2","CHANNEL 3"};
String[]subT={"Don't eat it stupid","Subway, it not horse meat","EMERGENCY ALERT SYSTEM","Internation Weather Society","is issue a Warning to", "Stay Home"};
String Ch1 ="CHANNEL 1";
String Ch2 ="CHANNEL 2";
String Ch3 ="CHANNEL 3";
//timer
int timer=3000;
int m;


void setup(){
size(600,400);
//three images 
c1 = loadImage("Ad1.jpg");
c2 = loadImage("Ad2.jpg");
c3 = loadImage("OldTv.jpg");

}

void draw(){
 /*channel1();
 //channel2();
 //channel3();                                                       
 //tvStatic();*/
 //made a channels void and put them all in turnchannel();
  turnChannel();
  font = createFont("PressStart2P-Regular.ttf",20);
  textFont(font);
  }


void tvStatic(){
  stroke(255);
  strokeWeight(2);
  //for loop that create line the mive vertically or was supposed to do
  for(float a=400; a>0;a=a-1){
  line(0, a, width, a); 
  a = a - 15;
   if (a < 0) { 
     a = height;
   }
  }
}

//image contains Tide commerical
void channel1(){
image(c1,0,0,600,400);
}

//image contains Subway commerical
void channel2(){
image(c2,0,0,600,400);
}

//stiatic image& and secret easter egg 
//illumati eye is created when you pressed the space button
void channel3(){
image(c3,0,0,600,400);
 if (keyPressed == true) {
    background(0);
    fill(r,b,g);
    triangle(100,300,300,100,500,300);
    text(s, 100, 70);
    text(t, 20, 400);
    fill(255);
    ellipse(width/2,height/2,100,100);
    fill(0);
    ellipse(width/2,height/2,60,60);
    }
 }

//subtitle for tide commerical 
void subT1(){
 text(chT[0],10,20);
 text(subT[0],100,350);
}

//subtitle for subway commerical 
void subT2(){
 text(chT[1],10,20);
 text(subT[1],20,200);
  }

//subtitle for main station 
void subT3(){
  text(chT[2],10,20);
  text(subT[2],100,100);
  text(subT[3],20,200);
  text(subT[4],100,300);
  text(subT[5],200,370);
 }
//event void when you press the mouse the channel changes
void turnChannel(){
  if(mousePressed &&(mouseButton == LEFT)){
     channel1();
     subT1();
     
  } else if(mousePressed &&(mouseButton == RIGHT)){
     channel2();
     subT2();
  } else{ 
    tvStatic();
    channel3();
    //text clips throght art when i pressed the space bar
    subT3();
   
  }
}
