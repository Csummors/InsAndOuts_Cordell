//cordell 
//SERIAL DATA to Processing

//potentiometer
const int SENSOR = A0; //sensor hooked up to analog pin A0
//Led lights
const int LED0=13;
const int LED2=12;
const int LED1=11;
const int LED3=10;
//potentiometer value
int vaL0 = 0;
//LED value
int vaL1=0;

void setup() {
  pinMode (SENSOR, INPUT);
  pinMode(13,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(10,OUTPUT);
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  vaL0 = analogRead(SENSOR); //read sensor and assign to variable called val
  vaL0 = vaL0 / 4; //divide val by 4 or remap values to get byte-sized 0-255
  delay(100); // Wait 100 milliseconds

  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////
  
  //Serial. println(val); //to send human-readable data to Arduino monitor
  Serial.write(vaL0);  //to send binary data to Processing

//LED
  if (Serial.available()) { // If data is available to read
    vaL1 = Serial.read(); // read it and store it in val
  }
  if (vaL1 == 0) { // If 0 received
    digitalWrite(13, LOW);digitalWrite(12, LOW);digitalWrite(11, LOW);digitalWrite(10, LOW);
  }
  else if (vaL1 == 1) { // If 1 received
      digitalWrite (13,HIGH); digitalWrite (11, HIGH);
      delay (80);
      digitalWrite (12,HIGH); digitalWrite (10, HIGH);
      delay (80);
      digitalWrite (11,HIGH); digitalWrite (12, HIGH);
     digitalWrite (13,HIGH); digitalWrite (11, HIGH);
      delay (80);
      digitalWrite (12,HIGH); digitalWrite (10, HIGH);
      delay (80);
      digitalWrite (11,HIGH); digitalWrite (12, HIGH);
  }
  else if (vaL1 == 2) { // If 2 received
    digitalWrite(13,HIGH);digitalWrite(12,HIGH);digitalWrite(11,HIGH);
   delay (80);
   digitalWrite(13,LOW);  digitalWrite(12,LOW); digitalWrite(11,LOW);
   delay (80);
   digitalWrite(10,HIGH);digitalWrite(13,HIGH);digitalWrite(12,HIGH);
   delay (80); 
   digitalWrite(10,LOW);digitalWrite(13,LOW); digitalWrite(12,LOW); 
   delay (80);

  }
  //delay(10); // Wait 10 milliseconds
}
