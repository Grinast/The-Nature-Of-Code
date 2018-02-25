float t =0; //time

void setup() {
  size(400, 400);
  
}

void draw() {
  background(255);
  float n = noise(t);
  float m = noise(t+100);
  n = map(n, 0, 1, height/2, -height/2);
  m = map(m, 0, 1, height/2, -height/2);
  translate(width/2, height/2);
  fill(127);
  ellipse(m, n, 20, 20);
  t += 0.01;
}