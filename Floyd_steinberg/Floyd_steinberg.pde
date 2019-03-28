PImage im;
PImage newim;
int w;
int h;
int factor = 4;
int scale= 1;

void settings() {
  im = loadImage("zoe.jpg");
  im.filter(GRAY);
  newim = im.copy();
  w = im.width;
  h = im.height;
  size(w*scale, h*scale);
}

void setup() {
}

void draw() {
  scale(scale);
  //image(im,0,0);

  im.loadPixels();
  float r, g, b, newr, newg, newb, errr, errg, errb;
  color pix;
  //print(w,h);
  for (int i = 0; i< h-1; i++) {
    for (int j = 0; j< w-1; j++) {
      pix = im.pixels[w*i+j];
      r = red(pix);
      g = green(pix);
      b = blue(pix);
      newr = round(factor * r/255) * 255/factor;
      newg = round(factor * g/255) * 255/factor;
      newb = round(factor * b/255) * 255/factor;
      errr = r-newr;
      errg = g-newg;
      errb = b-newb;
      im.pixels[w*i+j+1] = im.pixels[w*i+j+1] + color(errr * 7/16, errg * 7/16, errb * 7/16) ;
      if (j != 0) {
        im.pixels[w*(i+1)+j-1] = im.pixels[w*(i+1)+j-1] + color(errr * 3/16, errg * 3/16, errb * 3/16) ;
      }
      //println(i,j);
      im.pixels[w*(i+1)+j] = im.pixels[w*(i+1)+j] + color(errr * 5/16, errg * 5/16, errb * 5/16) ;
      im.pixels[w*(i+1)+j+1] = im.pixels[w*(i+1)+j+1] + color(errr * 1/16, errg * 1/16, errb * 1/16) ;
      newim.pixels[w*i+j] = color(newr, newg, newb);
    }
  }
  im.updatePixels();
  image(newim, 0, 0);
  save("FS.png");
  noLoop();
}
