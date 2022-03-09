//Cult TV by Cordell lane ;


float a;
PImage tv;
PFont font;
String s = "Welcome to The Eye ";
String t = "Big Brother is watching You";
Float r = random(0,256);
Float b = random(0,256);
Float g = random(0,256);

void setup(){
//image background
  size(600,400);
  tv = loadImage("OldTv.jpg");
 
}

void draw() {
//font change 
  background(0);
  image(tv,0,0,600,400);
  font = createFont("PressStart2P-Regular.ttf",20);
  textFont(font);
  text(s, 100, 250);

//why is this not working
//letter were going to appear one at a time
 /* float x= 100;
  for(int i = 0; i < s.length(); i++){
    char c = s.charAt(i);
    text(c, x, 250);
    x=x + textWidth(c);    
  }
   */
   
   //if you press the mouse the eye should appear
  if (mousePressed == true) {
    background(0);
    fill(r,b,g);
    triangle(100,300,300,100,500,300);
    text(s, 100, 70);
    text(t, 20, 400);
    if(mousePressed == true){
      fill(255);
      ellipse(width/2,height/2,100,100);
    }
    if(mousePressed == true){
      fill(0);
      ellipse(width/2,height/2,60,60);
    }
 }
 else{
   fill(255);
   stroke(0);
  }
 
 //stastic lines moving 
  stroke(255);
  strokeWeight(10);
  line(0, a, width, a); 
  line(0, a+10, width, a+10);
  line(0, a+223, width, a+223);
  line(0, a+500, width, a+500);
  line(0, a-20, width, a-20);
  line(0, a, width, a);
   a = a - 15;
  if (a < 0) { 
   a = height; 
   }
   

 
 
  
}
