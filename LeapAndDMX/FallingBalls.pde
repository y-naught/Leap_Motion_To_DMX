ArrayList<Ball> balls = new ArrayList<Ball>();

class Ball{
  
  PVector position;
  PVector velocity;
  float size = 15;
  
  Ball(){
    position = new PVector(random(width), 0);
    velocity = new PVector(0, random(4, 10));
    size = random(20, 50);
  }
  
  void move(){
    this.position.add(velocity);
  }
  
  void show(){
    fill(255);
    noStroke();
    circle(position.x, position.y, size);
  }
  
  boolean isDead(){
    if(this.position.y > height + size / 2){
      return true;
    }else {
      return false;
    }
  }
}

void runFallingBalls(){
  
  float probability = random(1);
  
  if(probability < 0.1){
    balls.add(new Ball());
  }
  
  for(int i = 0; i < balls.size(); i++){
    Ball thisBall = balls.get(i);
    thisBall.move();
    thisBall.show();
    if(thisBall.isDead()){
      balls.remove(i);
    }
  }
}
