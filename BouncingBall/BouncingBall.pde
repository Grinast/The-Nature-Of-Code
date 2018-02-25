import java.util.Random;

Random generator;

PVector pos;
PVector vel;
PVector acc;

float r = 20;
float t = 0;
float red =0;

 
 //acc = new PVector(0.,0.);
 //generator = new Random();
 
void setup() {
 size(400,400);
 background(255);
 pos = new PVector(100.,100.);
 vel = new PVector(2,-3);
}

void draw() {
 background(255);
 //vel.x = 2;//(float) generator.nextGaussian()*0.5;
 //vel.y = -3; //(float) generator.nextGaussian()*0.5;
 //vel.add(acc);
 pos.add(vel);
 
  
 //bouncing
 if ((pos.x + r/2 > width) || (pos.x - r/2 < 0)) {       // || is the "or" symbol
  vel.x = -vel.x; 
  red += 20;
 }
 
 if ((pos.y + r/2 > height) || (pos.y - r/2 < 0)) {
  vel.y = -vel.y; 
  red += 20;
 }
 
 fill(color(red,155-red,155-red));
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