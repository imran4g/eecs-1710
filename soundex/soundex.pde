import processing.sound.*;


SoundFile file;

void setup() { 
  size(800, 600, P2D);
  file = new SoundFile(this, "1-02 Main Theme.mp3");
}
void draw() {
  background(0);
  text("click me", 375, 200);
  fill(0,255,0);
  ellipse(400, 300, 100, 100);
  if (mousePressed && dist(mouseX, mouseY, 400, 300) < 50) {
 file.play();
 
 
  float amplitude = map(mouseY, 0, width, -1, 1.0);
  file.amp(amplitude);
  float panning = map(mouseY, 0, height, -1.0, 1.0);
  file.pan(panning);
  
  }
  
}
