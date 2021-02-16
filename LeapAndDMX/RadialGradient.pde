

void runRadialGradient(){
  
  
  
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
      
      loadPixels();
      colorMode(RGB);
      
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float positionX = map(handPosition.x, xMin, xMax, 0, width);
      float positionY = map(handPosition.y, yMin, yMax, height, 0);
      //float positionz = map(handPosition.y, yMin, yMax, 50, 500);
      float distance = dist(positionX, positionY, j, i);
      int temp = int(map(distance, 140, 0, 0, 255));
      pixels[j + i * height] = color(temp, temp, temp);
    }
  }
  updatePixels();
      
    
  }
    
}
