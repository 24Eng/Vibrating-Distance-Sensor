int echoPin = 2;
int triggerPin = 3;
int outputPin = 4;
unsigned long frequencyDelay = 0;
unsigned long upperTimeDelay = 100;
int lowerTimeDelay = 1;
int ultrasonicTimeOut = 15000;

void setup(){
  pinMode(triggerPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(outputPin, OUTPUT);
  Serial.begin(9600);
}

void loop(){

  frequencyDelay = returnDistance(triggerPin, echoPin, ultrasonicTimeOut);
  frequencyDelay = map(frequencyDelay, 110, ultrasonicTimeOut, lowerTimeDelay, upperTimeDelay);
  
  Serial.println(frequencyDelay);
  
  applyTone(outputPin, frequencyDelay);
}
// body // body // body // body // body // body // body // body // body // body // body // body // body // body 

unsigned long returnDistance(int functionTriggerPin, int functionEchoPin, unsigned long functionUpperLimit){
  digitalWrite(functionTriggerPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(functionTriggerPin, LOW);
  unsigned long functionFrequencyDelay = pulseIn(functionEchoPin, HIGH, functionUpperLimit);
  if((functionFrequencyDelay < 110) || functionUpperLimit > functionUpperLimit){
    functionFrequencyDelay = functionUpperLimit;
  }
  return functionFrequencyDelay;
}

void applyTone(int outputPin, int functionDelay){
  digitalWrite(outputPin, HIGH);
  delay(functionDelay);
  digitalWrite(outputPin, LOW);
  delay(functionDelay);
}
