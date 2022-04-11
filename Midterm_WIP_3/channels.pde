//images and text are now working

String[]chSt={"CHANNEL 1","CHANNEL 2","CHANNEL 3","CHANNEL 4","CHANNEL 5","CHANNEL 6","CHANNEL 7","CHANNEL 8","CHANNEL 9","CHANNEL 10"};

PImage[] ch= new PImage[10];
int chIndex=0;

void channels(){
 
  for(int i=0;i<ch.length;i++){
  ch[i]=loadImage("ch"+i+".jpg");
  }
}

void mousePressed() {
  println(ch[chIndex]);
  println(chSt[chIndex]);
  image(ch[chIndex],180,80,650,560);
  text(chSt[chIndex],200,120);
  if (mouseButton == RIGHT) {
    if (chIndex==ch.length-1){
    chIndex=0;
    } else{
      chIndex= chIndex+1;
    }
  }    
 //my god still having problems with the left click button
 //it still hitting ch -1 why?
 //fixed the problem
  if (mouseButton == LEFT){
    if (chIndex==0){
      chIndex=9;
    }else{
      chIndex=chIndex-1; }
  }
}
