void getImages() {
  
  if (list == null) {
    println("Folder does not exist or cannot be accessed.");
  } else {
    //println(list);
  }

  if (datalist == null) {
    println("Folder does not exist or cannot be accessed.");
  } else {
    //println(datalist);
  }
  img = loadImage("/Users/akleindolph/Documents/Processing/dataFabrics/imageRepo/"+list[0]);
}

