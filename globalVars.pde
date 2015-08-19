//foreground parametric objects
ControlP5 cp5;
Slider2D gridShift;
Slider mainImgSpaX;
Slider mainImgSpaY;
Slider mainImgSize;
Slider accentImgSize;
Slider accentImgType;
Slider shapeType;
Slider borderSize;
Slider spotlight;
ColorPicker bgColor;
ColorPicker dataColor;
ColorPicker tint;

PGraphicsPDF pdf;

//background parametric objects
Slider2D dataSpread;
Slider dataOutline;
Slider dataLook;
Slider databorderSize;
Slider dataRadius;
Slider dataScale;
Slider dataSlide;
Slider2D gridShiftbg;
Knob turnImg;

//image and pdf output objects and variables
int mnImgFreqX = 0;
int mnImgFreqY = 0;
int data = 0;
int addData = 0;
int databorder=0;
int spotlightRadius = 0;
int shapeStyle = 0;
float turn = 0;

PImage img;
PImage Bigimg;
PImage aimg;
PImage bgimg;
PShape bgshape;
PShape dataShape;

int mainGraphic = 0;
int bigGraphic = 0;
int dataStroke = 0;
int dataStyle = 0;
int dataStyle2 = 0;
int spotLight = 0;
int MnImgSize = 0;
int AcImgSize = 0;
int AcImgType = 0;
int bgShapeType = 0;
int datascale = 1;
int dataslide = 0;
int border = 0;

//table objects and variables
Table table;
float radius = 250;
float angle = 0;

File dir = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo"));
String[] list = dir.list();
File dir2 = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/dataRepo"));
String[] datalist = dir2.list();
File dir3 = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/bgImageRepo"));
String[] bgimagelist = dir3.list();
File dir4 = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/accentImgRepo"));
String[] accentimglist = dir4.list();
File dir5 = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo"));
String[] Bigimglist = dir5.list();
File dir6 = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/dataRepo"));
String[] addDatalist = dir6.list();
File dir7 = new File(dataPath("/Users/akleindolph/Documents/Processing/dataFabrics/shapeRepo"));
String[] shapelist = dir7.list();

int imageNum = (list.length)-1;
int dataNum = (datalist.length)-1;
int AdddataNum = (addDatalist.length)-1;
int AcImgNum = (accentimglist.length)-1;
int BigImgNum = (Bigimglist.length)-1;
int shapeNum = (shapelist.length)-1;

boolean record = false;
boolean bgDots = false;
boolean daOrbs = false;
boolean batik = false;
boolean accentImg = false;
boolean dataInBk = false;
boolean shapePk = false;
boolean hairs = false;
boolean biggie = false;
boolean frame = false;
boolean hideImg = false;
boolean twoData = false;
boolean custShp = false;
boolean zigzag = false;
boolean slants = false;
boolean bulbs = false;
boolean cuAry = false;
boolean dimds = false;
boolean dataOrbsBg = false;

float x, y, spaceH, spaceV;
float coreScale = 0;
float wage = 0;
int dataPoints = 0;


