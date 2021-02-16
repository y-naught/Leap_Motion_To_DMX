
void solidColorRGB(){
  colorMode(RGB);
    for (Hand hand : leap.getHands()){
      
    PVector handPosition       = hand.getPosition();
    
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
    
    int red = int(map(handPosition.x, xMin, xMax, 0, 255));
    int green = int(map(handPosition.y, yMin, yMax, 0, 255));
    int blue = int(map(handPosition.z, zMin, zMax, 0, 255));
    
    background(red, green, blue);
    }
}

void solidColorHSB(){
    
    colorMode(HSB);
    for (Hand hand : leap.getHands()){
      
      PVector handPosition       = hand.getPosition();
      
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
      
      int red = int(map(handPosition.x, xMin, xMax, 0, 255));
      int green = int(map(handPosition.y, yMin, yMax, 0, 255));
      int blue = int(map(handPosition.z, zMin, zMax, 0, 255));
    
      background(red, green, blue);
    }
}
