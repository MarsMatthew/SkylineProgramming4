

void setup() {
  fullScreen();
}
void draw() {
  background(200);
  //Creating ten billion variables at once, dont mind me.
  float x1, x2, x3, x4, y1, y2, y3, y4, a1, a2, a3, a4, b1, b2, b3, b4, value, centerX, centerY, pointX, pointY;
  //PointX is NOT redundant. It is used incase the point of which the card rotates needs to be moved.
  centerX = width/2;
  centerY = height/2;
  pointX = width/2;
  pointY = height-height/3;
  a1 = centerX-120 - pointX;
  b1 = centerY-300 - pointY;
  a2 = centerX+120 - pointX;
  b2 = centerY-300 - pointY;
  a3 = centerX+120 - pointX;
  b3 = centerY - pointY;
  a4 = centerX-120 - pointX;
  b4 = centerY - pointY;
  if (mousePressed) {
    //Rotate
    value = map(mouseX, centerX-70, centerX+70, -10, 10);
    if (value >= 40) {
      value = 40;
    } else if (value <= -40) {
      value = -40;
    }
  } else {
    value = 0;
  }
  value = radians(value);
  //First coordinate
  x1 = (a1*cos(value) - b1*sin(value)) + pointX;
  y1 = (a1*sin(value) + b1*cos(value))+pointY;
  //Second coordinate
  x2 = (a2*cos(value) - b2*sin(value))+pointX;
  y2 = (a2*sin(value) + b2*cos(value))+pointY;
  //Third coordinate
  x3 = (a3*cos(value) - b3*sin(value))+pointX;
  y3 = (a3*sin(value) + b3*cos(value))+pointY;
  //Fourth coordinate
  x4 = (a4*cos(value) - b4*sin(value))+pointX;
  y4 = (a4*sin(value) + b4*cos(value))+pointY;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}
