PGraphics graphics;
ArrayList<Ball> balls;

void setup() {
  size(600, 600);
  frameRate(30);

  String[] args = { "SubApplet" };
  SubApplet sa = new SubApplet();
  PApplet.runSketch(args, sa);

  graphics = createGraphics(displayWidth, displayHeight);
  balls = new ArrayList<Ball>();
  for (int i = 0; i < 10; i++) {
    float rad = random(10, 50);
    float x = random(rad, graphics.width - rad);
    float y = random(rad, graphics.width - rad);
    PVector p = new PVector(x, y);
    colorMode(HSB, 360, 100, 100, 100);
    color c = color(random(360), 100, 100, 80);
    Ball ball = new Ball(graphics, p, rad, c);
    balls.add(ball);
  }
}

void draw() {
  graphics.beginDraw();
  graphics.background(0);
  graphics.endDraw();
  
  for (Ball b : balls) {
    b.update();
    b.draw();
  }

  PVector position = getWindowPosition(getSurface());
  PImage img = graphics.get((int)position.x, (int)position.y, width, height);
  image(img, 0, 0);
}

PVector getWindowPosition(final PSurface surf) {
  javax.swing.JFrame frame = (javax.swing.JFrame)
    ((processing.awt.PSurfaceAWT.SmoothCanvas)
    surf.getNative()).getFrame();
  return new PVector(frame.getX(), frame.getY());
}
