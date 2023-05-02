void setup() {
  size(485, 600);
  noLoop();
}

void draw() {
  PImage img = loadImage("Img4Roxo.png");
  PImage newImage = createImage(img.width, img.height, RGB);
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      int pos=y*img.width+x;
      int media = (int) (red(img.pixels[pos])+green(img.pixels[pos])+blue(img.pixels[pos]))/3;
      newImage.pixels[pos]=color(green(img.pixels[pos]));
      //newImage.pixels[pos]=color(media);
    }
  }
  //Filto Brilho 
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      int pos=y*img.width+x;
      int novoValor = (int) green(newImage.pixels[pos]) + 86;
      if (novoValor>255) novoValor=255;
      else if (novoValor<0) novoValor=0;
      newImage.pixels[pos] = color(novoValor);
    }
  }
//Filtro de Limiarização
for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      int pos=y*img.width+x;
      if(green(newImage.pixels[pos])>150 && y>1 && y<600)newImage.pixels[pos]=color(0);
      else newImage.pixels[pos]=color(255);
    }
}

  image(newImage, 0, 0);
  save("IMGGT.jpg");
}