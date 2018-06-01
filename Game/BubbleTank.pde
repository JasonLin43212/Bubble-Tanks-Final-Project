public abstract class BubbleTank {
  private float health, x, y, direction, radius, left, right, up, down, rotateLeft, rotateRight, isShooting, coolDown, speed;
  private int id,numBullets;

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
    if (dist(x,y,0,0)>750){
      println("out");
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
    //println(x+" " + y);
    fill(178, 207, 255);
    noStroke();
    ellipse(width/2,(height-100)/2,3*radius,3*radius);
    fill(255);
    stroke(0);
    ellipse(width/2, (height-100)/2, 2*radius, 2*radius);
    ellipse(width/2+cos(direction)*radius, (height-100)/2+sin(direction)*radius, 5, 5);
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
      arr.add(new BubbleBullet(10, 10, radius, x, y, direction, id));
    }
  }
  
  public float getX(){
     return x; 
  }
  
  public float getY(){
     return y; 
  }
}
