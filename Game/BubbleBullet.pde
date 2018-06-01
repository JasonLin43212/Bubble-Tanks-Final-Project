public class Bullet {
  float x, y, speed, direction, radius;
  int id;

  public Bullet(float radius, float x, float y, float direction,int id) {
    this.direction = direction;
    this.x = x;
    this.y = y;
    this.radius = radius;
    speed = 4;
    this.id=id;
  }

  public boolean move() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
    if (x < radius || x > width-radius || y < radius || y>height-radius) {
      return false;
    }
    if (x<radius+35) {
      if (y<165 ||y > 235) {
        return false;
      }
    } else if (x > width-radius-36) {
      if (y<165 ||y > 235) {
        return false;
      }
    }  
    if (y < radius+35) {
      if (x<165 ||x > 235) {
        return false;
      }
    } else if (y > height-radius-36) {
      if (x<165 ||x > 235) {
        return false;
      }
    }
    return true;
  }

  public void display() {
    fill(255);
    ellipse(x+cos(direction)*20, y+sin(direction)*20, radius*2, radius*2);
  }
  
  public String toString(){
     return x + "  " + y; 
  }
}
