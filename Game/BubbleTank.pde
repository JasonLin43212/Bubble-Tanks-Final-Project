public abstract class BubbleTank {
  private float health, x, y, direction, radius, left, right, up, down, rotateLeft, rotateRight, isShooting, coolDown, speed, transferSpeed;
  private int id, numBullets, transferX, transferY, transferDistance, transferedSoFar;
  private boolean preventControl, hasTransfered;

  public BubbleTank(float health, float radius, int id, float speed, int numBullets) {
    this.health = health;
    this.id = id;
    this.speed = speed;
    this.radius = radius;
    this.numBullets = numBullets;
    x = 0;
    y = 0;
    direction = 0;
    left = 0;
    right = 0;
    up = 0;
    down = 0;
    rotateLeft = 0;
    rotateRight = 0;
    coolDown = 30;
    isShooting = 0;
    preventControl = false;
    hasTransfered = false;
    transferX = 0;
    transferY = 0;
    transferDistance = 0;
    transferSpeed = 0;
    transferedSoFar = 0;
  }

  public void move(Map m) {
    if (!preventControl) {
      x += (right-left)*speed;
      y += (down-up)*speed;
      direction += rotateLeft - rotateRight;
    }
    float distFromCenter = dist(x, y, 0, 0);
    if (id != 0) {
      if (distFromCenter>750-radius) {
        println("hi");
      }
    }
    if (distFromCenter>750 && preventControl == false) {
      preventControl = true;
      float angle = atan2(y, x);
      println(transferDistance);
      //transfering right
      if (angle>=-PI/4 && angle<PI/4) {
        angle = abs(angle);
        transferX = 1;
        transferY = 0;
        transferDistance = (int) (2050+ radius - 750*cos(asin(y/750)) - distFromCenter*cos(angle));
      } 
      //transfering down
      else if (angle>=PI/4 && angle<3*PI/4) {
        angle = abs(angle-(PI/2));
        transferX = 0;
        transferY = 1;
        transferDistance = (int) (2050 + radius - 750*cos(asin(x/750)) - distFromCenter*cos(angle));
      } 
      //transfering up
      else if (angle>=-3*PI/4 && angle<-PI/4) {
        angle = abs(angle+(PI/2));
        transferX = 0;
        transferY = -1;
        transferDistance = (int) (2050 +radius - 750*cos(asin(x/750)) - distFromCenter*cos(angle));
      } 
      //transfering left
      else {
        angle = PI - abs(angle);
        transferX = -1;
        transferY = 0;
        transferDistance = (int) (2050 + radius - (750*cos(asin(y/750))) - (distFromCenter*cos(angle)));
      }
      transferSpeed = 40;
      //println(transferX + " " + transferY + " " + transferDistance + " " + degrees(angle));
    }
  }

  public void setMovement(float code, float state) {
    // "W" key
    if (code == 87) {
      up = state;
    }
    // "S" Key
    if (code == 83) {
      down = state;
    }
    // "A" key
    if (code == 65) {
      left = state;
    }
    // "D" key
    if (code == 68) {
      right = state;
    }
    // <- Key
    if (code == 37) {
      rotateRight = state *radians(5);
    }
    // -> Key
    if (code == 39) {
      rotateLeft = state*radians(5);
    }
    // Spacebar
    if (code == 32) {
      isShooting = state;
    }
  }

  public void display() {
    if (coolDown > 0) {
      coolDown--;
    }
    if (preventControl) {
      transferTank();
    }
    //println(x+" " + y);
    //println(hasTransfered + " " + preventControl);
    //println(transferDistance);
    fill(39, 150, 203);
    noStroke();
    ellipse(width/2, (height-100)/2, 3*radius, 3*radius);
    fill(255);
    stroke(0);
    ellipse(width/2, (height-100)/2, 2*radius, 2*radius);
    ellipse(width/2+cos(direction)*radius, (height-100)/2+sin(direction)*radius, 5, 5);
  }

  public void realignDirection(float _x, float _y) {
    float mouseRatio = (_y-350)/(_x-350);
    // "first" and "fourth" quadrant according to Processing
    if (_x>=350) {
      direction = atan(mouseRatio);
    }
    // "second" and "third" quadrant
    else {
      direction = PI + atan(mouseRatio);
    }
  }

  public void spawnBullets(ArrayList<BubbleBullet> arr) {
    if (isShooting == 1 && coolDown == 0) {
      coolDown = 1;
      //radius,speed,tankRadius,x,y,direction,id
      arr.add(new BubbleBullet(10, 10, radius, x, y, direction, id));
    }
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void transferTank() {
    if (transferedSoFar >= transferDistance) {
      preventControl = false;
      hasTransfered = false;
      transferedSoFar = 0;
      transferSpeed = 20;
    } else if ((abs(x) > 1500 || abs(y) > 1500) && !hasTransfered) {
      if (abs(transferX) == 1) {
        x = -x + transferX*transferSpeed;
      } else if (abs(transferY) == 1) {
        y = -y + transferY*transferSpeed;
      }
      transferedSoFar += abs(transferSpeed);
      hasTransfered = true;
    } else {
      x += transferSpeed * transferX;
      y += transferSpeed * transferY;
      transferedSoFar += abs(transferSpeed);
      transferSpeed -= 0.5;
    }
  }
}
