public abstract class BubbleTank{
   private float health,x,y,direction,radius,left,right,up,down,rotateLeft,rotateRight,isShooting,coolDown,numBullets,id,speed;
   
   public BubbleTank(float health,float radius, float id, float speed, float numBullets){
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
    if (id != 0){
     if (x < radius){
        x=radius; 
     }
     if (x>width-radius-1){
        x=width-radius-1; 
     }
     if (y<radius){
        y = radius; 
     }
     if (y>height-100-radius-1){
        y = height-100-radius-1; 
     }
    }
    if (x<radius+30) {
      if (y<255 ||y > 445) {
        x = radius+30;
      }
      if (y>240 & y <255) {
        y = 240;
      }
      if (y>240 && y<255) {
        y = 240;
      }
    } else if (x > width-radius-31) {
      if (y<145 ||y > 255) {
        x = width-radius-31;
      }
      if (y>145 && y <160) {
        y =160;
      }
      if (y>240 && y<255) {
        y = 240;
      }
    }  
    if (y < radius+30) {
      if (x<145 ||x > 255) {
        y = radius+30;
      }
      if (x>145 && x <160) {
        x =160;
      }
      if (x>240 && x<255) {
        x = 240;
      }
    } else if (y > height-radius-31) {
      if (x<145 ||x > 255) {
        y = height-radius-31;
      }
      if (x>145 && x <160) {
        x =160;
      }
      if (x>240 && x<255) {
        x = 240;
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
}
