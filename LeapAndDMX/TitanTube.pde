class Tube{
  
  int startChannel;
  int numLeds;
  PVector position;
  //pixels per distance between pixels inside the tube
  float scale;
  int tubeHeight = 250;
  int tubeWidth = 30;
  
  Tube(int ch, int leds, PVector pos){
    
    position = pos.copy();
    startChannel = ch;
    numLeds = leds;
    scale = tubeHeight / leds;
    
  }
  
  void sample(){
    
    for(int i = 0; i < numLeds; i++){
      int currentChannel = i * 3 + startChannel;
      int thisColor = pixels[int(position.x) + (int(position.y) + int(scale) * i - (tubeHeight / 2)) * width];
      
      int red = thisColor >> 16 & 0xFF;
      int green = thisColor >> 8 & 0xFF;
      int blue = thisColor & 0xFF;
      
      dmxOutput.set(currentChannel, red);
      dmxOutput.set(currentChannel + 1, green);
      dmxOutput.set(currentChannel + 2, blue);
    }
  }
  
  void show(){
    rectMode(CENTER);
    stroke(0);
    fill(255);
    rect(position.x, position.y, tubeWidth, tubeHeight);
    fill(0);
    text(startChannel, position.x, position.y);
  }
  
}


void runTubes(){
  
  for(int i = 0; i < tubes.size(); i++){
    Tube thisTube = tubes.get(i);
    loadPixels();
    thisTube.sample();
    updatePixels();
    if(showLights){
      thisTube.show();
    }
    
  }
  
  
}
