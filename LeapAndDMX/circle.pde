void drawCircle(){
   for (Hand hand : leap.getHands()){
     colorMode(HSB);
      
      PVector handPosition       = hand.getPosition();
      background(int(map(handPosition.y, yMin, yMax, 0, 255)), 255,255);
      
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
      
      circle(handPosition.x, handPosition.y, handPosition.z);
      
   }
}

void drawRectangle(){
    for (Hand hand : leap.getHands()){
     colorMode(HSB);
      
      PVector handPosition       = hand.getPosition();
      background(int(map(handPosition.y, yMin, yMax, 0, 255)), 255,255);
      
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
      rectMode(CENTER);
      stroke(255);
      rect(handPosition.x, (height/2), 50, height);
      
   }
}
