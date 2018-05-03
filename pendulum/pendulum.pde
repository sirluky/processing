float r = 400.0,angle = 0.1, aVel = 0.0, aAcc = 0.0,x = 960, y = 10.0, x_, y_, force = 0;
void setup(){
  frameRate(10000);
 size(500,500); 
 //fullScreen();
 //smooth();
}
void draw() {
  //background(255,255,255,1);
  update();
  fill(255,200);
  stroke(220);
  strokeWeight(2);
  translate(x,y);
  line(0,0,x_,y_);
  noStroke();
  fill(map(x_,80,height-80, 0,255),100,map(y_,-r-100,r-100, 0,255));
  ellipse(x_,y_,40,40);
  if(frameCount%1000 == 0)
  println(frameCount);
  
}
void update(){
  aAcc = -angle/300;
  force *= 0.7;
  aAcc += force;
  aVel += aAcc;
  aVel *= 1.001;
  aAcc = 0;
  angle += aVel;
  x_ = sin(angle)*r;
  y_ = cos(angle)*r; 
}
void mousePressed() {
  force += 0.01;
}