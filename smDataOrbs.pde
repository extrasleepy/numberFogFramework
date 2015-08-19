void dataOrbsBg(int r, int g, int b, float a) {
  float cx=120;
  float cy=120;
  float outerRad = 100;
  table = loadTable(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/dataRepo/"+datalist[data]));

  float phi = (sqrt(3)+1)/2 - 1; // golden ratio
  float golden_angle = phi * (TWO_PI); // golden angle

  ellipseMode(RADIUS); 

  for (int repeat=0; repeat < 10; repeat++) {
    for (int dataRow = 3; dataRow<table.getRowCount (); dataRow++) {
      dataPoints=table.getInt(dataRow, 4);
      if (dataPoints > 500) {
        dataPoints/=4;
      }  
      for (int i = 1; i <= dataPoints; ++i) {
        float ratio = i/(float)dataPoints; 
        float angle = i*golden_angle; 
        float spiral_rad = ratio * outerRad; 
        float x = cx + cos(angle) * spiral_rad; 
        float y = cy + sin(angle) * spiral_rad; 
        noStroke();
        if (cx<displayWidth-110 && cy<displayHeight-110) {
          fill(0, 0, 0, a); 
          ellipse(x, y, 3, 3); 
          fill(r/2, g/2, b/2, a); 
          ellipse(x-1, y-1, 3, 3);
        }
      }
      if (cx>displayWidth) {
        cx=120;
        cy+=200;
        //break;
      } else {
        cx+=220;
        cy+=0;
      }
    }
  }
}

