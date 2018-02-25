//Selects a random number from a predifined vector
int[] stuff = new int[5]; //vector of integers, lenght 5

void randomVec(){
  stuff[0] = 1;
  stuff[1] = 1;
  stuff[2] = 1;
  stuff[3] = 2;
  stuff[4] = 3;
  int index = int(random(stuff.length));
  println(stuff[index]);
}

//Do A with probability prob, B with probability 1-prob
float prob;

void randomWithProb(float tempProb){
  prob = tempProb;
  float num = random(1);     //random number between 0 and 1
  if (num <= prob){
    println("A");
  } else {
    println("B");
  }
}

void setup(){
  for (int i = 0; i < 10; i++){
    randomWithProb(0.6);
  }
}