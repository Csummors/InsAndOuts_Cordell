

PImage TvS;



void Tvframe(){
  TvS=loadImage("Wood.jpg");
  image(TvS,0,0,600,400);
  
  fill(200);
  strokeWeight(4);
  rect(80,50,450,320);
  
  strokeWeight(20);
  fill(0);
  rect(105,85,400,250);
  
  strokeWeight(4);
  fill(200);
  rect(0,100,60,250);
}
