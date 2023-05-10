PImage wood;

void setup(){
  fullScreen();
  wood = loadImage("2890580.png");
}

void draw(){
  imageMode(CORNERS);
  image(wood,0,0,displayWidth,displayHeight);
}
