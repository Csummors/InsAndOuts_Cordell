int LED0=13;
int LED1=12;
int LED2=11;
int LED3=10;
int LED4=9;


//LED value
int vaL1;

void setup() {
  // put your setup code here, to run once:
 
pinMode(13,OUTPUT);
pinMode(12,OUTPUT);
pinMode(11,OUTPUT);
pinMode(10,OUTPUT);
pinMode(9,OUTPUT);
Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  
  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////
  
  Serial. println(vaL1); //to send human-readable data to Arduino monitor
  //Serial.write(vaL1);  //to send binary data to Processing

//LED
  if (Serial.available()) { // If data is available to read
    vaL1 = Serial.read(); // read it and store it in val
  }


  if (vaL1 == 0) { // If 0 received
    digitalWrite(13, HIGH);
   
  }
  if (vaL1 == 1) { // If 1 received
      digitalWrite (12,HIGH);
      
  }
  else if (vaL1 == 2) { // If 2 received
    digitalWrite(11,HIGH)
    
  }
   if (vaL1 == 3) { // If 3 received
    digitalWrite(10,HIGH)
   
  }
  if (vaL1 == 4) { // If 4 received
    digitalWrite(9,HIGH)
   
  }
 
  
}