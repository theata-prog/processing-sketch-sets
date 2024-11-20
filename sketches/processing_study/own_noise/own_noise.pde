void setup() {
  size(500, 300);
  background(255);
  strokeWeight(5);
  smooth(); 
  
  float radius = 100;
  float centX = 250;
  float centY = 150;
  
  stroke(0, 30);
  noFill();
  ellipse(centX, centY, radius * 2, radius * 2);
  
  stroke(20, 50, 70);
  strokeWeight(1);
  
  float x, y;
  float noiseVal = random(10);
  float radVariance, thisRadius, rad;
  beginShape();
  fill(20, 50, 70, 50);
  
  for (int ang = 0; ang <= 360; ++ang) {
    noiseVal += 0.1;
    radVariance = 30 * customNoise(noiseVal);
    
    thisRadius = radius + radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
  }
  endShape();
}

float customNoise(float value) {
  int count = int((value % 12));
  float retValue = pow(sin(value), count);
  return retValue;
}