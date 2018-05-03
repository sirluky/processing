ArrayList<kokos> ohnicky = new ArrayList<kokos>();
void setup() {
  frameRate(60);
//size(1920,1080,P2D);
fullScreen(P2D);
strokeWeight(20);
//smooth(8);
//noCursor();
}
void draw() {
  ohnicky.add(new kokos());
  background(20);

float targetx = mouseX;
float targety = mouseY;

for(int i = ohnicky.size()-1; i >= 0; i--) {
  kokos pom = ohnicky.get(i);
  pom.show();
  pom.update();
  pom.physics();
  if(pom.alphaval == 0 && pom.gettingup == 0)
  ohnicky.remove(i);
}
}
class kokos{
  int gettingup = 1;
  float x = random(width);
  float y = random(height);
  float r = random(100,255);
  float g = random(100,255);
  float b = random(80);
  float accx = 0;
  float accy = 0;
  float velx = 0;
  float vely = 0;
  int alphaval = 0;
  void show() {
    //stroke(r-30,g-30,b,alphaval);
    //fill(r,g,b,alphaval);
    //ellipse(x,y, 20,20);
    stroke(r,g,b,alphaval);
    point(x,y);
  }
  void update() {
    if(gettingup == 1) {
  alphaval+=3;
  if (alphaval > 300)
  gettingup = 0;
    }
    else
    alphaval-=3;
  
  }
  void physics() {
    accx = mouseX - x;
    accy = mouseY - y;
    normalizeacc();
    accx *= 0.1;
    accy *= 0.1;
    velx += accx;
    vely += accy;
    limitvel();
    x += velx;
    y += vely;
    
  }
  
  
  
  
  void normalizeacc() {
//float pomxacc = accx;
if(abs(accx) > abs(accy)){
  accy /= abs((float)accx);
  accx /= abs((float)accx);
} else {
  accx /= abs((float)accy);
  accy /= abs((float)accy);
}
//println(accx + " " + accy);
}
  void limitvel() {
    float vellimit = 5;
  if(velx > vellimit) {
  velx = vellimit;
  normalizevel();
  }
  if(vely > vellimit) {
  vely = vellimit;
  normalizevel();
  }
  if(velx < -vellimit){
  velx = -vellimit;
  normalizevel();
  }
  if(vely < -vellimit) {
  vely = -vellimit;
  normalizevel();
  }
  }
  void normalizevel() {
//float pomxacc = accx;
if(abs(velx) > abs(vely)){
  vely /= abs((float)velx);
  velx /= abs((float)velx);
} else {
  velx /= abs((float)vely);
  vely /= abs((float)vely);
}
velx *= 5;
vely *= 5;
}
}

void mousePressed() {
ohnicky.add(new kokos());
}