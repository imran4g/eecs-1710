//the use of pg.filter//
//learnt and taught by nick//
PImage img;
PGraphics pg;

void setup() {
  size(1300, 800, P2D);
  
  img = loadImage("maxresdefault1.jpg");
  
  pg = createGraphics(img.width/10, img.height/10, P2D);
}

void draw() {
  background(127);

  stroke(0, 0, 255);
  fill(200, 6, 90);
  ellipse(100, height/2, 100, 100);
  
  pushMatrix();
  scale(2.0);
  pg.beginDraw();
  pg.image(img, 0, 0, pg.width, pg.height);
  pg.filter(OPAQUE);
  pg.filter(DILATE);
  pg.filter(INVERT);
  pg.endDraw();
  
  image(pg, 0, 0);
  popMatrix();
  
  image(img, 200, 100);
}
