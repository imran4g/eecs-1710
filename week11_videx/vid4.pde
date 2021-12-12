import processing.video.*;


Capture capture;


PImage videoImg;

void setupCapture(int whichCamera) {  
  String[] cameraNames = capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture = new Capture(this, 320, 240, cameraNames[whichCamera], 30);    
  capture.start();
}



void captureEvent(Capture c) {
  c.read();
  videoImg = c;
  armOpenCvUpdate = true;
}
