import dmxP512.*;
import processing.serial.*;

import de.voidplus.leapmotion.*;

DmxP512 dmxOutput;
int universeSize = 512;

boolean DMXPRO=true;
String DMXPRO_PORT="/dev/cu.usbserial-EN237404";
int DMXPRO_BAUDRATE=115000;
int lastFrame = 0;

ArrayList<LinearGradient> gradients = new ArrayList<LinearGradient>();
ArrayList<Tube> tubes = new ArrayList<Tube>();

LeapMotion leap;

float xMax = 0, yMax = 0, zMax = 0;

float xMin = 0, yMin = 0, zMin = 0;

int numLights = 8;
int ledsPerLight = 8;

void setup(){
   //fullScreen();
   size(500,500, JAVA2D);
   background(0);
   frameRate(60);
   leap = new LeapMotion(this).allowGestures("swipe");
   dmxOutput=new DmxP512(this,universeSize,true);
   dmxOutput.setupDmxPro(DMXPRO_PORT,DMXPRO_BAUDRATE);
   
   addTubes(numLights, ledsPerLight);
   
   for(int i = 0; i < numBlocks; i++){
    PVector tempLocation = new PVector((i + 1) * width / float(numBlocks+1), height/2);
    blocks.add(new Block(tempLocation, rocMin, rocMax));
    
    startPaint();
  }
}



void draw(){
  //background(0);
  pickEffect();
  
  //setTenLights();
  runTubes();
  
  fill(255);
  text(frameRate, 10,10);
}
  

//The keyboard settings
void keyPressed(){
  if(key == 'a'){
    background(0);
  }
  if(key== 'p'){
    println(xMax, yMax, zMax);
    println(xMin, yMin, zMin);
    println(xMax - xMin, yMax - yMin, zMax - zMin);
  }
  if(key == 'o'){
     println(width, height); 
  }
  if(key == 't'){
     toggleEffect(); 
  }
  if(key == 'y'){
     reverseToggleEffect();
  }
}  


//The callback functions for the Leap Motion Controller
void leapOnInit() {
   println("Leap Motion Init");
}
void leapOnConnect() {
   println("Leap Motion Connect");
}
void leapOnFrame() {
   //println("Leap Motion Frame");
}
void leapOnDisconnect() {
    println("Leap Motion Disconnect");
}
void leapOnExit() {
   println("Leap Motion Exit");
}

void leapOnSwipeGesture(SwipeGesture g, int state){
  if(frameCount - lastFrame > 15 && sw == 3){
    int     id               = g.getId();
    Finger  finger           = g.getFinger();
    PVector position         = g.getPosition();
    PVector positionStart    = g.getStartPosition();
    PVector direction        = g.getDirection();
    float   speed            = g.getSpeed();
    long    duration         = g.getDuration();
    float   durationSeconds  = g.getDurationInSeconds();
    
    //println("Swipe");
    
    switch(state){
      case 1: // Start
        println("SwipeGesture: " + id);
        //println(speed);
        //println(direction);
        gradients.add(new LinearGradient(speed/50, 75, direction)); 
        lastFrame = frameCount;
        break;
      case 2: // Update
        break;
      case 3: // Stop
        
        break;
    }
  }
}

void mouseDragged(){
  for(int i = 0; i < tubes.size(); i++){
    Tube thisTube = tubes.get(i);
    if(abs(mouseX - thisTube.position.x) < 10 && abs(mouseY - thisTube.position.y) < 40){
      PVector tempVector = new PVector(mouseX, mouseY);
      thisTube.position = tempVector.copy();
    }
  }
}
