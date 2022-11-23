import oscP5.*;
import netP5.*;

int tick = 0;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  fullScreen(0);
  frameRate(25);
  oscP5 = new OscP5(this, 12000);

  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}


void draw() {
  background(0);
  if (tick > 0 && tick % 10 == 0) {
    OscMessage myMessage = new OscMessage("/click");
    myMessage.add(1); /* add an int to the osc message */
    background(255);
    oscP5.send(myMessage, myRemoteLocation);
  }

  if (tick > 0 &&  tick % 40 == 0) {
    OscMessage myMessage = new OscMessage("/bass");
    myMessage.add(1); /* add an int to the osc message */
    background(255, 0, 0);
    oscP5.send(myMessage, myRemoteLocation);
  }
  tick++;
  if (tick >= 60) {
    tick = 0;
  }
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
