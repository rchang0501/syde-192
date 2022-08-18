const int inpin = 2; 
long startTime; // store starting time here
long duration; // variable to store how long the timer has been running
float secduration; // variable to store the duration in seconds
long endTime; 
bool flag = false; 

void setup() {
  pinMode(inpin, INPUT_PULLUP); 
  digitalWrite(inpin, HIGH); 
  Serial.begin(9600); 
}

void loop() {
  if(digitalRead(inpin) == LOW) {
    Serial.println("Button pushed"); // this will print to the serial monitor
    startTime = millis(); // stores the number of millisceoncds since the Uno was last reset. See http://arduino.cc/en/Reference/millis
    flag = true; 
  }

  while(flag) {
    if(digitalRead(inpin) == HIGH && flag) {
      endTime = millis(); 
      duration = endTime - startTime; 
      secduration=(float)duration / 1000 ; /* convert the integer value for the time differnce into a 
                                                          floating variable before calculating time lapsed in seconds keeps precision */
      Serial.print("Button released after "); // print out your results
      Serial.print(secduration);
      Serial.println(" seconds");
      flag = false; 
    }
  }
}
