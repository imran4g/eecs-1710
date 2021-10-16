class flower {
  //will be where the bees start before you disturb them//
  PImage pinkflower;
  PVector position;
  float sizeVal;
  boolean alive = true;
  
  flower(float x, float y) {
    pinkflower = loadImage("flower.png");
    pinkflower.resize(200,200);
    position = new PVector(150, 150);
  }
  
  void update() {
  }
  
  void draw() {
    if (alive) {
     image(pinkflower, position.x, position.y);
     imageMode(CENTER);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
  
