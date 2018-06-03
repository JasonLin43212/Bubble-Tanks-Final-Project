  public class BubbleBullet {
  float x, y, speed, direction, radius, tankRadius;
  int id;

  public BubbleBullet(float radius, float speed, float tankRadius, float x, float y, float direction, int id) {
    this.direction = direction;
    this.x = x+cos(direction)*tankRadius;
    this.y = y+sin(direction)*tankRadius;
    this.radius = radius;
    this.speed = speed;
    this.id=id;
    this.tankRadius = tankRadius;
  }

  public boolean move() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
    if (dist(x, y, 0, 0)>750-radius) {
      return false;
    }
    return true;
  }

  public void display() {
    fill(255);
    ellipse(x, y, radius*2, radius*2);
  }

  public String toString() {
    return x + "  " + y;
  }
}
