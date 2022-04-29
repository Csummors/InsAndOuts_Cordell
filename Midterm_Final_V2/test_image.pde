/*test image
PImage t1;
PImage t2;
PImage t3;


void Testimage(){
  t1=loadImage("test1.jpg");
t2=loadImage("test2.jpg");
t3=loadImage("test3.jpg");

  if(mousePressed &&(mouseButton == LEFT)){
     
     text(chL[0],10,20);
     
  } else if(mousePressed &&(mouseButton == RIGHT)){
    image(t3,0,0,600,400);
    text(chR[0],10,20);
  } else{ 
    image(t2,0,0,600,400);
     text(chL[2],10,20);
   
  }
}

/*void ChannelL(){
  if(mousePressed &&(mouseButton == LEFT)){
     image(t1,0,0,600,400);
  } else{ 
        image(t2,0,0,600,400);

  }
}
 void ChannelR(){   
 if(mousePressed &&(mouseButton == RIGHT)){
    image(t3,0,0,600,400);

   } else{ 
    image(t2,0,0,600,400);

  }    
 }  
 */
