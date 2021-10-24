//welcome to the mario theme brick breaker game! The button aspect of the game is to press b to increase the number of blocks in order to increase difficulty. Hope you have fun//

//setup//
import processing.sound.*;

int x1, y1;    
int x2, y2;    
int paddle;           
int rows;
int[][] blocks = new int[40][10]; 
SoundFile file, file2;
long start, playtime = 0L;
boolean play = false;  
String bigwords, smallwords = "";
boolean auto = false;
PImage world, shell;
void setup() {
   size(600, 400, P2D);
  x1 = int(random(100, width-100));
  y1 = height -62;
  x2 = -5;
  y2 = -5;
  paddle = x1;
  rows = 3;  
  //loading in my files//
  file = new SoundFile(this, "02. Menu Theme.mp3");
  file.play();
  file2 = new SoundFile(this, "04. Overworld Theme.mp3");
  world = loadImage("mario.jpg");
  world.resize(world.width * (height / world.height), height);
  shell = loadImage("koopa.png");
  shell.resize(30, 30);
 
  //start menu words//
  bigwords = start<500 ? "SUPER MARIO BLOCK BREAKER" : "GAME OVER";
  smallwords = "click mouse to start";
  
 for(int i=0; i<blocks.length; i++)
    for(int j=0; j<blocks[i].length; j++)
      blocks[i][j] = i<rows ? 1 : 0;
}
void draw() {
   image(world, 0,0 );
   //description//
  fill(255); rect(0, 0, width, 29);
   fill(0); textSize(12); textAlign(LEFT, CENTER); text("Press b to add rows of blocks you want at your own risk, add while playing for a greater challenge", 10, 0, width, 30);
   //banner//
  fill(0); textSize(26); textAlign(CENTER, CENTER); text(bigwords, 0, 0, width, height);
  fill(0); textSize(14); textAlign(CENTER, CENTER); text(smallwords, 0, 25, width, height);

 //ball//
  image(shell, x1, y1); 
  int radius = 25 / 2;  
  
  //paddle//
  strokeWeight(6); stroke(20); line(paddle-(100), height-40, paddle+(100), height-40);
 
 
 for(int i=0; i<rows; i++){
    fill(222,119,16);
    strokeWeight(3);
    for(int j=0; j<10; j++){
      if(blocks[i][j] == 1) rect(j*60+0.25, i*20 + 30, 60, 20);
    }
  }
  
  if(play) {
    playtime = millis() - start;
    paddle = auto?x1:mouseX;
    x1 += x2;
    y1 += y2;
    
    // reference from sueyong studio block breaker for how to make the ball bounce off bricks and paddle//
    if(x1 <= radius || x1 >= width-radius){  
      x2 *= -1;
    }else{
      if(blocks[(y1-30)/20][(x1-radius)/60] == 1){    
        x2 *= -1;
        blocks[(y1-30)/20][(x1-radius)/60] = 0;
        
      }else if(blocks[(y1-30)/20][(x1+radius)/60] == 1){   
        x2 *= -1;
        blocks[(y1-30)/20][(x1+radius)/60] = 0;
        
      }
    }
    if(y1 < 40){    
      y2 *= -1;
    }else{
      if(blocks[(y1-30-radius)/20][(x1)/60] == 1){   
        y2 *= -1;
        blocks[(y1-30-radius)/20][(x1)/60] = 0;
        
      }else if(blocks[(y1-30+radius)/20][(x1)/60] == 1){   
        y2 *= -1;
        blocks[(y1-30+radius)/20][(x1)/60] = 0;
        
      }
    }
    
    
    if(y1 > height-62 && y1 < height-52 && x1 >= paddle-(200/2) && x1 <= paddle+(200/2)){
      y2 *= -1;
    }
    
   
    
    //end//
    if(y1 > height+(radius*2) || rows == blocks.length){
      play = false;
      file2.stop();
      setup();
    }
  }
}

void mouseClicked() {
  //sart//
  if(!play){
    play = true;
    start = millis();
file.stop();
file2.play();
  }
  bigwords = ""; smallwords = "";
}

void keyPressed(){
  //press key to make blocks appear//
  if(key == 'B' || key == 'b'){
          rows++;
      for(int i=rows-1; i>=0; i--){
        for(int j=0; j<10; j++){
          blocks[i][j] = i==0?1:blocks[i-1][j];
        }
      }  

}

}
