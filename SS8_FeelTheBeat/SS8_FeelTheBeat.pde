//created Six objects!
BeatSquare myBs1;
BeatSquare myBs2; 
BeatSquare myBs3;
BeatSquare myBs4;
BeatSquare myBs5;
BeatSquare myBs6;

//x postion
float a=51;

//random height
float r0 = random(0,400);
float r1 = random(0,400);
float r2 = random(0,400);
float r3 = random(0,400);
float r4 = random(0,400);
float r5 = random(0,400);
float r6 = random(0,400);

//random color
float R1 = random(0,256);
float G1= random(0,256);
float Y1= random(0,256);
float R2 = random(0,256);
float G2= random(0,256);
float Y2= random(0,256);
float R3 = random(0,256);
float G3= random(0,256);
float Y3= random(0,256);
float R4 = random(0,256);
float G4= random(0,256);
float Y4= random(0,256);
float R5 = random(0,256);
float G5= random(0,256);
float Y5= random(0,256);
float R6 = random(0,256);
float G6= random(0,256);
float Y6= random(0,256);
import processing.serial.*; //imports Serial library from Processing

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port

void setup() {
  size(400,400);
  
  // Parameters(color,x postion, y postion, speed, height )
  myBs1 = new BeatSquare(color(R1+val,0,0),a*0,width,20,r1);
  myBs2 = new BeatSquare(color(0,0,Y2+val),a,width,20,r2);
  myBs3 = new BeatSquare(color(R3-val,0,Y3+val),a*2,width,20,r3);
  myBs4 = new BeatSquare(color(0,G4+val,Y4-val),a*3,width,20,r4);
  myBs5 = new BeatSquare(color(R5+val,0,Y5+val),a*4,width,20,r5);
  myBs6 = new BeatSquare(color(0,G6-val,255),a*5,width,20,r6);
  

  
  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[2]; //Port number is 2
  myPort = new Serial(this, portName, 9600);
  
}

void draw() {
  println(val);
  
  for (int i = 0; i < 255; i++) {
  float r = random(256);
  background(r+val,r+i,i-val);
}
  
  
  myBs1.drive();
  myBs1.display();
  myBs2.drive();
  myBs2.display();
  myBs3.drive();
  myBs3.display();
  myBs4.drive();
  myBs4.display();
  myBs5.drive();
  myBs5.display();
  myBs6.drive();
  myBs6.display();
  
  
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }
}

// Even though there are multiple objects, we still only need one class.
// No matter how many cookies we make, only one cookie cutter is needed.
class BeatSquare {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float xheight;

  // The Constructor is defined with arguments.
  BeatSquare(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempXheight) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    xheight = tempXheight;
    
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,50,r0+xheight+val);
    if(val>=80&& val>0){
    xheight=xheight-10;
    }if(val<=150&& val>80){
     xheight=xheight+10;
   }if(val>=255&&val<150){
     xheight=xheight-400;
   }
    else{
    xheight=xheight+1;
    }
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
