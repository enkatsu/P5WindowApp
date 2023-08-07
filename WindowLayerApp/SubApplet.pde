
public class SubApplet extends PApplet {

  public void settings() {
    size(600, 600);
  }

  public void draw() {
    PVector position = getWindowPosition(this.getSurface());
    PImage img = graphics.get((int)position.x, (int)position.y, width, height);
    image(img, 0, 0);
  }
}
