//final project, hit any key on ur keyboard with your mouse on places of the sketch to here the midi noises//
//hold and dragg your mouse to hear the pillar men theme with the change of volume from top left to bottom right//
import processing.sound.*;
import themidibus.*;


MidiBus myBus;
SoundFile file;
int channel = 0;
int A, B;
ArrayList<Tile> tiles;
PImage pillarmen;


void setup() {
  size(640, 480, P2D);
   pillarmen = loadImage("pillarmen.jpg");
   pillarmen.resize(pillarmen.width * (height / pillarmen.height), height);
  file = new SoundFile(this, "pillar_man_theme.mp3");
  MidiBus.list();
  myBus = new MidiBus(this, -1, 1);
  tiles = new ArrayList<Tile>();
}

void draw() {
  image(pillarmen,-100, 0);
  //code here learnt and taught by nick//
  for (int i=tiles.size()-1; i>=0; i--) {
    Tile Tile = tiles.get(i);
    if (Tile.alive) {
      Tile.run();
    } else {
      tiles.remove(i);
    }
  }
}

void keyPressed() {
  A = int(map(mouseY, height, 0, 0, 127));
  B = int(map(mouseX, 0, width, 0, 127));
  myBus.sendNoteOn(channel, A, B);
  
  tiles.add(new Tile(mouseX, mouseY, B + 10));
}



void mousePressed(){
   A = int(map(mouseY, height, 0, 0, 120));
  B = int(map(mouseX, 0, width, 0, 120));
 file.play();
  tiles.add(new Tile(mouseX, mouseY, B + 10));
  
}
  
   
void mouseDragged(){
   A = int(map(mouseY, height, 0, 0, 120));
  B = int(map(mouseX, 0, width, 0, 120));
  tiles.add(new Tile(mouseX, mouseY, B + 10)); 
    if (mousePressed && dist(mouseX, mouseY, 100, 100) < 50) {
    file.amp(0.1);
   }
    else if (mousePressed && dist(mouseX, mouseY, 400, 300) < 75) {
    file.amp(0.7);
  }
     
     else if (mousePressed && dist(mouseX, mouseY, 250, 200) < 75) {
    file.amp(0.4);
 
    
  }
}
      
void mouseReleased() {
  file.pause();
}

void keyReleased() {
  myBus.sendNoteOff(channel, A, B);
}
