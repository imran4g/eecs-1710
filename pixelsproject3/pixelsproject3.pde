PImage eren;
PImage destination;

void setup() {
  size(50, 50);
  eren = loadImage("eren.png");
  destination = createImage(eren.width, eren.height, RGB);
  surface.setSize(eren.width, eren.height);
  background(0);
}


void draw() {
  for (int i = 0; i < 300; i++) {
    float a = random(width);
    float b = random(height);
    color c = eren.get(int(a), int(b));
    fill(c, 25);
    noStroke();
    ellipse(a, b, 16, 16);
  }
}
void keyPressed(){
  if(key == 'P' || key == 'p'){
  loadPixels();
  eren.loadPixels();
  
for (int x = 0; x < eren.width; x++ ) {
    for (int y = 0; y < eren.height; y++ ) {

      int loc = x + y*eren.width;
      float r = red  (eren.pixels[loc]);
      float g = green(eren.pixels[loc]);
      float b = blue (eren.pixels[loc]);
      float distance = dist(mouseX, mouseY, x,y);
      float adjustBrightness = map(distance, 0, 400, 4, 0);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
     
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
  }
}
void mousePressed(){
    eren.loadPixels();
  destination.loadPixels();
 
  for (int x = 1; x < width; x++ ) {
    for (int y = 0; y < height; y++ ) {
      
    
       int loc = x + y*eren.width;
      color pix = eren.pixels[loc];
      int leftLoc = (x - 1) + y*eren.width;
      color leftPix = eren.pixels[leftLoc];
      float diff = abs(brightness(pix) - brightness(leftPix));
      destination.pixels[loc] = color(diff); 
    }
  }
  
  destination.updatePixels();
  image(destination,0,0);

}

     
