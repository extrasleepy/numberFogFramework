import processing.pdf.*;
import controlP5.*;
import java.util.Calendar;

/*to use this tool, you need to make an absolute path to a folder of images, a folder of svg files and a folder of csv files on your computer*/

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  smooth();

  //load graphics
  getImages();
  mainGraphic = (int)random(imageNum);
  AcImgType = (int)random(AcImgNum);
  bigGraphic = mainGraphic;
  data = (int)random(dataNum);

  //contol p5 parametrics
  cp5 = new ControlP5(this);

  cp5.addButton("export")     //exports a pdf of screen
      .setOff()
      .setPosition(10, 10)
        .setSize(35, 20)
          .setColorValueLabel(0)
            ;

  cp5.addButton("randomize") //randomizes the image, data and colors
    .setOff()
      .setPosition(55, 10)
        .setSize(50, 20)
          .setColorValueLabel(0)
            ;

  cp5.addToggle("frame")    //creates a color frame around the image
      .setPosition(115, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("dataInBk")   //puts the data in front or behind the main images
    .setPosition(210, 10)
      .setSize(20, 10)
        .setValue(true)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("twoData")   //a number is used to create a spiral of dots in the center of the image. Set number in singleDataOrb function
    .setPosition(250, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("shapePk")  //changes from a grid system to shape packing layout
    .setPosition(290, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("hairs")  //creates a varied wavy pattern in the background
    .setPosition(330, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("biggie")  // put one huge image in the center of the design
    .setPosition(145, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("hideImg")  //hides the images (except when shape packing and using large central image)
    .setPosition(175, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("custShp")  //allows for custom shapes on some data styles
    .setPosition(360, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("dataOrbsBg") //creates spirals of dots from current data set
    .setPosition(395, 10)
      .setSize(20, 10)
        .setValue(false)
          .setColorValueLabel(0)
            .setColorCaptionLabel(0)
              .setMode(ControlP5.SWITCH)
                ;

  cp5.addToggle("bgDots")   //creates a grid of dots
    .setPosition(10, displayHeight-165)
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("zigzag")   //creates repeat ready zigzag
    .setPosition(10, displayHeight-142)
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("bulbs")   //creates repeat ready bulb pattern
    .setPosition(40, displayHeight-142)
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("cuAry")   //creates repeat ready 3D looking cube array
    .setPosition(70, displayHeight-142)
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("dimds")   //creates repeat ready diamond pattern
    .setPosition(10, displayHeight-115)
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("slants")     //creates repeat ready diaginal slants
    .setPosition(40, displayHeight-115)
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("daOrbs")      //creates rdot pattern around images (not currently connected to data)
    .setPosition(42, displayHeight-165)
      .setSize(20, 10)
        .setColorCaptionLabel(0)
          .setValue(false)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("batik")      //creates a batik looking text pattern in the background
    .setPosition(74, displayHeight-165)  
      .setSize(20, 10)
        .setValue(false)
          .setColorCaptionLabel(0)
            .setMode(ControlP5.SWITCH)
              ;

  cp5.addToggle("accentImg")   //every other row becomes an accent image
      .setPosition(70, displayHeight-115)
      .setSize(20, 10)
        .setColorCaptionLabel(0)
          .setValue(false)
            .setMode(ControlP5.SWITCH)
              ;

  turnImg = cp5.addKnob("twist")      //rotate images
    .setRange(0, 6.28)
      .setValue(0)
        .setPosition(displayWidth-480, displayHeight-140)
          .setRadius(30)
            .setDragDirection(Knob.VERTICAL)
              ;

  bgColor = cp5.addColorPicker("bgColor")      //change background color
      .setPosition(190, displayHeight-130)
      .setColorValue(color(random(255), random(255), random(255), random(255)))
        ;

  mainImgSpaX= cp5.addSlider("mnImgFreqX")      //frequency of images on X-axis
    .setPosition(10, displayHeight-255)
      .setRange(10, 300)
        .setHeight(10)
          .setValue(random(50, 100))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;
  mainImgSpaY= cp5.addSlider("mnImgFreqY")        //frequency of images on Y-axis
    .setPosition(10, displayHeight-242)
      .setRange(10, 200)
        .setHeight(10)
          .setValue(random(50, 100))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  gridShift = cp5.addSlider2D("gridShift")        //shift every other row of images
    .setPosition(122, displayHeight-155) 
      .setSize(60, 60)
        .setMinX(-200) 
          .setMinY(-200) 
            .setMaxX(200) 
              .setMaxY(200)  
                .setColorValueLabel(0)
                  .setColorCaptionLabel(0)
                  .setArrayValue(new float[] {
                    200, random(200, 300)
                  }
  );

  mainImgSize= cp5.addSlider("MnImgSize")          //control image size
    .setPosition(10, displayHeight-192)
      .setRange(10, 800)
        .setHeight(10)
          .setValue(random(100, 300))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  accentImgSize= cp5.addSlider("AcImgSize")        //control accent image size
    .setPosition(10, displayHeight-216)
      .setRange(10, 800)
        .setHeight(10)
          .setValue(random(50, 300))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  shapeType= cp5.addSlider("shapeStyle")            //if custom shape is selected, choose what custom shape is used to represent the data
    .setPosition(10, displayHeight-228)
      .setRange(0, shapeNum)
        .setHeight(10)
          .setValue(random(0, shapeNum))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  borderSize= cp5.addSlider("border")              //space between images and edge of work area
    .setPosition(10, displayHeight-204)
      .setRange(1, 500)
        .setHeight(10)
          .setValue(random(50, 300))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  spotlight= cp5.addSlider("spotLight")              //create a circle behind image
    .setPosition(10, displayHeight-180)
      .setRange(0, 255)
        .setHeight(10)
          .setValue(random(255))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataSpread = cp5.addSlider2D("dataSpread")           //spread out the data
    .setPosition(displayWidth-80, displayHeight-147) 
      .setSize(70, 70) 
        .setColorValueLabel(0)
          .setColorCaptionLabel(0)
            .setMinX(0) 
              .setMinY(10) 
                .setMaxX(300) 
                  .setMaxY(400) 
                  .setArrayValue(new float[] {
                    random(40, 100), random(20, 100)
                  }
  );

  databorderSize= cp5.addSlider("databorder")            //space between data and edge of work area
    .setPosition(displayWidth-110, displayHeight-160)
      .setRange(1, 500)
        .setHeight(10)
          .setValue(random(50, 100))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataSlide= cp5.addSlider("dataslide")                   //slide to see more numbers from current csv file
    .setPosition(470, displayHeight-80)
      .setRange(1, 1000)
        .setHeight(10)
          .setValue(30)
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataScale= cp5.addSlider("datascale")                  //scale the data
    .setPosition(displayWidth-110, displayHeight-240)
      .setRange(1, 100)
        .setHeight(10)
          .setValue(0)
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataOutline= cp5.addSlider("dataStroke")                //control the stroke transparency for some data shapes
    .setPosition(displayWidth-110, displayHeight-220)
      .setRange(0, 255)
        .setHeight(10)
          .setValue(random(255))
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataLook= cp5.addSlider("dataStyle")                    //choose how the data is represented
    .setPosition(displayWidth-110, displayHeight-200)
      .setRange(0, 33)
        .setHeight(10)
          .setValue(random(31))
            //.setValue(23)
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataRadius= cp5.addSlider("spotlightRadius")          //choose the radius of the spotlight
    .setPosition(displayWidth-110, displayHeight-180)
      .setRange(-300, 200)
        .setHeight(10)
          .setValue(0)
            .setColorValueLabel(0)
              .setColorCaptionLabel(0)
                ;

  dataColor = cp5.addColorPicker("dataColor")            //control the color of the data
    .setPosition(displayWidth-405, displayHeight-130)
      .setColorValue(color(random(255), random(255), random(255), random(255)))
        ;

  gridShiftbg = cp5.addSlider2D("gridSftbg")           //randomly shifts the data
    .setPosition(displayWidth-140, displayHeight-140) 
      .setSize(58, 58) 
        .setColorValueLabel(0)
          .setColorCaptionLabel(0)
          .setArrayValue(new float[] {
            0, 0
          }
  );
  dataOutline.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
  databorderSize.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
  dataScale.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
  dataOutline.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
  databorderSize.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
  dataLook.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
  dataRadius.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(1);
}

void draw() {

  if (mainGraphic<0) {
    mainGraphic=imageNum;
  }

  if (mainGraphic>imageNum) {
    mainGraphic=0;
  }

  if (data<0) {
    data=dataNum;
  }

  if (data>dataNum) {
    data=0;
  }

  if (AcImgType<0) {
    AcImgType=AcImgNum;
  }

  if (AcImgType>AcImgNum) {
    AcImgType=0;
  }

  if (bigGraphic<0) {
    bigGraphic=BigImgNum;
  }

  if (bigGraphic>BigImgNum) {
    bigGraphic=0;
  }

  img = loadImage("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo/"+list[mainGraphic]);
  Bigimg = loadImage("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo/"+list[bigGraphic]);

  if (record) {
    beginRecord(PDF, timestamp()+".pdf");
  }

  background(255);


  int r = int(bgColor.getArrayValue(0));
  int g = int(bgColor.getArrayValue(1));
  int b = int(bgColor.getArrayValue(2));
  int a = int(bgColor.getArrayValue(3));

  noStroke();
  fill(r, g, b, a);

  rectMode(CENTER);
  rect(displayWidth/2, displayHeight/2, displayWidth, displayHeight);

  int rd = int(dataColor.getArrayValue(0));
  int gd = int(dataColor.getArrayValue(1));
  int bd = int(dataColor.getArrayValue(2));
  int ad = int(dataColor.getArrayValue(3));

  if (bgDots) {
    dotTexture(r, g, b, a);
  }

  //batik
  if (batik) {
    randomSeed(0);
    for (int i=0; i<agents.length; i++) {
      agents[i] = new Agent();
    }
    for (int j = 0; j<50; j++) {
      //draw agents
      for (int i=0; i<agentsCount; i++) agents[i].render(r, g, b);
    }
  }


  if (cuAry) {
    cubes(r, g, b);
  }

  if (hairs) {
    bghairs(r, g, b);
  }

  if (zigzag) {
    zigzag(r, g, b);
  }

  if (slants) {
    slash(r, g, b);
  }

  if (bulbs) {
    bulb(r, g, b);
  }

  if (dimds) {
    diamondBg(r, g, b, a);
  }

  if (dataOrbsBg) {
    dataOrbsBg(r, g, b, a);
  }

  //background data displayed

  if (dataInBk) {
    for (float gy=databorderSize.getValue (); gy<displayHeight-databorderSize.getValue(); gy+=dataSpread.arrayValue()[1]) {
      float shiftXdata =  random(-1, 1) * gridShiftbg.arrayValue()[0];
      float shiftYdata =  random(-1, 1) * gridShiftbg.arrayValue()[1];
      elGround(databorderSize.getValue(), gy+shiftYdata, dataSpread.arrayValue()[0]+shiftXdata, dataOutline.getValue(), rd, gd, bd, ad, data, datascale, shapeStyle);
    }
  }

  if (frame) {
    noStroke();
    rectMode(CENTER);
    fill(r, g, b, 255);
    rect(0, 0, displayWidth*2, 50);
    rect(0, displayHeight-5, displayWidth*2, 50);
    rect(0, 0, 50, displayHeight*2);
    rect(displayWidth, 0, 50, displayHeight*2);
  }

  imageMode(CENTER);
  ellipseMode(CENTER);

  if (!hideImg) {
    spaceH=map(mainImgSpaX.getValue(), 0, 100, 5, 500);
    spaceV=map(mainImgSpaY.getValue(), 0, 100, 5, 500);

    for (float j=borderSize.getValue (); j<displayHeight - (borderSize.getValue()/2); j+=spaceV) {
      for (float i=borderSize.getValue (); i<displayWidth - (borderSize.getValue()/2); i+=spaceH*2) {
        noStroke();
        fill(255, spotLight);

        if (daOrbs) {
          dataOrbs(r, g, b, i, j, mainImgSize.getValue()+spotlightRadius, spotLight);
        }
        if (!daOrbs) {
          ellipse(i, j, (mainImgSize.getValue()+spotlightRadius), (mainImgSize.getValue())+spotlightRadius);
        }
        pushMatrix();
        translate(i, j);
        rotate(turnImg.getValue());
        image(img, 0, 0, mainImgSize.getValue(), mainImgSize.getValue());
        popMatrix();
      }
    }

    for (float j=borderSize.getValue (); j<displayHeight - (borderSize.getValue()/2); j+=spaceV) {
      for (float i=borderSize.getValue ()+spaceH; i<displayWidth - (borderSize.getValue()/2); i+=spaceH*2) {

        float shiftX =  gridShift.arrayValue()[0];
        float shiftY =  gridShift.arrayValue()[1];

        noStroke();
        if (daOrbs && !accentImg) {
          dataOrbs(r, g, b, i+shiftX, j+shiftY, (mainImgSize.getValue()+spotlightRadius), spotLight);
          image(img, i+shiftX, j+shiftY, mainImgSize.getValue(), mainImgSize.getValue());
        }
        if (!daOrbs && !accentImg) {
          fill(255, 255, 255, spotLight);
          ellipse(i+shiftX, j+shiftY, (mainImgSize.getValue()+spotlightRadius), (mainImgSize.getValue())+spotlightRadius);
          image(img, i+shiftX, j+shiftY, mainImgSize.getValue(), mainImgSize.getValue());
        }
        if (daOrbs && accentImg) {
          dataOrbs(r, g, b, i+shiftX, j+shiftY, ((accentImgSize.getValue()+spotlightRadius)*0.85), spotLight);
          accentImage(i+shiftX, j+shiftY, accentImgSize.getValue());
        }
        if (!daOrbs && accentImg) {
          ellipse(i+shiftX, j+shiftY, (accentImgSize.getValue()+spotlightRadius), accentImgSize.getValue()+spotlightRadius);
          accentImage(i+shiftX, j+shiftY, accentImgSize.getValue());
        }
      }
    }
  }

  if (biggie) {
    image(Bigimg, width/2+gridShift.arrayValue()[0], height/2+gridShift.arrayValue()[1], displayHeight-10, displayHeight-10);
  }

  if (shapePk) {
    hideImg=true;
    shapePack(mainGraphic, AcImgType);
  }

  if (!dataInBk) {
    for (float gy=databorderSize.getValue (); gy<displayHeight-databorderSize.getValue(); gy+=dataSpread.arrayValue()[1]) {
      float shiftXdata =  random(-1, 1) * gridShiftbg.arrayValue()[0];
      float shiftYdata =  random(-1, 1) * gridShiftbg.arrayValue()[1];
      elGround(databorderSize.getValue (), gy+shiftYdata, dataSpread.arrayValue()[0]+shiftXdata, dataOutline.getValue(), rd, gd, bd, ad, data, datascale, shapeStyle);
    }
  }

  if (twoData) {
    singleDataOrb(r, g, b, a);
  }

  if (record) {
    endRecord();
    record = false;
  }

  //nothing below this point exports to the pdf. This is to see data and make control text more visible

  fill(255, 200);
  rectMode(CORNER); 
  rect(470, height-105, textWidth(datalist[data])+100, 20);
  fill(0);
  rectMode(CENTER); 
  textSize(14);
  text(datalist[data], width/2-250, height-90);
  fill(255, 180);
  rect(width/2, height-50, 1300, 20);
  rect(280, 20, 340, 30);
  rect(95, displayHeight-168, 180, 180);
  rect(displayWidth-75, displayHeight-159, 135, 190);
  fill(0, 200);
  textSize(10);
  //load data for display at the bottom of the screen
  table = loadTable(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/dataRepo/"+datalist[data]));    //make sure to change name to match your data file, header is optional
  for (int dataRow = 3; dataRow<table.getRowCount (); dataRow++) {
    text(table.getInt(dataRow, 4), ((50*dataRow)-(dataslide*2)), height-50);
  }
}

//key inputs
void keyPressed() {          
  if (key == CODED) {
    if (keyCode == UP) {
      mainGraphic++;
    }
    if (keyCode == DOWN) {
      mainGraphic--;
    }
    if (keyCode == RIGHT) {
      data--;
    }
    if (keyCode == LEFT) {
      data++;
    }
  }
  if (key == '[') {
    AcImgType--;
  }
  if (key == ']') {
    AcImgType++;
  }
  if (key == ',') {
    dataStyle--;
  }
  if (key == '.') {
    dataStyle++;
  }

  if (key == ',') {
    dataStyle--;
  }
  if (key == '.') {
    dataStyle++;
  }

  if (key == '1') {
    bigGraphic--;
  }
  if (key == '2') {
    bigGraphic++;
  }
  if (key == '9') {
    AdddataNum--;
  }
  if (key == '0') {
    AdddataNum++;
  }
}

void accentImage(float x, float y, float size) {
  aimg = loadImage("/Users/akleindolph/Documents/Processing/dataFabrics/accentImgRepo/"+accentimglist[AcImgType]);
  image(aimg, x, y, size, size);
}

