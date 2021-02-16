boolean showLights = true;


color sampleImage(int x, int y){
    loadPixels();
    color temp = pixels[x + width*y];
    updatePixels();
    return temp;
}

void setTwoLights(){
  color pixel = sampleImage(width / 4, height /2);
  dmxOutput.set(1, pixel >> 16 & 0xFF);
  dmxOutput.set(2, pixel >> 8 & 0xFF);
  dmxOutput.set(3, pixel & 0xFF);
  
  color pixel2 = sampleImage(width * 3 / 4, height /2);
  dmxOutput.set(4, pixel2 >> 16 & 0xFF);
  dmxOutput.set(5, pixel2 >> 8 & 0xFF);
  dmxOutput.set(6, pixel2 & 0xFF);
   
}


void setTenLights(){
  
  color pixel = sampleImage(width / 10, height /2);
  dmxOutput.set(1, pixel >> 16 & 0xFF);
  dmxOutput.set(2, pixel >> 8 & 0xFF);
  dmxOutput.set(3, pixel & 0xFF);
  
  color pixel2 = sampleImage(width * 2 / 10, height /2);
  dmxOutput.set(4, pixel2 >> 16 & 0xFF);
  dmxOutput.set(5, pixel2 >> 8 & 0xFF);
  dmxOutput.set(6, pixel2 & 0xFF);
  
  color pixel3 = sampleImage(width * 3 / 10, height /2);
  dmxOutput.set(7, pixel3 >> 16 & 0xFF);
  dmxOutput.set(8, pixel3 >> 8 & 0xFF);
  dmxOutput.set(9, pixel3 & 0xFF);
  
  color pixel4 = sampleImage(width * 4 / 10, height /2);
  dmxOutput.set(10, pixel4 >> 16 & 0xFF);
  dmxOutput.set(11, pixel4 >> 8 & 0xFF);
  dmxOutput.set(12, pixel4 & 0xFF);
  
  color pixel5 = sampleImage(width * 5 / 10, height /2);
  dmxOutput.set(13, pixel5 >> 16 & 0xFF);
  dmxOutput.set(14, pixel5 >> 8 & 0xFF);
  dmxOutput.set(15, pixel5 & 0xFF);
  
  color pixel6 = sampleImage(width * 6 / 10, height /2);
  dmxOutput.set(16, pixel6 >> 16 & 0xFF);
  dmxOutput.set(17, pixel6 >> 8 & 0xFF);
  dmxOutput.set(18, pixel6 & 0xFF);
  
  color pixel7 = sampleImage(width * 7 / 10, height /2);
  dmxOutput.set(19, pixel7 >> 16 & 0xFF);
  dmxOutput.set(20, pixel7 >> 8 & 0xFF);
  dmxOutput.set(21, pixel7 & 0xFF);
  
  color pixel8 = sampleImage(width * 8 / 10, height /2);
  dmxOutput.set(22, pixel8 >> 16 & 0xFF);
  dmxOutput.set(23, pixel8 >> 8 & 0xFF);
  dmxOutput.set(24, pixel8 & 0xFF);
  
  color pixel9 = sampleImage(width * 9 / 10, height /2);
  dmxOutput.set(25, pixel9 >> 16 & 0xFF);
  dmxOutput.set(26, pixel9 >> 8 & 0xFF);
  dmxOutput.set(27, pixel9 & 0xFF);
  
  color pixel10 = sampleImage(width -1, height /2);
  dmxOutput.set(28, pixel10 >> 16 & 0xFF);
  dmxOutput.set(29, pixel10 >> 8 & 0xFF);
  dmxOutput.set(30, pixel10 & 0xFF);
}


void addTubes(int numLights, int numLedsPerTube){
  
  for(int i = 0; i < numLights; i++){
    PVector tempVector = new PVector((i+1) / float(numLights+1) * width,  height / 2);
    tubes.add(new Tube(i*3*numLedsPerTube+1, numLedsPerTube, tempVector));
  }
  
}
