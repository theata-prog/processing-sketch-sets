void setup() {
  size(500, 100);
  background(255);
  strokeWeight(5);
  smooth();
  stroke(0, 255, 0);
  randomLine();
  stroke(255, 0, 0);
  randomLineCtrl();
  randomLineNoise();
  stroke(0,0,255);
  sinNoise();
}


void randomLine() {
  int step = 10;
  float lastx = -999;
  float lasty = -999;
  float y = 50;
  int borderx = 20;
  int bordery = 10;
  
  for (int x = borderx; x < width - borderx; x += step) {
    y = bordery + random(height - 2 * bordery);
    if (lastx > - 999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}

void randomLineCtrl() {
  float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  
  float y = 50;
  for (int x = 20; x < 480; x += xstep) {
    ystep = random(20) - 10; // range -10 to 10
    y += ystep;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

void randomLineNoise() {
  stroke(0,30);
  line(20, 50, 480, 50);
  
  stroke(20, 50, 70);
  int step = 10;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(10);
  float y;
  
  for (int x = 20; x < 480; x += step) {
    y = 10 + noise(ynoise) * 80;
    if (lastx > - 999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += 0.1;
  }
}

void sinNoise() {
  float xstep = 1;
  float lastx = -999;
  float lasty = -999;
  float angle = 0;
  float y = 50;
  for (int x = 20; x < 480; x += xstep) {
    float rad = radians(angle);
    y = 10 + (customRandom() * 60);
    if (lastx > - 999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    angle++;
  }
}

float customRandom() {
  float retValue = 1 - pow(random(1), 10);
  return retValue;
}