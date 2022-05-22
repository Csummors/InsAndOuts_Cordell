//Cordell OSU
//BeatMap


int prevMillis; 
PShape arrowShape;
ArrayList<Arrow>arrows=new ArrayList<Arrow>(); 
//change later
float arrowTimer=0;
float arrowTime=1;
float arrowInterval=1;
//line
float border=30;
void setup(){
size(600,400);
//arrow dirrection

arrowShape = createShape();

arrowShape.beginShape();
{
  arrowShape.fill(255);
  arrowShape.noStroke();
  arrowShape.vertex(-1,-0.5);
  arrowShape.vertex(0,-0.5);
  arrowShape.vertex(0,-1.0);
  arrowShape.vertex(1.0,0);
  arrowShape.vertex(0,1.0);
  arrowShape.vertex(0,0.5);
  arrowShape.vertex(-1,0.5);
}
arrowShape.endShape();

}

void draw(){
 int currMillis = millis();
 float t =(currMillis-prevMillis)/1000f;
 prevMillis = currMillis;
 
 arrowTimer+= t;
 
 if(arrowTimer > arrowInterval){
   arrowTimer -= arrowInterval;
   arrows.add(new Arrow(floor(random(4)), 500));
 }
 
 background(0);
 for(Arrow a : arrows){
 a.update(t);
 a.draw();
 }
 stroke(255,0,0);
 strokeWeight(20);
 line(0,(height-border),width,(height-border));
}

class Arrow
{
  PVector pos = new PVector(width/2f,0);
  float speed= 10;
  int dir;

  public Arrow(int dir, float speed){
  this.speed=speed;
  this.dir =dir;
  }
  
  public void update(float t)
  {
  pos.y += speed*t;
  }
  
  public void draw()
  {
    pushMatrix();
    {
      translate(pos.x,pos.y);
      scale(15,15);
      rotate(TAU*dir/4f);
      shape(arrowShape,0,0);
    }
    popMatrix();
  }
}
