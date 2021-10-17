void setup(){
  size(400,400);
  smooth();
  
  
}

int sunX = 280;
int sunY = 100;
int moonX = 280;
int moonY = 100;
int state = 0;
int speed = 1;
float SSColorR = 0;
float SSColorG = 24;
float SSColorB = 72;


//Colour change/inspiration reference from Elizabeth Rath//

void draw(){
  
 
 if(state == 0){
    sunX = sunX - speed;
    SSColorR = SSColorR + ((198.0-0.0)/(450.0+52.0));
    SSColorG = SSColorG + ((229.0-24.0) /(450.0+52.0)); 
    SSColorB = SSColorB + ((217.0-72.0) /(450.0+52.0));
    background(int(SSColorR),int(SSColorG),int(SSColorB));
    fill(248,202,0);
    noStroke();
    ellipse(sunX,sunY, 100,100);
       if (sunX < -52) {
       sunX = 280;
       state = 1;
        } 
 } 
 
 else if (state == 1){
    moonX = moonX - speed;
    SSColorR = SSColorR - ((198.0-0.0)/(450.0-150.0)); 
    SSColorG = SSColorG - ((229.0-24.0) /(450.0-150.0)); 
    SSColorB = SSColorB - ((217.0-72.0) /(450.0-150.0)); 
    background(int(SSColorR),int(SSColorG),int(SSColorB)); 
    fill(255);
    noStroke();
    ellipse(moonX,moonY, 100,100);
    if (moonX < 100) {
      state=0;
      moonX = 280;
         } 
    } 

  fill(0,225,0);
 rect(0,300,400,400);
  
 


  
     }
     
