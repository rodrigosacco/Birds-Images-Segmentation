void setup(){
 size(600,600);
 smooth();
 noLoop();
}

//Filtro Escala de Cinza

void draw(){
  PImage img = loadImage("Img3Seg.png");
  PImage newImg = createImage(img.width, img.height, RGB);
  
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    newImg.pixels[pos] = color(red(img.pixels[pos]));
   }
  }


//Filtro Brilho
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    int novoValor = (int) red(newImg.pixels[pos]) + 50;
    
    if(novoValor > 255) novoValor = 255;
    else if (novoValor < 0) novoValor = 0;
    
    newImg.pixels[pos] = color(novoValor);
   }
  }

//Filtro de Limiarização
  for(int y = 0; y < img.height; y++){
   for(int x = 0; x < img.width; x++){
    int pos = y*img.width + x;
    if(red(newImg.pixels[pos]) > 178 && y > 0 && y < 526) newImg.pixels[pos] = color(255);
    else newImg.pixels[pos] = color(0);
   }
  }

  image(newImg, 0, 0);
  save("Img3SegRoxo.jpg");
}  
