float r = 0, alfa ;
float[] body = new float[100000];
void setup() {
  fullScreen();
  background(255);
  
  
}
void draw() {
  kresli();
  r+=0.3;
  alfa+= 0.03;
}
void kresli() {
  
  beginShape();
  if(!r > height) {
    float xoff = sin(alfa)*r;
  float yoff = cos(alfa)*r;
  stroke(30);
  strokeWeight(3);
  println(xoff + " " +  yoff);
  pushMatrix();
  translate(width/2, height/2);
  vertex(xoff,yoff);
  body.push();
  endShape();
  popMatrix();
  }
}
void mousePressed() {
  
}