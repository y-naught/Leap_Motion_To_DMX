float oscAmplitude = 60;
float oscAng = 0;
float oscRoc = PI/120;

float oscHandPositionX = width / 2;
float oscHandPositionY = height / 2;

void runOscGrad(){
  
  oscAmplitude = 200;
  for (Hand hand : leap.getHands()){
      
      PVector handPosition = hand.getPosition();
      
      if(handPosition.x > xMax){
         xMax = handPosition.x; 
      }
      if(handPosition.y > yMax){
         yMax = handPosition.y; 
      }
      if(handPosition.z > zMax){
         zMax = handPosition.z; 
      }
      
      if(handPosition.x < xMin){
         xMin = handPosition.x; 
      }
      if(handPosition.y < yMin){
         yMin = handPosition.y; 
      }
      if(handPosition.z < zMin){
         zMin = handPosition.z; 
      } 
      

      //int oscHandPositionX = int(map(handPosition.x, xMin, xMax, 0, 255));
      oscHandPositionY = int(map(handPosition.y, yMin, yMax, 0, 255));
    }
  
  for(int i = 0; i < numLights; i++){
    int s = i * width / numLights;
    int e = (i+1) * width / numLights;
    drawLines(int(height - (height/2 + oscAmplitude * sin(oscAng + i / 8.0))), s, e);
  }
  oscAng += oscRoc;
}

void runUsrOscGrad(){
  
  oscAmplitude = 0;
  for (Hand hand : leap.getHands()){
      
      PVector handPosition = hand.getPosition();
      
      if(handPosition.x > xMax){
         xMax = handPosition.x; 
      }
      if(handPosition.y > yMax){
         yMax = handPosition.y; 
      }
      if(handPosition.z > zMax){
         zMax = handPosition.z; 
      }
      
      if(handPosition.x < xMin){
         xMin = handPosition.x; 
      }
      if(handPosition.y < yMin){
         yMin = handPosition.y; 
      }
      if(handPosition.z < zMin){
         zMin = handPosition.z; 
      } 
      

      //int oscHandPositionX = int(map(handPosition.x, xMin, xMax, 0, 255));
      oscHandPositionY = int(map(handPosition.y, yMin, yMax, 0, height-100));
    }
  
  for(int i = 0; i < numLights; i++){
    int s = i * width / numLights;
    int e = (i+1) * width / numLights;
    drawLines(int(height - (oscHandPositionY)), s, e);
  }
  oscAng += oscRoc;
}

void drawLines(int h, int start, int end){
  
  for(int i = 0; i < h; i++){
    stroke(map(i, 0, h, 255,0));
    line(start, height - i, end, height - i);
    
  }
}
