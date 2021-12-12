
void oscSetup() {
  oscP5 = new OscP5(this, receivePort);  // start osc
  myRemoteLocation = new NetAddress(ipNumber, sendPort);
}


void oscEvent(OscMessage myMessage) {
  println(myMessage);
  if(myMessage.checkAddrPattern("/" + channel)) {
    if(myMessage.checkTypetag("f")) {  // types are i = int, f = float, s = String, ifs = all
      oscReceiveData = myMessage.get(0).floatValue();  // commands are intValue, floatValue, stringValue
    }  
  }
}


void oscSend(){
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData);
  oscP5.send(myMessage, myRemoteLocation);
}
