// batik pattern function adapted from Generative Gestaltung, ISBN: 978-3-87439-759-9

boolean freeze = false;
int maxCount = 500; //max count of shapes
int currentCount = 1;
float[] shapesX = new float[maxCount];
float[] shapesY = new float[maxCount];
float[] shapesR = new float[maxCount]; //radius
int[] closestIndex = new int[maxCount]; //index

float minRadius = 30;
float maxRadius = 100;

// svg vector import
PImage module1, module2;

// style selector, hotkeys 1,2,3
boolean showSvg = true;
boolean showLine = false;
boolean showCircle = false;

void shapePack(int mainGraphic, int accentImage) {

  module1 = loadImage("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo/"+list[mainGraphic]);
  module2 = loadImage("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo/"+list[accentImage]);

  // first circle
  shapesX[0] = width/2;
  shapesY[0] = height/2;
  shapesR[0] = 200; 
  closestIndex[0] = 0;

  imageMode(CENTER);

  for (int j = 0; j < 40; j++) {
    // create a random position
    float tx = random(0+maxRadius, width-maxRadius);
    float ty = random(0+maxRadius, height-maxRadius);
    float tr = minRadius;

    boolean insection = true;
    // find a pos with no intersection with others circles
    for (int i=0; i < currentCount; i++) {
      float d = dist(tx, ty, shapesX[i], shapesY[i]);
      //println(d);
      if (d >= (tr + shapesR[i])) insection = false;     
      else {
        insection = true; 
        break;
      }
    }

    // stop process by pressing hotkey 'F'
    if (freeze) insection = true;

    // no intection ... add a new circle
    if (insection == false) {
      // get closest neighbour and closest possible radius
      float tRadius = width;
      for (int i=0; i < currentCount; i++) {
        float d = dist(tx, ty, shapesX[i], shapesY[i]);
        if (tRadius > d-shapesR[i]) {
          tRadius = d-shapesR[i];
          closestIndex[currentCount] = i;
        }
      }

      if (tRadius > maxRadius) tRadius = maxRadius;

      shapesX[currentCount] = tx;
      shapesY[currentCount] = ty;
      shapesR[currentCount] = tRadius;
      currentCount++;
    }
  }

  // draw them
  for (int i=0; i < currentCount; i++) {
    pushMatrix();
    translate(shapesX[i], shapesY[i]);
    if (showSvg) {
      // draw SVGs
      if (shapesR[i] == maxRadius) image(module1, 0, 0, shapesR[i]*2, shapesR[i]*2);
      else image(module2, 0, 0, shapesR[i]*2, shapesR[i]*2);
    }

    popMatrix();
  } 

  if (currentCount >= maxCount) noLoop();
}
















