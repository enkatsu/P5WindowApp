class Ball {
  PGraphics pg;
  PVector position;
  PVector speed;
  float radius;
  color fillColor;
  
  Ball(PGraphics pg, PVector position, float radius, color fillColor) {
    this.pg = pg;
    this.position = position;
    this.radius = radius;
    this.fillColor = fillColor;
    this.speed = new PVector(random(-3, 3), random(-3, 3));
  }
  
  void update() {
    position.add(speed);
    
    if (radius > position.x || position.x > pg.width - radius) {
      speed.x *= -1;
      position.x = constrain(position.x, radius, pg.width - radius);
    }
    
    if (radius > position.y || position.y > pg.height - radius) {
      speed.y *= -1;
      position.y = constrain(position.y, radius, pg.height - radius);
    }
  }
  
  void draw() {
    pg.beginDraw();
    pg.push();
    pg.noStroke();
    pg.fill(fillColor);
    pg.ellipse(position.x, position.y, radius * 2, radius * 2);
    pg.pop();
    pg.endDraw();
  }
}
