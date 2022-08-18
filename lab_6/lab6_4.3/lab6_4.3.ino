const int inPin = 2; // the input pin
float startCount; // Store the first time value returned from millis
float stopCount;
float duration; // Store the duratation of a period or part there of of the incoming signal
float frequency; // Store the calculated frequency in Hz
float x = 8 ; //1 if prescalar 1, 8 if prescalar 2, 64 if prescalar 3, 256 if prescalar 4 and 1024 if prescalar 5
float period = 64/x;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(inPin, INPUT_PULLUP);
  //TCCR0B = _BV(CS00);              //1
  TCCR0B = _BV(CS01);             // 8
  //TCCR0B = _BV(CS00) | _BV(CS01);  //64
  //TCCR0B = _BV(CS02);              //256
  //TCCR0B = _BV(CS00) | _BV(CS02);  //1024

}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(inPin) == LOW){
    startCount = millis();
    while(digitalRead(inPin) == LOW){}
  stopCount = millis();
  duration = (stopCount - startCount)*2 / 1000;
  frequency = (1*period) / duration;
  Serial.print(frequency);
  Serial.println(" Hz");
  }
}
