Card c = new Card();

/*
*Made by: Matthew Sorensen
*
*/
boolean play = false;
void setup() {
  frameRate(60);
  fullScreen();
}
void draw() {
  c.saveCard();
  background(200);
}
//void mainScreen(){
//  background(50);
//  textSize(60);
//  text("Card Crawler", displayWidth/2, displayHeight/2);
//  if(mousePressed || keyPressed){
//    play = true;
//  }
//}
