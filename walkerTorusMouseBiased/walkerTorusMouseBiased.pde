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
    void unifStep() {
    float stepx = random(-3, 3);  //horizontal component
    float stepy = random(-3, 3);  //vertical component
    float num = random(1);     //random number between 0 and 1
    float probUp = 0.5;   //upward bias (0,0.5]
    float probDown = 0.75;   //downward bias [0.75,1)
    if (num < probUp){       // Rmk: (0,0) is the up left corner, y-axis points down
      y -= stepy;
    } else if (num > probDown) {
      y += stepy;
    }
    x += stepx;
    
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
  
  //this function lets the walker take a step in the direction of the mouse
  void mouseStep() {
    float stepx = random(3);  //horizontal component
    float stepy = random(3);  //vertical component
    if (x < mouseX){       
      x += stepx;
    } else if (x > mouseX) {
      x -= stepx;
    }
    if (y < mouseY){       
      y += stepy;
    } else if (y > mouseY) {
      y -= stepy;
    }
    
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

void setup() {
  size(400, 400);
  w = new walker(color(0), random(0,width), random(0,height));
  background(255);
}  

void draw() {
  //fill(255, 2); //second (or fourth) argument indicates the opacity. 255=100%
  //rect(0, 0, width, height);
  float num = random(1);
  if (num <0.7) {
    w.unifStep();
  } else {
    w.mouseStep();
  }
  w.display();
}