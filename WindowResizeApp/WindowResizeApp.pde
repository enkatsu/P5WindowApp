// https://twitter.com/shunsuke_kudo_/status/1687632477198921731?s=46&t=7j17GvG2nSpm21lo6-_nLQ

PImage img;

void settings() {
  size(640, 480);
  img = loadImage("https://placedog.net/640/480", "jpeg");
}

void setup() {
  drawImagePixels();
  surface.setResizable(true);
}

void draw() {
}

void windowResized() {
  drawImagePixels();
}

void keyPressed() {
  if (key == ' ') {
    surface.setSize(img.width, img.height);
  }
}

void drawImagePixels() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int i = (y * width + x) % img.pixels.length;
      color c = img.pixels[i];
      set(x, y, c);
    }
  }
}
