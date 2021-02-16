ArrayList<Block> blocks = new ArrayList<Block>();
int numBlocks = 8;
float rocMin = PI/200;
float rocMax = PI/120;
float rocMultiplier = 1.00;

class Block{
  
  PVector location;
  float angle = 0;
  float roc;
  
  Block(PVector loc, float min, float max){
    this.location = loc.copy();
    roc = random(min, max);
  }
  
  void update(){
    angle += roc * rocMultiplier;
  }
  
  void show(){
    rectMode(CENTER);
    noStroke();
    fill(int(map((sin(angle) + 1) / 2, 0.0, 1.0, 0, 255)));
    rect(location.x, location.y, width / numBlocks, height);
  }
}


void runBlocks(){
  
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
    
    rocMultiplier = map(handPosition.y, yMin, yMax, 0.5, 5);
    }
    
    for(int i = 0; i < blocks.size(); i++){
      Block thisBlock = blocks.get(i);
      thisBlock.update();
      thisBlock.show();
  }
}
