const int inPin = 2; // the input pin
float startCount; // Store the first time value returned from millis
float stopCount;
float duration; // Store the duratation of a period or part there of of the incoming signal
float frequency; // Store the calculated frequency in Hz
bool flag = false;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(inPin, INPUT_PULLUP);

}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(inPin) == LOW){
    startCount = millis();
    while(digitalRead(inPin) == LOW){}
  stopCount = millis();
  duration = (stopCount - startCount)*2 / 1000;
  frequency = 1 / duration;
  Serial.print(frequency);
  Serial.println(" Hz");
  }
}
