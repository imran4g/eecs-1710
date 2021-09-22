float place;
float up ;
void setup() {
     size(800,590, P2D);
     ellipseMode(CENTER);
     place=800;
     up=600;
     background(123,240,159);
}
void draw() {
  //four squares to draw in with cool colour effect//
  noStroke();
  place=place+15;
  up=up+15;

 if(place > width) {
  
  place=0 ;
  
 if(up > height)
  up=0;
}
   
    fill(random(200),random(255),(255));
    rect(place,300,10,10);
    rect(375,up, 10, 10);
    
    
}
//press and drag mouse to draw within the 4 aquares//
void mouseDragged() {
  fill(0,0,0);
  ellipse(mouseX,mouseY,10,10);
  
}

void mousePressed() {
  fill(0,0,0);
  ellipse(mouseX,mouseY,10,10);
  
}

//drawing a bit slowly wont leave any blank spaces in your line//
