public abstract class BubbleTank {
  private float health, x, y, direction, radius, left, right, up, down, rotateLeft, rotateRight, isShooting, coolDown, speed;
  private int id,numBullets;

  public BubbleTank(float health, float radius, int id, float speed, int numBullets) {
    this.health = health;
    this.id = id;
    this.speed = speed;
    this.radius = radius;
    this.numBullets = numBullets;
    x = width/2;
    y = width/2;
    direction = 0;
    left = 0;
    right = 0;
    up = 0;
    down = 0;
    rotateLeft = 0;
    rotateRight = 0;
    coolDown = 30;
    isShooting = 0;
  }

  public void move() {
    x += (right-left)*speed;
    y += (down-up)*speed;
    direction += rotateLeft - rotateRight;
    if (id != 0) {
      if (x < radius) {
        x=radius;
      }
      if (x>width-radius-1) {
        x=width-radius-1;
      }
      if (y<radius) {
        y = radius;
      }
      if (y>height-101-radius) {
        y = height-101-radius;
      }
    }
    float small = 250 + radius;
    float big = 450 - radius;
    if (x<radius+30) {
      if (y<250 ||y > 450) {
        x = radius+30;
      }
      if (y>=250 & y <small) {
        y = small;
      }
      if (y>big && y<=450) {
        y = big;
      }
    } else if (x > width-radius-31) {
      if (y<250 ||y > 450) {
        x = width-radius-31;
      }
      if (y>=250 && y <small) {
        y =small;
      }
      if (y>big && y<=450) {
        y = big;
      }
    }  
    if (y < radius+30) {
      if (x<250||x > 450) {
        y = radius+30;
      }
      if (x>=250 && x <small) {
        x =small;
      }
      if (x>big && x<=450) {
        x = big;
      }
    } else if (y > height-radius-131) {
      if (x<250 ||x > 450) {
        y = height-radius-131;
      }
      if (x>=250 && x <small) {
        x =small;
      }
      if (x>big && x<=450) {
        x = big;
      }
    }
  }

  public void setMovement(float code, float state) {
    if (code == 87) {
      up = state;
    }
    if (code == 83) {
      down = state;
    }
    if (code == 65) {
      left = state;
    }
    if (code == 68) {
      right = state;
    }
    if (code == 37) {
      rotateRight = state *radians(5);
    }
    if (code == 39) {
      rotateLeft = state*radians(5);
    }
    if (code == 32) {
      isShooting = state;
    }
  }

  public void display() {
    if (coolDown > 0) {
      coolDown--;
    }
    fill(255);
    ellipse(x, y, 2*radius, 2*radius);
    ellipse(x+cos(direction)*radius, y+sin(direction)*radius, 5, 5);
  }

  public void realignDirection(float _x, float _y) {
    float mouseRatio = (_x-x)/(_y-y);
    // "first" and "second" quadrant according to Processing
    if (_y>=y) {
      direction = PI/2 - atan(mouseRatio);
    }
    // "third" and "fourth" quadrant
    else {
      direction = (3*PI/2) - atan(mouseRatio);
    }
  }

  public void spawnBullets(ArrayList<BubbleBullet> arr) {
    if (isShooting == 1 && coolDown == 0) {
      coolDown = 1;
      //radius,speed,tankRadius,x,y,direction,id
      arr.add(new BubbleBullet(10, 5, radius, x, y, direction, id));
    }
  }
}
