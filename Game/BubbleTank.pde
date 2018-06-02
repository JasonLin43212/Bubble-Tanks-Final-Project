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
      if (dist(x,y,0,0)>750-radius){
         println("hi"); 
      }
    }
    if (dist(x,y,0,0)>750){
       float angle;
       if (x>=0){
         angle = atan(y/x);
       } 
       else {
          angle = PI + atan(y/x);
       }
       if (angle>=-PI/4 && angle<PI/4){
          println("right"); 
       }
       else if (angle>=PI/4 && angle<3*PI/4){
          println("down"); 
       }
       else if (angle>=3*PI/4 && angle<5*PI/4){
          println("left"); 
       }
       else {
         println("up");
       }
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
    fill(39, 150, 203);
    noStroke();
    ellipse(width/2,(height-100)/2,3*radius,3*radius);
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
  
  public float getX(){
     return x; 
  }
  
  public float getY(){
     return y; 
  }
}
