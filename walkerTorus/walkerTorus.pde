//random walk on a torus

class walker {
  float x;
  float y;
  color c;

  walker(color tempC, float tempX, float tempY) { 
    // x = width/2; //walker starts in the middle of the screen
    // y = width/2;
    c = tempC;
    x = tempX;
    y = tempY;
  }

  //this function displyas the postion of the walker as a dot on the screen
  void display() { 
    stroke(c);
    point(x, y);
  }

  //this function lets the walker take a step in a random direction
  void step() {
    float stepx = random(-3, 3); //horizontal component
    float stepy = random(-3, 3); //vertical component
    x += stepx;
    y += stepy;
    //movement on a torus!
    if (x >= width) {
      x -= width;
    }
    if (x < 0) {
      x += width;
    }
    if (y >= height) {
      y -= height;
    }
    if (y < 0) {
      y += height;
    }
  }
}

//MAIN

walker w; //declare new object
walker v;
walker u;

void setup() {
  size(400, 400);
  w = new walker(color(255, 0, 0), random(0, width), random(0, height));
  v = new walker(color(0), random(0,width), random(0,height));
  u = new walker(color(0,0,255), random(0,width), random(0,height));
  background(255);
}  

void draw() {
  fill(255, 2); //second (or fourth) argument indicates the opacity. 255=100%
  rect(0, 0, width, height);
  w.step();
  w.display();
  v.step();
  v.display();
  u.step();
  u.display();
}