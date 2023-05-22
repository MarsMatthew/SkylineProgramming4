public boolean tempLeft = false;
public boolean tempRight = false;
public boolean left = false;
public boolean right = false;
public boolean play = false;
private String leftOption = "test";
private String rightOption = "test";
private boolean cardNotGotten = true;

void setup() {
  fullScreen();
  background(200);
}
void draw() {
  background(200);
  Card card = new Card();
  drawCard();
  drawSides();

  if (!play) {
    mainScreen();
    if (left==true) {
      play = true;
    }
    if (right==true) {
      background(200);
      text("Made by Matthew Sorensen and Jasper Mowdood", width/2, height-height/3);
    }
  } else
  {
    //I HATE THIS CODE SO MUCH AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BUT I GOTTA GET IT DONE
    if (cardNotGotten) {
      card.newCard(0);
      cardNotGotten = false;
    }
    if (card.isPeaceful()) {
      if (card.isChest()) {
        leftOption = card.getLeft();
        rightOption = card.getRight();
      } else {
      }
    } else {
      //Is hostile
      card.displayCard();
    }
  }
}
void drawSides() {
  //Colors for left rectangle
  if (tempLeft) {
    fill(0, 255, 0);
  } else {
    fill(255);
  }
  //Draw left rectangle
  rect(0, 0, width/10, height);
  fill(0);
  text(leftOption, width/19, height/2);
  //Colors for right rectangle
  if (tempRight) {
    fill(0, 255, 0);
  } else {
    fill(255);
  }
  //Draw right rectangle
  rect(width-width/10, 0, width, height);
  fill(0);
  text(rightOption, width-width/19, height/2);
  fill(255);
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
public void mainScreen() {
  textAlign(CENTER);
  textSize(60);
  fill(0);
  text("CardCrawler", width/2, height/8);
  textSize(40);
  text("Alpha 0.2.0", width/2, height/6.5);
  fill(255);
  leftOption = "play";
  rightOption = "credits";
}
