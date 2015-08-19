void dotTexture(int r, int g, int b, int a) {

  if (bgDots) {
    randomSeed(1);
    for (int j=10; j<displayHeight+20; j+=20) {
      for (int i=10; i<displayWidth+20; i+=20) {

        fill(r, 255, 255, 255);
        noStroke();
        ellipseMode(CENTER);
        ellipse(i+random(-2, 2), j+random(-2, 2), 6, 6);
      }
    }
  }
}

void bgDetail(int r, int g, int b, int a) {   
  for (int j=0; j<displayHeight; j+=20) {
    for (int i=0; i<displayWidth; i+=20) {
      strokeWeight(2);
      stroke(0, 255);
      noFill();
      rect(i, j, 20, 20);
    }
  }
}

void diamondBg(int r, int g, int b, float a) {
  for (int j=0; j<displayHeight+20; j+=20) {
    for (int i=10; i<displayWidth+20; i+=20) {
      fill(r, g-20, b/20, random(255));
      shapeMode(CENTER);
      beginShape();
      vertex(i,j);
      vertex(i+10,j+10);
      vertex(i,j+20);
      vertex(i-10,j+10);
      endShape(CLOSE);
    }
     
  }
}

void bghairs(int r, int g, int b) {
  for (int j=80; j<height-50; j+=108) {
    for (int i=-200; i<width+10; i+=100) {
      int hairx=i;
      int hairy=j;
      noFill();
      strokeWeight(random(1,3));
      stroke(r-random(50,100), g-50, b-50);

      beginShape();
      vertex(hairx, hairy);
      bezierVertex(hairx, hairy, hairx, hairy, hairx, hairy);
      bezierVertex(hairx, hairy, hairx+100, hairy+50, hairx+160, hairy+50);
      bezierVertex(hairx+250, hairy+40, hairx+240, hairy, hairx+300, hairy+20);
      endShape();

      beginShape();
      hairx+=85;
      hairy-=5;
      vertex(hairx, hairy+40);
      bezierVertex(hairx, hairy+40, hairx, hairy+40, hairx, hairy+40);
      bezierVertex(hairx, hairy+40, hairx+100, hairy-50, hairx+160, hairy-50);
      bezierVertex(hairx+250, hairy-40, hairx+240, hairy+10, hairx+300, hairy);
      endShape();
    }
  }
}

void zigzag(int r, int g, int b) {
  for (int zag=15; zag < displayWidth; zag+=180) {
    strokeWeight(20);
    strokeCap(ROUND);
    stroke(r-20, g-30, b-30);
    //line(50,-10,displayWidth-50,displayHeight+10);
    line(zag, -5, zag+140, 125);
    line(zag+140, 125, zag, 235);
    line(zag, 235, zag+140, 345);
    line(zag+140, 345, zag, 455);
    line(zag, 455, zag+140, 565);
    line(zag+140, 565, zag, 675);
    line(zag, 675, zag+140, 785);
    line(zag+140, 785, zag, displayHeight+5);
  }
}

void slash(int r, int g, int b) {
  for (int zag=displayWidth/8-305; zag < displayWidth; zag+=displayWidth/8) {
    strokeWeight(10);
    stroke(r-20, g-30, b-30);
    strokeCap(ROUND);
    //line(50,-10,displayWidth-50,displayHeight+10);
    line(zag, 0, zag+200, displayHeight+100);
  }
}

void bulb(int r, int g, int b) {
  for (int zag=displayWidth/6-203; zag < displayWidth+203; zag+=displayWidth/6) {
    strokeWeight(6);
    strokeCap(ROUND);
    stroke(r-100, g-100, b-100);
    noFill();
    beginShape();
    int bulge=200;
    curveVertex(zag+bulge, -135);
    curveVertex(zag, -5);
    curveVertex(zag+bulge, 125);
    curveVertex(zag, 235);
    curveVertex(zag+bulge, 345);
    curveVertex(zag, 455);
    curveVertex(zag+bulge, 565);
    curveVertex(zag, 675);
    curveVertex(zag+bulge, 785);
    curveVertex(zag, displayHeight+5);
    curveVertex(zag+bulge, displayHeight+120);
    endShape();

    beginShape();
    curveVertex(zag-bulge, -135);
    curveVertex(zag, -5);
    curveVertex(zag-bulge, 125);
    curveVertex(zag, 235);
    curveVertex(zag-bulge, 345);
    curveVertex(zag, 455);
    curveVertex(zag-bulge, 565);
    curveVertex(zag, 675);
    curveVertex(zag-bulge, 785);
    curveVertex(zag, displayHeight+5);
    curveVertex(zag-bulge, displayHeight+120);
    endShape();
  }
}

