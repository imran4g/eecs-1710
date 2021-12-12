void keyPressed() {
  if (button.hovered) {
    oscSendData = 1;
    oscSend();
  }
}

void keyReleased() {
  oscSendData = 0;
  oscSend();
}
