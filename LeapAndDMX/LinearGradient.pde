
void runLinearGradient(){
  background(0);
  colorMode(RGB);
    for(int i = 0; i < gradients.size(); i++){
    LinearGradient grad = gradients.get(i);
    
    grad.update();
    
    push();
    translate(width/2, height/2);
    rotate(grad.getRotate());
    //print(grad.getRotate());
    translate(-width/2, -height/2);
    image(grad.getImage(), 0,0);
    pop();
    
    if(grad.isDead()){
        gradients.remove(i);
    }
  }
}




//draws a linear gradient on a pgraphic, given some parameters, and returns that pgraphic
class LinearGradient {
   
  PGraphics g;
  //int lifespan = 100;
  float speed;
  float loc;
  float wid;
  float rot;
  PVector emptyVector = new PVector(0,0);
  PVector flattenedVector;
  
  LinearGradient(float sp, float w, PVector v){
     speed = sp;
     wid = w;
     loc = 0;
     
     flattenedVector = new PVector(v.x, v.z);
     
     //rot = PI / 2;
     //rot = flattenedVector.heading();
     //print(flattenedVector);
     //print(rot);
     
     g = createGraphics(width, height);
  }
  
  void update(){
     loc += speed;
     g.beginDraw();
     g.background(0,0,0,0);
     g.loadPixels();
     
     for(int i = 0; i < g.width; i++){
       
       if(abs(i - loc) < wid){
         
         float distance = abs(i - loc);
         int red = int(map(distance, 0, wid, 255, 0));
         
         for(int j = 0; j < g.height; j++){
           g.pixels[j + width*i] = color(255, 255, 255, red);
         }
          
       }
       //else{
       //  for(int j = 0; j < g.height; j++){
       //    g.pixels[j + width*i] = color(0, 0, 0, 0);
       //  }
       //}
     }
     
     g.updatePixels();
     g.endDraw();
  }
  
  PGraphics getImage(){
   return g; 
  }
  
  float getRotate(){
    if(sw == 3){
      rot = PI / 2;
    }else{
      rot = 0;
    }
    //print(rot);
    return rot;
  }
  
  boolean isDead(){
    if(loc > width){
      return true;
    }else{
      return false;
    }
  }
}
