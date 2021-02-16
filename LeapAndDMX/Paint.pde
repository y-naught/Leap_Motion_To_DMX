PGraphics gDraw;

float paintPositionX = width / 2;
float paintPositionY = height / 2;

void runPaint(){
  
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
      
      loadPixels();
      colorMode(RGB);
      
      
      paintPositionX = map(handPosition.x, xMin, xMax, -100, width + 100);
      paintPositionY = map(handPosition.y, yMin, yMax, -100, height + 100);
      //float positionz = map(handPosition.y, yMin, yMax, 50, 500);
      
      
  }
  
      gDraw.beginDraw();
      gDraw.fill(0,0,0,2);
      gDraw.rect(0,0,gDraw.width, gDraw.height);
      
      gDraw.noStroke();
      gDraw.fill(0,0,255,255);
      gDraw.circle(paintPositionX, paintPositionY, 50);
      setToZero();
      gDraw.endDraw();
      
      image(gDraw,0,0);
}

void startPaint(){
  gDraw = createGraphics(500, 500);
  //gDraw.blendMode(
  gDraw.beginDraw();
  gDraw.background(0);
  gDraw.endDraw();
}

void setToZero(){
  gDraw.loadPixels();
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      int thisPixel = j + i*height;
      color temp = gDraw.pixels[thisPixel];
      
      //print(currentAlpha);
      
      if(brightness(temp) < 70){
        gDraw.pixels[thisPixel] = color(0);
      }
    }
  }
  gDraw.updatePixels();
}
