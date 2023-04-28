
void setup(){
  fullScreen();
}
void draw(){
  float x1, x2, x3, x4, y1, y2, y3, y4, a1, a2, a3, a4, b1, b2, b3, b4, value;
  float centerX = width/2;
  float centerY = height/2;
  a1 = centerX-120;
  b1 = centerY-300;
  a2 = centerX+120;
  b2 = centerY-300;
  a3 = centerX+120;
  b3 = centerY;
  a4 = centerX-120;
  b4 = centerY;
  point(width/2, (height-height/3));
  float pointX = width/2;
  float pointY = height-height/3;
  value = mouseX;
  a1 -= pointX;
  a2 -= pointX;
  a3 -= pointX;
  a4 -= pointX;
  b1 -= pointY;
  b2 -= pointY;
  b3 -= pointY;
  b4 -= pointY;
  value = radians(value);
  //First coordinate
  x1 = a1*cos(value) + b1*sin(value);
  y1 = a1*sin(value) - b1*cos(value);
  //Second coordinate
  x2 = a2*cos(value) + b2*sin(value);
  y2 = a2*sin(value) - b2*cos(value);
  //Third coordinate
  x3 = a3*cos(value) + b3*sin(value);
  y3 = a3*sin(value) - b3*cos(value);
  //Fourth coordinate
  x4 = a4*cos(value) + b4*sin(value);
  y4 = a4*sin(value) - b4*cos(value);
  x1 += pointX;
  x2 += pointX;
  x3 += pointX;
  x4 += pointX;
  y1 += pointY;
  y2 += pointY;
  y3 += pointY;
  y4 += pointY;
  line(pointX,pointY,pointX,0);
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
}
