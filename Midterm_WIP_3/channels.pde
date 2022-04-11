
//images and text are now working
//Text
String[]chSt={"CHANNEL 1","CHANNEL 2","CHANNEL 3","CHANNEL 4","CHANNEL 5","CHANNEL 6","CHANNEL 7","CHANNEL 8","CHANNEL 9","CHANNEL 10"};
//image
PImage[] ch= new PImage[10];
int chIndex=0;

void channels(){
  video = new Capture(this,400,250,30);
  video.start();
  
  for(int i=0;i<ch.length;i++){
  ch[i]=loadImage("ch"+i+".jpg");
  }
}

void mousePressed() {
  println(ch[chIndex]);
  println(chSt[chIndex]);
  
  
 //my god still having problems with the left click button
 //it still hitting ch -1 why?
 //fixed the problem 
  if (mouseButton == RIGHT) {
    image(ch[chIndex],105,85,400,250);
    fill (124,252,0);
    //captured video will show on channel 5
    if(chIndex==4){
    image(video,105,85,400,250);
    } else{
     video.stop();
    }
    
    text(chSt[chIndex],105,105);
      if (chIndex==ch.length-1){
        chIndex=0;
      } else{
        chIndex= chIndex+1;
      }
    }    
  if (mouseButton == LEFT){
    //cant stop it on channel 5 here
    //need to fix
    if(chIndex==5){
    image(video,105,85,400,250);
    } else{
     video.stop();
    }
    
    image(ch[chIndex],105,85,400,250);
    fill (124,252,0);
    text(chSt[chIndex],105,105);
      if (chIndex==0){
        chIndex=9;
      }else{
      chIndex=chIndex-1; }
    }
    //
  }
