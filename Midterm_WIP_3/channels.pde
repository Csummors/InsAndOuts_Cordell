String[]chSt={"CHANNEL 1","CHANNEL 2","CHANNEL 3","CHANNEL 4","CHANNEL 5","CHANNEL 6","CHANNEL 7","CHANNEL 8","CHANNEL 9","CHANNEL 10"};

PImage[] ch= new PImage[10];
int chIndex=0;

void channels(){
  
  
  text(chSt[chIndex],10,20);
  
  for(int i=0;i<ch.length;i++){
  ch[i]=loadImage("ch"+i+".jpg");
  }
}

void mousePressed() {
  image(ch[chIndex],0,0,600,400);
  text(chSt[chIndex],10,20);
  if (mouseButton == RIGHT) {
    if (chIndex==ch.length-1){
    chIndex=0;
    } else{
      chIndex= chIndex+1;
    }
  }    
 
  if (mouseButton == LEFT){
    if (chIndex==-1){
      chIndex=10;
    }else{
      chIndex=chIndex-1; }
  }
}
