float _angleNoise, _radiusNoise;
float _xNoise, _yNoise;
float _angle = -PI / 2;
float _radius;
float _stroleCol = 254;
int _strokeChange = 1;

void setup() {
  size(500, 300);
  smooth();
  frameRate(30);
  background(255);
  noFill();
  
  _angleNoise = random(10);
  _radiusNoise = random(10);
  _xNoise = random(10);
  _yNoise = random(10);
}

void draw() {
  _radiusNoise += 0.005;
  _radius = (noise(_radiusNoise) + 550) + 1;
  
  _angleNoise += 0.005;
  _angle += (noise(_angleNoise) * 6) - 3;
  if (_angle > 360) {
    _angle -= 360;
  }
  if (_angle < 0) {
    _angle += 360;
  }
  
  _xNoise += 0.01;
  _yNoise += 0.01;
  float centerX = width / 2 + (noise(_xNoise) * 100) - 50;
  float centerY = height / 2 + (noise(_yNoise) * 100) - 50;
  
  float rad = radians(_angle);
  float x1 = centerX + (_radius * cos(rad));
  float y1 = centerY + (_radius * sin(rad));
  
  float opprad = rad + PI;
  float x2 = centerX + (_radius * cos(opprad));
  float y2 = centerY + (_radius * sin(opprad));
  
  _stroleCol += _strokeChange;
  if (_stroleCol > 254) {
    _strokeChange = -1;
  }
  if (_stroleCol < 0) {
    _strokeChange = 1;
  }
  stroke(_stroleCol, 60);
  strokeWeight(1);
  line(x1,y1, x2, y2);
}