// batik pattern function adapted from Generative Gestaltung, ISBN: 978-3-87439-759-9

Agent[] agents = new Agent[2000];
int agentsCount = 2000;
float noiseScale = 100, noiseStrength = 30; 
float overlayAlpha = 10, agentsAlpha = 90, strokeWidth = 0.4;

class Agent {
  PVector p, pOld;
  float stepSize, angle;
  boolean isOutside = false;

  Agent() {
    p = new PVector(random(width), random(height));
    pOld = new PVector(p.x, p.y);
    stepSize = random(10);
  }

  void render(int r, int g, int b) {

    angle = noise(p.x/noiseScale, p.y/noiseScale) * noiseStrength;

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;

    if (p.x<+10) isOutside = true;
    else if (p.x>width-10) isOutside = true;
    else if (p.y<+10) isOutside = true;
    else if (p.y>height-10) isOutside = true;

    if (isOutside) {
      p.x = random(width);
      p.y = random(height);
      pOld.set(p);
    }
    stroke(255, 5);
    strokeWeight(strokeWidth*stepSize);
    line(pOld.x, pOld.y, p.x, p.y);
    pOld.set(p);
    isOutside = false;
  }
}


