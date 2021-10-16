class bee {
  
 //most coding reference here learnt and taught by nick// 
PVector position, target;
PImage beeCurrent, bee01, bee02;
float margin = 50;
int flowerChoice;

boolean ismad = false;
int madMarkTime = 0;
int madTimeout = 3000; 
float madSpread = 5;

boolean pollinating = false;

float triggerDistance1 = 100;
float triggerDistance2 = 25;
float movementSpeed = 0.08;

  bee(float x, float y){
  position = new PVector(x, y);
  pickrunTarget();
  
  bee01 = loadImage("happybee (1).png");
  bee01.resize(bee01.width/3, bee01.height/3);
  bee02 = loadImage("angrybee (1).png");
  bee02.resize(bee01.width, bee01.height);

  
  beeCurrent = bee01;
  
}
void update() {
  
  PVector mousePos = new PVector(mouseX, mouseY);
  ismad = position.dist(mousePos) < triggerDistance1;

   if (ismad) {
    madMarkTime = millis();
    beeCurrent = bee02;
    position = position.lerp(target, movementSpeed).add(new PVector(random(-madSpread, madSpread), random(-madSpread, madSpread)));
   if (position.dist(target) < triggerDistance2) {
      pickrunTarget();
    }
  } else if (!ismad && millis() > madMarkTime + madTimeout) {
    } else if (!ismad && millis() > madMarkTime + madTimeout/6) {
    beeCurrent = bee01; 
  }
  
  if (!pollinating) {
    pickflowerTarget();
    pollinating = true;
  }
    else if (!ismad && millis() > madMarkTime + madTimeout/6) {
      beeCurrent = bee01; 
    }
  
    if (ismad || pollinating) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-madSpread, madSpread), random(-madSpread, madSpread)));
    }
    
 
  position.y += sin(millis()) / 2;
  
  }
void draw() {    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
    
    image(beeCurrent, position.x, position.y);
}
  void run() {
    update();
    draw();
  }
  void pickrunTarget() {
  target = new PVector(random(margin, width-margin), random(margin, height-margin));
 }
 void pickflowerTarget() {
    flowerChoice = int(random(flowers.length));
    if (flowers[flowerChoice].alive) {
      target = flowers[flowerChoice].position;
    }
}


}
