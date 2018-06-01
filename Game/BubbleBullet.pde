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
    if (x < radius || x > width-radius || y < radius-1 || y>height-radius-101) {
      return false;
    }
    float small = 250 + radius;
    float large = 450-radius;
    if (x<radius+30) {
      if (y<small||y > large) {
        return false;
      }
    } else if (x > width-radius-31) {
      if (y<small ||y > large) {
        return false;
      }
    }  
    if (y < radius+30) {
      if (x<small ||x > large) {
        return false;
      }
    } else if (y > height-radius-131) {
      if (x<small ||x > large) {
        return false;
      }
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
