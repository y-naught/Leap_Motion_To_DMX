int sw = 0;
int numEffects = 10;

void toggleEffect(){
  sw++;
   if(sw >= numEffects){
     sw = 0;
   }
}

void reverseToggleEffect(){
  sw--;
  if(sw < 0){
    sw = numEffects - 1;
  }
}

void pickEffect(){
  switch(sw){
    case 0:
      //run the basic solid color effect RGB
      showLights = true;
      background(0);
      solidColorRGB();
      break;
    case 1:
      showLights = true;
      background(0);
      drawRectangle();
      break;
    case 2:
      showLights = true;
      background(0);
      runRadialGradient();
      break;
    case 3:
      showLights = true;
      background(0);
      runBlocks();
      break;
    case 4:
      showLights = false;
      runPaint();
      break;
    case 5:
      background(0);
      showLights = true;
      runUsrOscGrad();
      break;
    case 6:
      showLights = true;
      background(0);
      runPerlin2dBW();
      break;
    case 7:
      showLights = true;
      background(0);
      runPerlin2d();
      break;
    case 8:
      showLights = true;
      background(0);
      runFallingBalls();
      break;
    case 9:
      background(0);
      showLights = true;
      runOscGrad();
      break;
  }
}
