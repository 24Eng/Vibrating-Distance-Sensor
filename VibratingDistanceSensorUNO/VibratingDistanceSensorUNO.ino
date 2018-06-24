int vibratorPin = 3;
int triggerPin = 4;
int echoPin = 5;

int maxDistance = 15000;

void setup(){
  pinMode(echoPin, INPUT);
  pinMode(triggerPin, OUTPUT);
  pinMode(vibratorPin, OUTPUT);
}

void loop(){
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(triggerPin, LOW);
  int pulseWidth = pulseIn(echoPin, HIGH, maxDistance);
  if((pulseWidth < 110) || pulseWidth > maxDistance){
    pulseWidth = maxDistance;
  }
  pulseWidth = map(pulseWidth, 110, 15000, 170, 0);
  analogWrite(vibratorPin, pulseWidth);
}
