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

//imports Serial library from Processing
import processing.serial.*; 

Serial myPort; // creates object from Serial class
int vaL0=0; // creates variable for data coming from serial port
int vaL1=0;

void setup() {
  size(400,400);
  // Parameters(color,x postion, y postion, speed, height )
  myBs1 = new BeatSquare(color(R1+vaL0,0,0),a*0,width,20,r1);
  myBs2 = new BeatSquare(color(0,0,Y2+vaL0),a,width,20,r2);
  myBs3 = new BeatSquare(color(R3-vaL0,0,Y3+vaL0),a*2,width,20,r3);
  myBs4 = new BeatSquare(color(0,G4+vaL0,Y4-vaL0),a*3,width,20,r4);
  myBs5 = new BeatSquare(color(R5+vaL0,0,Y5+vaL0),a*4,width,20,r5);
  myBs6 = new BeatSquare(color(0,G6-vaL0,255),a*5,width,20,r6);
  
  // this line prints the port list to the console
  printArray(Serial.list()); 
  String portName = Serial.list()[2]; //Port number is 2
  myPort = new Serial(this, portName, 9600);
  
}

void draw() {
  println(vaL0);
  
  LED();
  
  //RANDOMIZE THE BACKGROUND
  for (int i = 0; i < 255; i++) {
  float r = random(256);
  background(r+vaL0,r+i,i-vaL0);
}
//updating my c= new class
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
    vaL0 = myPort.read(); // read it and store it in val
    vaL1= myPort.read();
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
    rect(xpos,ypos,50,r0+xheight+vaL0);
   if(vaL0<=80&& vaL0>0){
    xheight=xheight-5;
    if(xheight==400){
    xheight=xheight*0;
    }
    }else if(vaL0<=150&& vaL0>80){
     xheight=xheight+10;
   }else if(vaL0>=255&&vaL0>150){
     xheight=xheight-400;
     if(xheight==400){
    xheight=xheight-50;
   }
    else{
    xheight=xheight+1;
    }
   }
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

void LED(){
if (mouseY > width/2 && mouseY < height) {  
    myPort.write(0); //send a 0
    println ("0");
  } else if (mouseX < width/2 && mouseX > 0) { //if mouse is on left side of screen
    myPort.write(1);  //write '1' to Serial port
    println("1"); //also print '1' to console
  } else if (mouseX > width/2 && mouseX < width) {
    myPort.write(2);  //write '2' to Serial port
    println ("2"); //print to '2' to console
  } else {  //otherwise
    myPort.write(0); //send a 0
    println ("0");
  }
}
