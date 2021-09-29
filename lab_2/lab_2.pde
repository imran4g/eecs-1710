PImage car, trees;
float x;
float y;
float place;
float speedx1;
float speedx2;

void setup() {
  size (750, 600, P2D);
  car = loadImage("car.jpg");
  trees = loadImage("trees.jpg");
  trees.resize(2500, 500);
  x = 375;
  y = 150;
  speedx1 = 7;
  speedx2 = 30;
  
  imageMode(CENTER);
 
}


void draw() {
  
  background(98, 96, 96);
  image(trees, x, y);
  noStroke();
  rect(place, 500, 50, 5);
  fill(234, 206, 43);
  image(car, mouseX, mouseY, 200 , 150); 
  
 
  
  x += speedx1;
  
    
  if (x > width || x < 0) {
    speedx1 *= -1;  
    
   place+=100;

   if(place > width)
  place=0;
   
 }  
  }
