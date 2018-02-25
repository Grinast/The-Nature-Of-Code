/*
Comparison between a walker whose step follow a montecarlo distribution (blue) 
and awalker whose steps follow a "power montecarlo distribution" (red),
i.e., the probability of accepting a value r1 is equal to r1^4 (favours big steps).
On a torus.
*/

import java.util.Random;
Random generator;

class walker {
  float x;
  float y;
  color c;

  walker(color tempC, float tempX, float tempY) { 
    c = tempC;
    x = tempX;
    y = tempY;
  }

  //this function displays the position of the walker as a dot on the screen
  void display() { 
    stroke(c);
    point(x, y);
  }
  
  //movement on a torus!
  float torus(float tempT){
    float t = tempT; 
    if (t >= width) {
      return t % width;
    } else if (t < 0) {
      return -(t % width);
    } else return t;
  }
  
  //this function lets the walker take a step in a random direction
  void step() {
    float stepx = random(-3, 3); //horizontal component
    float stepy = random(-3, 3); //vertical component
    x += stepx;
    y += stepy;
    x = torus(x);
    y = torus(y);
  }
  
  void montecarloStep() {
    float stepsize = 3*montecarlo();
    float stepx = random(-stepsize, stepsize); //horizontal component
    float stepy = random(-stepsize, stepsize); //vertical component
    x += stepx;
    y += stepy;
    x = torus(x);
    y = torus(y);
  }
  
  
  //this function lets the walker take a step in customly distributed direction
  void customStep() {
    float stepsize = 5*customRnd();
    float stepx = random(-stepsize, stepsize); //horizontal component
    float stepy = random(-stepsize, stepsize); //vertical component
    x += stepx;
    y += stepy;
    x = torus(x);
    y = torus(y);
  }
  
 float montecarlo(){
    while (true){
      float r1 = random(1);          //generate a random number
      float prob = r1;               //probability to accept r1
      float r2 = random(1);          //does r1 qualify?
      if (r2 < prob) {
        return r2;
      }
    }
 }
 
 float customRnd(){
    while (true){
      float r1 = random(1);          //generate a random number
      float prob = pow(r1,4);        //probability to accept r1
      float r2 = random(1);          //does r1 qualify?
      if (r2 < prob) {
        return r2;
      }
    }
 }
}

//MAIN

walker w; //declare new object
walker v;

void setup() {
  size(400, 400);
  w = new walker(color(255, 0, 0), width/2, height/2);//random(0, width), random(0, height));
  v = new walker(color(0, 0, 255), width/2, height/2);//random(0, width), random(0, height));
  generator = new Random();
  background(255);
}  

void draw() {
  fill(255, 2); //second (or fourth) argument indicates the opacity. 255=100%
  rect(0, 0, width, height);
  w.customStep();
  w.display();
  v.montecarloStep();
  v.display();
}