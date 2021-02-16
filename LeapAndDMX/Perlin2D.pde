float ang1 = 0;
float ang2 = 3.00;
float ang3 = 5.00;
float scale = 0.01;

float roc1 = 0.0001;
float roc2 = 0.0001;
float roc3 = 0.025;

void runPerlin2d(){
  colorMode(HSB);
  
  loadPixels();
  for(int i = 0; i < width; i++){
     for(int j = 0; j < height; j++){
         int value = int(map(noise(i * scale + ang1, j * scale + ang2, ang3), 0, 1, 0, 255));
         color temp = color(value, 255, 255);
         pixels[j + i * width] = temp;
         
     }
     //ang1 += roc1;
     //ang2 += roc2;
  }
  ang3 += roc3;
  
  updatePixels();
  
  
  
}

void runPerlin2dBW(){
  colorMode(RGB);
  
  loadPixels();
  for(int i = 0; i < width; i++){
     for(int j = 0; j < height; j++){
         int value = int(map(noise(i * scale + ang1, j * scale + ang2, ang3), 0, 1, 0, 255));
         color temp = color(value, value, value);
         pixels[j + i * width] = temp;
         
     }
     //ang1 += roc1;
     //ang2 += roc2;
  }
  ang3 += roc3;
  
  updatePixels();
  
  
  
}
