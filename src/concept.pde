 boolean tempLeft = false;
boolean tempRight = false;
boolean left = false;
boolean right = false;
boolean play = false;
void setup() {
  fullScreen();
}
void draw() {
  background(200);
  drawCard();
  mainScreen();
  
  if(left==true){
    clear();
    background(200);
    drawCard();
  }
  
  
}
void drawCard() {
  float value = 0;
  int pointX = width/2;
  int pointY = height - height/3;
  float x1, x2, x3, x4, y1, y2, y3, y4, a1, a2, a3, a4, b1, b2, b3, b4;
  //When mouse is dragged
  if (mousePressed) {
    //make it so card doesnt spin uncontrollably
    value = map(mouseX, (width/2)-70, (width/2)+70, -10, 10);
    if (value >= 20) {
      //Make right side green
      tempRight = true;
      if (value >= 40) {
        //Right side rotation stop
        value = 40;
      }
    } else if (value <= -20) {
      //Make left side green
      tempLeft = true;
      if (value <= -40) {
        //Left side rotation stop
        value = -40;
      }
    } else {
      //If mouse is inbetween
      tempLeft = false;
      tempRight = false;
    }
  } else {
    //Once mouse is let go
    if (tempLeft) {
      tempLeft = false;
      left = true;
    } else if (tempRight) {
      tempRight = false;
      right = true;
    }
  }
  /*
  Rectangle coordinates
  First define where they are ex.(width/2)-120
  Then translate them by the rotation point (pointX, pointY)
  */
  a1 = (width/2)-120 - pointX;
  b1 = (height/2)-300 - pointY;
  a2 = (width/2)+120 - pointX;
  b2 = (height/2)-300 - pointY;
  a3 = (width/2)+120 - pointX;
  b3 = (height/2) - pointY;
  a4 = (width/2)-120 - pointX;
  b4 = (height/2) - pointY;
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
public void mainScreen(){
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("Card Game", width/2, height/8);
  if (tempLeft){
    fill(0,255,0);
  } else {
    fill(255); 
  }
  rect(0,0,width/10,height);
  fill(0);
  text("play",width/19,height/2);
  if(tempRight){
    fill(0,255,0);
    play = true;
  }else{
    fill(255);
  }
  rect(width-width/10, 0, width, height);
  fill(0);
  text("settings",width-width/19,height/2);
  fill(255);
}
