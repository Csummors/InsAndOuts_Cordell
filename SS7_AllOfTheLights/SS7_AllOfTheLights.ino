int LED0=13;
int LED2=12;//LED 2 and 1 are switch around plug it in weird
int LED1=11;//fix the LED by swiching the number order in the code
int LED3=10;
int LED4=9;
int LED5=8;
int buttonPin=2;
int buttonState;
int buttonPrevState=LOW;

void setup() {
  // put your setup code here, to run once:
  pinMode(13,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(buttonPin,INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  int buttonState=digitalRead(buttonPin);
  delay(10);

  if(buttonState==HIGH){
    //pattern 01
   digitalWrite(LED4,HIGH);digitalWrite(LED2,HIGH);digitalWrite(LED1,HIGH);
   delay (300);
   digitalWrite(LED4,LOW);  digitalWrite(LED2,LOW); digitalWrite(LED1,LOW);
   delay (300);
   digitalWrite(LED0,HIGH);digitalWrite(LED3,HIGH);digitalWrite(LED5,HIGH);
   delay (300); 
   digitalWrite(LED0,LOW);digitalWrite(LED3,LOW); digitalWrite(LED5,LOW); 
   delay (300);
    }else{
      //pattern 02
      digitalWrite (LED4,HIGH); digitalWrite (LED5, HIGH);
      delay (80);
      digitalWrite (LED0,HIGH); digitalWrite (LED3, HIGH);
      delay (80);
      digitalWrite (LED1,HIGH); digitalWrite (LED2, HIGH);

       digitalWrite (LED4,LOW); digitalWrite (LED5, LOW);
      delay (80);
      digitalWrite (LED0,LOW); digitalWrite (LED3, LOW);
      delay (80);
      digitalWrite (LED1,LOW); digitalWrite (LED2, LOW);
      }




///testing all LED
////They all work
/*
  digitalWrite(LED5,HIGH);
  delay(1000);
  digitalWrite(LED5,LOW);
  delay(1000);
*/

///Testing the buton
//Button works on each LED
    /*if(buttonState==HIGH){
    digitalWrite(LED3,HIGH);
    }else{
      digitalWrite(LED3,LOW);
      }
    */

   

}
