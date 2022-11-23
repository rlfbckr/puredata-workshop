import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400, 400);
  frameRate(25);
  oscP5 = new OscP5(this, 12000);

  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}


void draw() {
  background(0);
  OscMessage myMessage = new OscMessage("/mouse");

  myMessage.add(mouseX); /* add an int to the osc message */
  myMessage.add(mouseY); /* add a float to the osc message */
  background(255);
  oscP5.send(myMessage, myRemoteLocation);
}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/mouse");

  myMessage.add(mouseX); /* add an int to the osc message */
  myMessage.add(mouseY); /* add a float to the osc message */
  background(255);
  oscP5.send(myMessage, myRemoteLocation);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