void cubes(int r, int g, int b) {
  int basept_x = 0;
  int basept_y = 0;

  for (int zig = displayWidth/6-185; zig < displayHeight+200; zig+= ( (displayHeight+200)/5)+10) {
    for (int zag=displayWidth/7-200; zag < displayWidth+200; zag+= (displayWidth+200)/8) {

      stroke(0);
      strokeWeight(2);
      strokeCap(ROUND);

      basept_x=zag;
      basept_y=zig;

      fill(r-60, g-50, b-70);
      beginShape();
      vertex(basept_x, basept_y);
      vertex(basept_x, basept_y+100);
      vertex(basept_x+100, basept_y+150);
      vertex(basept_x+100, basept_y+150);
      vertex(basept_x+100, basept_y+50);
      endShape(CLOSE);

      fill(r-40, g-30, b-20);
      beginShape();
      vertex(basept_x+100, basept_y+50);
      vertex(basept_x+200, basept_y);
      vertex(basept_x+200, basept_y+100);
      vertex(basept_x+100, basept_y+150);
      endShape(CLOSE);

      fill(r+10, g+10, b+10);
      beginShape();
      vertex(basept_x, basept_y);
      vertex(basept_x+100, basept_y-50);
      vertex(basept_x+200, basept_y);
      vertex(basept_x+100, basept_y+50);
      endShape(CLOSE);

      line(basept_x, basept_y+10, basept_x+20, basept_y+20);
      line(basept_x, basept_y+20, basept_x+40, basept_y+40);
      line(basept_x, basept_y+30, basept_x+30, basept_y+45);
      line(basept_x, basept_y+50, basept_x+40, basept_y+70);
      line(basept_x, basept_y+60, basept_x+20, basept_y+70);
      line(basept_x, basept_y+70, basept_x+45, basept_y+93);
      line(basept_x, basept_y+80, basept_x+10, basept_y+85);
    }
  }
}

void unfilledcubes(int r, int g, int b) {
  int basept_x = 0;
  int basept_y = 0;

  for (int zig = displayWidth/6-185; zig < displayHeight+200; zig+= ( (displayHeight+200)/5)+10) {
    for (int zag=displayWidth/7-200; zag < displayWidth+200; zag+= (displayWidth+200)/8) {

      stroke(0);
      strokeWeight(2);
      strokeCap(ROUND);

      basept_x=zag;
      basept_y=zig;

      noFill();
      //fill(r-60, g-50, b-70);
      beginShape();
      vertex(basept_x, basept_y);
      vertex(basept_x, basept_y+100);
      vertex(basept_x+100, basept_y+150);
      vertex(basept_x+100, basept_y+150);
      vertex(basept_x+100, basept_y+50);
      endShape(CLOSE);

      //fill(r-40, g-30, b-20);
      beginShape();
      vertex(basept_x+100, basept_y+50);
      vertex(basept_x+200, basept_y);
      vertex(basept_x+200, basept_y+100);
      vertex(basept_x+100, basept_y+150);
      endShape(CLOSE);

      //fill(r+10, g+10, b+10);
      beginShape();
      vertex(basept_x, basept_y);
      vertex(basept_x+100, basept_y-50);
      vertex(basept_x+200, basept_y);
      vertex(basept_x+100, basept_y+50);
      endShape(CLOSE);

      line(basept_x, basept_y+10, basept_x+20, basept_y+20);
      line(basept_x, basept_y+20, basept_x+40, basept_y+40);
      line(basept_x, basept_y+30, basept_x+30, basept_y+45);
      line(basept_x, basept_y+50, basept_x+40, basept_y+70);
      line(basept_x, basept_y+60, basept_x+20, basept_y+70);
      line(basept_x, basept_y+70, basept_x+45, basept_y+93);
      line(basept_x, basept_y+80, basept_x+10, basept_y+85);
    }
  }
}




