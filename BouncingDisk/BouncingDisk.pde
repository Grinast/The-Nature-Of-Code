PVector pos;
PVector vel;
float r = 20;

void setup() {
 size(400,400);
 background(255);
 pos = new PVector(100.,100.);
 vel = new PVector(1.,2.);
}

void draw() {
 background(255);
 pos.add(vel);
 
 //bouncing
 if ((pos.x + r/2 > width) || (pos.x - r/2 < 0)) {       // || is the "or" symbol
  vel.x = -vel.x; 
 }
 
 if ((pos.y + r/2 > height) || (pos.y - r/2 < 0)) {
  vel.y = -vel.y; 
 }
 
 fill(127);
 ellipse(pos.x,pos.y,r,r);
}

//Vector class
class PVector {
  float x;
  float y;
  
  //Vector constructor
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void add(PVector v){
   x = x + v.x;
   y = y + v.y;
  }
}