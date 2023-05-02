void setup(){
 size(600,600);
 smooth();
 noLoop();
}

//Filtro Escala de Cinza

void draw(){
  PImage img = loadImage("Img3.jpg");
  PImage newImg = createImage(img.width, img.height, RGB);
  
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    newImg.pixels[pos] = color(blue(img.pixels[pos]));
   }
  }

//Filtro de Média
int kernelSize = 5; //tamanho da matriz de kernel
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


//Filtro de Limiarização
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    if(red(newImg.pixels[pos]) > 210 && y > 0 && y < 526) newImg.pixels[pos] = color(0);
    else newImg.pixels[pos] = color(img.pixels[pos]);
   }
  }

  image(newImg, 0, 0);
  save("Img3SegOriginalColor.jpg");
}  
