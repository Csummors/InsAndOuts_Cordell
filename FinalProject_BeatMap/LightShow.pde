
void LightShow() {
if ( myPort.available() > 0) { // If data is available,
    
    vaL1= myPort.read();
  }
  

  
  
}

 void LED(){
if (note=0)myPort.write(0); //send a 0
  else if ((note=0)myPort.write(1);) 
  else if (note=0)myPort.write(2);
 
}
