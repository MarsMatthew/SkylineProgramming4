float value;
void setup(){
  size((360*2), 360);
}
void draw(){
  background(200);
  translate(360,180);
  strokeWeight(4);
  line(0,180,0,-180);
  //Being a psychopath and creating 16 variables all in one line.
  //x's and y's are the points actually displayed
  //a's and b's are x and y values of the initial shape
  float x1, x2, x3, x4, y1, y2, y3, y4, a1, a2, a3, a4, b1, b2, b3, b4;
  a1 = -10;
  b1 = 30;
  a2 = 10;
  b2 = 30;
  a3 = 10;
  b3 = 90;
  a4 = -10;
  b4 = 90;
  value = 0;
  
  //If the mouse is past the midline of the sketch
  if(mouseX > 360){
    //Right Boundary
   if (mouseX >= 380){
     value = 20.0;
   } else {
     //Rotation to right
     value = sqrt(mouseX-360);
   }
   }else if (mouseX < 360){
     //If the mouse is before the midline of the sketch
     if (mouseX<= 340){
       //Left Boundary
       value = -20.0;
     } else {
       //Rotation to the left
       value = sqrt((mouseX));
       value *= -1;
     }
  }
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
  //point(x1,y1);
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
  System.out.println("Mouse X:" + mouseX + " cos:" + cos(mouseX)+ " MouseY:" +mouseY);
  System.out.println("value: " +value + " sqrt(mouseX): " + sqrt(mouseX));
}
