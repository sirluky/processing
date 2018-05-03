int total = 0, inCircle = 0,wSize = 640;
double pi = 0;
float randX = 0, randY = 0;
void setup(){
  size(1000,1000);
  background(0);
}
void draw() {
  for(int i = 0; i < 100000; i++) { 
  randX = random(-width/2,width/2);
  randY = random(-width/2,width/2);
  if(sqrt(randX*randX+randY*randY) >= width/2) {
  stroke(0,0,255);
  
  }
  else {
  stroke(255,0,0);
  inCircle++;
}
  total++;
  pushMatrix();
  translate(width/2,height/2);
  point(randX,randY);
  popMatrix();
  
  }
  pi = (double) inCircle/ (double) total;
  pi *= 4;
  println(pi);
}