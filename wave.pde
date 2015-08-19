void calcWave(float wage, float spacing, int r, int g, int b, float opacity) {

  int peakSpacing = 16;                   // How far apart should each horizontal location be spaced
  int waveWidth;                          // Width of entire wave

  float theta = 0.0;                      // Start angle at 0
  float amplitude = 60.0;                 // Height of wave
  float period = displayWidth/4;          // How many pixels before the wave repeats
  float dx;                               // Value for incrementing X, a function of period and xspacing
  float[] yvalues;                        // Using an array to store height values for the wave

  waveWidth = displayWidth+50;
  dx = (TWO_PI / period) * peakSpacing;
  yvalues = new float[waveWidth/peakSpacing];
  y = (amplitude + spacing)+100;

  noFill();
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
  beginShape();
  for (int xd = 0; xd < yvalues.length; xd++) {
    strokeCap(ROUND);
    stroke(r, g, b, opacity);
    if (wage > 50) { 
      wage = wage/2;
    }
    strokeWeight(wage);
    vertex((xd*peakSpacing)-10, y+yvalues[xd]);
  }
  endShape();
}

