//Declare variables

//Define class
class ball{
  float xpos;
  float ypos;
  float r;
  color c;

  //Constructor
  ball(float tempXpos, float tempYpos, float tempR, color tempC){
    xpos = tempXpos;
    ypos = tempYpos;
    r = tempR;
    c = tempC;
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(xpos, ypos, r, r);
  }
}

ball Oneball;

void setup() {
  size(600, 600);
  background(0);
  Oneball = new ball(100.0, 100.0, 50.0, color(255,0,0));
}

void draw() {
  Oneball.display();
}