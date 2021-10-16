import processing.sound.*;
//sound refernce from John McCaffrey//
int numbees = 10;
int numflowers = 1;
PImage beehive;
SoundFile file;

bee[] bees = new bee[numbees];
flower[] flowers = new flower[numflowers];

void setup() { 
  size(800, 600, P2D);
  beehive = loadImage("beehive.jpg");
  beehive.resize(beehive.width * (height / beehive.height), height);
  file = new SoundFile(this, "Bees 3 - QuickSounds.com.mp3");
  
    for (int i=0; i<bees.length; i++) {
    bees[i] = new bee(random(width), random(height));
  }
   for (int i=0; i<flowers.length; i++) {
    flowers[i] = new flower(random(width), random(height));
  }
}
void draw() {
  image(beehive, 400, 300);
  fill (255);
  textSize(22);
  text("click me", 600,100);
  fill(255,0,0);
  ellipse(550, 100, 30, 30);
  if (mousePressed && dist(mouseX, mouseY, 550, 100) < 50) {
 file.play();
  
}
 for (int i=0; i<flowers.length; i++) {
    flowers[i].run();
 
 
 }
for (int i=0; i<bees.length; i++) {
  bees[i].run();
}
 
  }
 // bees will start in a group pollinating then you disturb them where they will be moving away from your mouse being angry, click the button to make yourself feel the "beehive" enviroment//
