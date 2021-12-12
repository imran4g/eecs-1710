class Tile {

  PVector position;
  float size;
  int born = 1;
  int death = 1000;
  boolean alive = true;
  float size2;
  PImage letter;
  
  //code here learnt and taught by nick//
  Tile(int x, int y, int sizes) {
    position = new PVector(x, y);
    size = sizes;
    size2 = size / 100.0;    
    born = millis();
    letter = loadImage("c99.png");
  }
  
  void update() {
    
    if (alive) {
      position.y += size2;
      if (millis() > born + death) alive = false;
    }
  }
  
  void draw() {
    noStroke();
    fill(random(255), random(255), random(255));
    rect(position.x, position.y, size, size);
     
     image(letter,position.x, position.y, size, size);
     rotate(90);
  }
  
  void run() {
    update();
    draw();
  }
  
}
