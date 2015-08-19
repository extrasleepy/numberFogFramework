void elGround(float x, float y, float spacing, float opacity, int r, int g, int b, int a, int data, int dataScale, int shapeStyle) {
  println(datalist[data]);
  table = loadTable(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/dataRepo/"+datalist[data]));    //make sure to change name to match your data file, header is optional
  dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/"+shapelist[shapeStyle]); 
  //-----read the data-----
  ellipseMode(CENTER);

  for (int dataRow = 3; dataRow<table.getRowCount (); dataRow++) {
    wage = table.getFloat(dataRow, 4);          //define parameter = column 

    if (table.getFloat(4, 4) == 52700 && table.getFloat(5, 4) == 40 && table.getFloat(6, 4) == 195) {
      coreScale = 500000;
    } else if (table.getFloat(4, 4) >= 600000 || table.getFloat(5, 4) >= 600000 || table.getFloat(6, 4) >= 600000) {
      coreScale = 20000;
    } else if (table.getFloat(4, 4) >= 500000 || table.getFloat(5, 4) >= 500000 || table.getFloat(6, 4) >= 500000) {
      coreScale = 15000;
    } else if (table.getFloat(4, 4) >= 300000 || table.getFloat(5, 4) >= 300000 || table.getFloat(6, 4) >= 300000) {
      coreScale = 10000;
    } else if (table.getFloat(4, 4) >= 200000  || table.getFloat(5, 4) >= 200000 || table.getFloat(6, 4) >= 200000) {
      coreScale = 5000;
    } else if (table.getFloat(4, 4) >= 100000  || table.getFloat(5, 4) >= 100000 || table.getFloat(6, 4) >= 100000) {
      coreScale = 800;
    } else if (table.getFloat(4, 4) >= 50000  || table.getFloat(5, 4) >= 50000 || table.getFloat(6, 4) >= 50000) {
      coreScale = 500;
    } else if (table.getFloat(3, 4) > 10000 || table.getFloat(4, 4) > 10000 || table.getFloat(5, 4) > 10000) {
      coreScale = 200;
    } else if (table.getFloat(3, 4) > 5000 || table.getFloat(4, 4) > 5000 || table.getFloat(5, 4) > 5000) {
      coreScale = 100;
    } else if (table.getFloat(3, 4) > 1500 || table.getFloat(4, 4) > 1500 || table.getFloat(5, 4) > 1500) {
      coreScale = 50;
    } else if (table.getFloat(3, 4) > 1000 || table.getFloat(4, 4) > 1000 || table.getFloat(5, 4) > 1000) {
      coreScale = 20;
    } else {
      coreScale = 0.5;
    }
    wage = wage/(dataScale*coreScale);

    fill(r, b, g, a);     //fill color

    if (dataStyle==0) {
      strokeWeight(2);
      stroke(r*3, b/3, g, a);
      ellipse(x, y, wage, wage);
    }
    if (dataStyle==1) {
      strokeWeight(15);
      stroke(0, opacity);
      ellipse(x, y, wage, wage);
    }
    if (dataStyle==2) {
      strokeWeight(2);
      stroke(0, opacity);
      rect(x, y, wage, wage);
    }

    if (dataStyle==3) {
      strokeWeight(15);
      stroke(0, opacity);
      rect(x, y, wage, wage);
    }
    if (dataStyle==4) {
      strokeWeight(2);
      stroke(0, opacity);
      line(x, y, x+wage, y+wage);
    }

    if (dataStyle==5) {
      strokeWeight(5);
      stroke(0, opacity);
      line(x, y, x+wage, y+wage);
    }
    if (dataStyle==6) {
      if (custShp) {
        dataShape.disableStyle();
        shapeMode(CENTER);
        strokeWeight(10);
        stroke(0, opacity);
        shape(dataShape, x+wage, y+wage, wage, wage);
      } else {
        strokeWeight(10);
        stroke(0, opacity);
        line(x, y, x+wage, y+wage);
      }
    }

      if (dataStyle==7) {
        strokeWeight(5);
        fill(r+30, g*2, b+10, wage);
        stroke(0, opacity);
        shapeMode(CENTER);
        if (custShp) {
          dataShape.disableStyle();
          shapeMode(CENTER);
          fill(r+30, g*2, b+10, wage);
          stroke(0, opacity);
          shape(dataShape, x, y, wage, wage);
        } else {
          beginShape();
          curveVertex(x, y);
          curveVertex(x+84, y+91);
          curveVertex(x+80, y+19);
          curveVertex(x+21, y+17);
          curveVertex(x+20, y+100);
          curveVertex(x, y);
          endShape(CLOSE);
        }
      }

      if (dataStyle==8) {
        strokeWeight(1);
        fill(r+(wage*2), g, b, wage*3);
        stroke(0, opacity);
        rectMode(CENTER);
        rect(x, y, wage, wage, 20);
      }

      if (dataStyle==9) {
        strokeWeight(2);
        stroke(0, opacity);
        line(x, y, x-wage, y+wage);
      }

      if (dataStyle==10) {
        strokeWeight(15);
        stroke(0, opacity);
        triangle(x, y, x-wage/2, y+wage, x-wage, y);
      }

      if (dataStyle==11) {
        strokeWeight(4);
        stroke(0, opacity);
        triangle(x, y, x+wage/2, y-wage, x+wage, y);
      }

      if (dataStyle==12) {
        strokeWeight(2);
        stroke(0, opacity);
        triangle(x, y, x-wage/2, y+wage, x-wage, y);
      }

      if (dataStyle==13) {
        strokeWeight(2);
        stroke(0, opacity);
        rectMode(CENTER);
        rect(x, y, wage, wage, 10);
      }

      if (dataStyle==14) {
        strokeWeight(3);
        stroke(255, 255, 255, a);
        //ellipse(x, (y+x)-100, wage/2, wage/2);
        ellipse(displayWidth-x, y, wage/2, wage/2);
        ellipse(x, y, wage/2, wage/2);
      }
      if (dataStyle==15) {
        strokeWeight(3);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/heart.svg");
        //how to change color of shape???
        dataShape.disableStyle();
        shapeMode(CENTER);
        shape(dataShape, x, y, wage, wage);
      }

      if (dataStyle==16) {
        strokeWeight(3);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/star.svg");
        //how to change color of shape???
        dataShape.disableStyle();
        shapeMode(CENTER);
        shape(dataShape, x, y, wage, wage);
      }


      if (dataStyle==17) {
        strokeWeight(3);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/drop.svg");
        //how to change color of shape???
        dataShape.disableStyle();
        shape(dataShape, x, y, wage, wage);
      }

      if (dataStyle==18) {
        strokeWeight(2);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/angledrop.svg");
        //how to change color of shape???
        dataShape.disableStyle();
        shapeMode(CENTER);
        shape(dataShape, x, y, wage, wage);
      }

      if (dataStyle==19) {
        strokeWeight(2);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/octo.svg");

        dataShape.disableStyle();
        shapeMode(CENTER);
        shape(dataShape, x, y, wage, wage);
      }
      if (dataStyle==20) {
        strokeWeight(2);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/almond.svg");

        dataShape.disableStyle();
        shapeMode(CENTER);
        shape(dataShape, x, y, wage, wage);
      }
      if (dataStyle==21) {
        strokeWeight(2);
        stroke(0, opacity);
        dataShape = loadShape("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo/wavebox.svg");

        dataShape.disableStyle();
        shapeMode(CENTER);
        shape(dataShape, x, y, wage, wage);
      }
      x=x+spacing;
    }

    if (dataStyle==22) {

      for (int rep=300; rep<1400; rep+= (300+databorder)) {
        pushMatrix();
        translate(rep, height/2);
        x=spacing*2;
        y=spacing*2;
        angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
        for (int dataRow = 3; dataRow<table.getRowCount ()-4; dataRow++) {
          float wage = table.getFloat(dataRow, 4);
          wage = wage/(dataScale*coreScale);
          stroke(r-10, g-10, b-10, opacity);
          fill(r, g, b, a);     //fill color, transparency determined by time
          ellipse(x, y, wage, wage);  //size determined by CSV data
          rotate(angle);
        }
        popMatrix();
      }
    }

    if (dataStyle==23) {
      for (int vrep=200; vrep<900; vrep+= (300+databorder)) {
        for (int rep=300; rep<1400; rep+= (300+databorder)) {
          pushMatrix();
          translate(rep, vrep);
          x=spacing;
          y=spacing;
          angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
          for (int dataRow = 3; dataRow<table.getRowCount ()-4; dataRow++) {

            float wage = table.getFloat(dataRow, 4);          //define parameter = column 
            wage = wage/(dataScale*coreScale);
            stroke(r+20, g+20, b+20, opacity);
            fill(r, g, b, a);     //fill color, transparency determined by time
            if (custShp) {
              dataShape.disableStyle();
              shapeMode(CENTER);
              shape(dataShape, x, y, wage*2, wage*2);
            } else {
              ellipse(x, y, wage, wage);  //size determined by CSV data
            }
            rotate(angle);
          }
          popMatrix();
        }
      }
    }

    if (dataStyle==24) {
      pushMatrix();
      translate(width/2, height/2);
      x=spacing*2;
      y=spacing*2;
      angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
      for (int dataRow = 3; dataRow<table.getRowCount()-4; dataRow++) {

        float wage = table.getFloat(dataRow, 4);          //define parameter = column 
        wage = wage/(dataScale*coreScale);
        stroke(r, g, b, opacity);
        fill(r-30, g-30, b-20, a);     //fill color, transparency determined by time
        if (custShp) {
          dataShape.disableStyle();
          shapeMode(CENTER);
          shape(dataShape, x, y, wage*3, wage*3);
        } else {
          ellipse(x, y, wage/dataScale, wage/dataScale);  //size determined by CSV data
        }
        rotate(angle);
      }
      popMatrix();
    }

    if (dataStyle==25) {
      pushMatrix();
      translate(width/2, height/2);
      x=spacing;
      y=spacing;
      angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
      for (int dataRow = 3; dataRow<table.getRowCount ()-4; dataRow++) {

        float wage = table.getFloat(dataRow, 4);          //define parameter = column 
        wage = wage/(dataScale*coreScale);
        strokeWeight(8);
        stroke(r+(wage*2), g, b, wage*3);
        strokeCap(ROUND);
        line (x, y, x+(wage/dataScale), x+(wage/dataScale));
        rotate(angle);
      }
      popMatrix();
    }

    if (dataStyle==26) {

      for (int rep=300; rep<1400; rep+= (300+databorder)) {
        pushMatrix();
        translate(rep, height/2);
        x=spacing*2;
        y=spacing*2;
        angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
        for (int dataRow = 3; dataRow<table.getRowCount ()-4; dataRow++) {

          float wage = table.getFloat(dataRow, 4);          //define parameter = column 
          strokeWeight(8);
          stroke(r+(wage*2), g, b, wage*3);
          strokeCap(ROUND);
          line (x, y, x+(wage/dataScale), x+(wage/dataScale));
          rotate(angle);
        }
        popMatrix();
      }
    }

    if (dataStyle==27) {
      for (int vrep=200; vrep<900; vrep+= (300+databorder)) {
        for (int rep=300; rep<1400; rep+= (300+databorder)) {
          pushMatrix();
          translate(rep, vrep);
          x=spacing*2;
          y=spacing*2;
          angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
          for (int dataRow = 3; dataRow<table.getRowCount ()-4; dataRow++) {

            float wage = table.getFloat(dataRow, 4);          //define parameter = column 
            strokeWeight(8);
            stroke(r+(wage*2), g, b, wage*3);
            strokeCap(ROUND);
            line (x, y, x+(wage/dataScale), x+(wage/dataScale));
            rotate(angle);
          }
          popMatrix();
        }
      }
    }

    if (dataStyle==28) {
      y=spacing;
      for (int dataRow = 3; dataRow<table.getRowCount ()-4; dataRow++) {
        float wage = table.getFloat(dataRow, 4);          //define parameter = column
        strokeCap(SQUARE);
        strokeWeight(wage = wage/(dataScale*coreScale));
        stroke(r, g, b, wage*3);
        line(spacing-10, y, displayWidth-spacing, y);
        y+=displayHeight/table.getRowCount()+5;
      }
    }

    if (dataStyle==29) {
      for (int dataRow = 3; dataRow<table.getRowCount (); dataRow++) {
        float wage = table.getFloat(dataRow, 4);          //define parameter = column
        wage = wage/(dataScale*coreScale);
        calcWave(wage, (dataRow-4)*spacing, r, g, b, opacity);
      }
    }

    if (dataStyle==30) {
      x=spacing;
      y=spacing;
      for (int dataRow = 3; dataRow<table.getRowCount ()-3; dataRow++) {
        float wage = table.getFloat(dataRow, 4);          //define parameter = column
        wage = wage/(dataScale*coreScale);
        strokeCap(SQUARE);
        strokeWeight(5);

        stroke(0, 190);
        line(wage+2, y+2, displayWidth-(wage)+2, y+2);
        stroke(r, g, b, 190);
        line(wage, y, displayWidth-(wage), y);
        stroke(0, 190);
        line(x+2, wage-10+2, x+2, displayHeight-(wage*2)+2);
        stroke(r, g, b, 190);
        line(x, wage-10, x, displayHeight-(wage*2));

        // x+=displayWidth/table.getRowCount()+5;
        x+=displayWidth/(table.getRowCount()-5);
        y+=displayHeight/(table.getRowCount()-5);
      }
    }

    if (dataStyle==31) {
      x=0;
      for (int k=0; k <displayHeight; k+= (dataSpread.getArrayValue ()[1])) {
        for (int w= 0; w < displayWidth- (databorder*6); w += (table.getRowCount ()*7)+dataSpread.getArrayValue()[0]) {
          for (int dataRow = 3; dataRow<table.getRowCount (); dataRow++) {

            wage = table.getFloat(dataRow, 4);          //define parameter = column 
            wage = wage/coreScale;
            println(wage);
            for (int i=0; i<wage; i+=10) {
              noStroke();
              fill(r+i, g+i, b-10);
              if (custShp) {
                dataShape.disableStyle();
                shapeMode(CENTER);
                shape(dataShape, x+databorder, i+k+databorder, 8, 8);
              } else {
                ellipse(x+databorder, i+k+databorder, 5, 5);
              }
            }
            x+=10;
          }
        }
        x=0;
      }
    }


    if (dataStyle==32) {
      
    } 
     if (dataStyle==33) {
      for (int vrep=200; vrep<900; vrep+= (300+databorder)) {
        for (int rep=300; rep<1400; rep+= (300+databorder)) {
          pushMatrix();
          translate(rep, vrep);
          x=spacing;
          y=spacing;
          angle = TWO_PI/(table.getRowCount()-7);   //set rotation angle, TW0_PI is a full circle
          for (int dataRow = 3; dataRow<table.getRowCount ()-3; dataRow++) {

            float wage = table.getFloat(dataRow, 4);          //define parameter = column 
            wage = wage/(dataScale*coreScale);
            stroke(0, opacity);
            strokeWeight(6);
            fill(r, g, b, a);     //fill color, transparency determined by time
            if (custShp) {
              dataShape.disableStyle();
              shapeMode(CENTER);
              shape(dataShape, x, y, wage*3, wage*3);
            } else {
              ellipse(x, y, wage, wage);  //size determined by CSV data
            }
            rotate(angle);
          }
          popMatrix();
        }
      }
    }
    noStroke();
  }

