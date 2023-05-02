void setup(){
 background(0);
 size(600,600);
 smooth();
 noLoop();
}

//Filtro Escala de Cinza

void draw(){
  PImage img = loadImage("Img1Seg.png");
  PImage newImg = createImage(img.width, img.height, RGB);
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    //int media = (int) (red(img.pixels[pos]) + green(img.pixels[pos]) + blue(img.pixels[pos]))  / 3;
    newImg.pixels[pos] = color(green(img.pixels[pos]));
   }
  }

//Filtro Brilho
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    int novoValor = (int) red(newImg.pixels[pos]) - 10;
    
    if(novoValor > 255) novoValor = 255;
    else if (novoValor < 0) novoValor = 0;
    
    newImg.pixels[pos] = color(novoValor);
   }
  }


/*
//Filtro de Média
int kernelSize = 3; //tamanho da matriz de kernel
for (int y = 0; y < newImg.height; y++) {
  for (int x = 0; x < newImg.width; x++) {
    int sumR = 0, sumG = 0, sumB = 0, count = 0;
    for (int ky = -kernelSize/2; ky <= kernelSize/2; ky++) {
      for (int kx = -kernelSize/2; kx <= kernelSize/2; kx++) {
        int px = x + kx, py = y + ky;
        if (px >= 0 && px < newImg.width && py >= 0 && py < newImg.height) {
          int pos = py*img.width + px;
          sumR += red(newImg.pixels[pos]);
          sumG += green(newImg.pixels[pos]);
          sumB += blue(newImg.pixels[pos]);
          count++;
        }
      }
    }
    int avgR = sumR / count;
    int avgG = sumG / count;
    int avgB = sumB / count;
    int npos = y*img.width + x;
    newImg.pixels[npos] = color(avgR, avgG, avgB);
  }
}
*/
//Filtro de Limiarização
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    if(red(newImg.pixels[pos]) < 125 && y > 60 && y < 526 && x > 190 && x < 425) newImg.pixels[pos] = color(255);
    else newImg.pixels[pos] = color(0);
   }
  }

  image(newImg, 0, 0);
  save("Img1SegOriginal.jpg");
}  