/*
Generates a splatter of circles at normally distributed locations, each with a normally distributed colour
*/

import java.util.Random;

Random generator;   //Random is a predifined Java class
float cx;
float cy;

void setup() {
  size(400,400);
  background(255);
  generator = new Random();
}

void draw(){
  translate(width/2, height/2);
  noStroke();
  fill(rndColor(),127);
  rndEllipse(0, 50);
  ellipse(cx, cy, 10, 10);  
}

/*
Generates the centre of each ellipse. The x and y coordinates normally distributed (mu, sigma) 
*/
void rndEllipse(float tempMu, float tempSigma){
  float mu = tempMu;
  float sigma = tempSigma;
  cx = (float) generator.nextGaussian() * sigma + mu;  //nextGaussian() returns a standard Gaussian distributed random number as a double, convert to float
  cy = (float) generator.nextGaussian() * sigma + mu;
}

//Generates a normally distributed color (mu=127, sigma=64)
color rndColor(){
  int r = (int) generator.nextGaussian() * 64 + 127;
  int g = (int) generator.nextGaussian() * 64 + 127;
  int b = (int) generator.nextGaussian() * 64 + 127;
  return color(r, g, b);
}