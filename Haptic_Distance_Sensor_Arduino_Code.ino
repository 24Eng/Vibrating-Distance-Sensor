unsigned long upperLimit = 15000;
void setup(){
  pinMode(3, INPUT);
  pinMode(4, OUTPUT);
  pinMode(12, OUTPUT);
}

void loop(){
  digitalWrite(4, HIGH);
  delayMicroseconds(10);
  digitalWrite(4, LOW);
  int servoDelay = pulseIn(3, HIGH, upperLimit);
  if((servoDelay < 110) || servoDelay > upperLimit){servoDelay = upperLimit;}
  servoDelay = map(servoDelay, 110, upperLimit, 500, 2500);
  digitalWrite(12, HIGH);
  delayMicroseconds(servoDelay);
  digitalWrite(12, LOW);
  delay(15);
}
