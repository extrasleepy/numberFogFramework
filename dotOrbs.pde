void dataOrbs(int r, int g, int b, float cx, float cy, float outerRad, float a) {

  float phi = (sqrt(3)+1)/2 - 1;            // golden ratio
  float golden_angle = phi * (TWO_PI);        // golden angle

  ellipseMode(RADIUS);
  dataPoints = 638;
  for (int i = 1; i <= dataPoints; ++i) {
    float ratio = i/(float)dataPoints;
    float angle = i*golden_angle;
    float spiral_rad = ratio * outerRad;
    float x = cx + cos(angle) * spiral_rad;
    float y = cy + sin(angle) * spiral_rad;
    noStroke();
    fill(r*2, g*2, b*2, a);
    ellipse(x, y, 3, 3);
    fill(r/2, g/2, b/2, a);
    ellipse(x-2, y-2, 3, 3);
  }
}

