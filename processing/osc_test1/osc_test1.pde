import oscP5.*;
import netP5.*;

// VARIABLE //////////////////////////////////////////////
float xA = -100;
float yA;
float csXY = 40;
OscP5 oscP5;
NetAddress myBroadcastLocation;

// SETUP ////////////////////////////////////////////// 
void setup() {
  size(320, 240);
  background(0);
  smooth();
  
  //osc
  oscP5 = new OscP5(this,12000);
  //myBroadcastLocation = new NetAddress("127,0,0,1",32000);
}

// DRAW //////////////////////////////////////////////
void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  plus();
}

// PRIVATE //////////////////////////////////////////////
void plus() {
  yA = sq(xA)/60;
  noStroke();
  fill(255, 255, 255, 80);
  ellipse(xA+width/2,yA,csXY,csXY);
  xA++;
  //println(yA);
  
  if(xA > 200){
   xA = -200; 
  }
  
}

void oscEvent(OscMessage theOscMessage) {
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
  
  if(theOscMessage.checkAddrPattern("/1/fader1") == true){
   println("true");
   float value = theOscMessage.get(0).floatValue();
   println(value);
   csXY = 100*value;
  }else{
   println("false"); 
  }
  
}
