public abstract class BubbleTank {
  private float health, x, y, direction, radius, left, right, up, down, rotateLeft, rotateRight, isShooting, coolDown, speed, transferSpeed, shootingDown, maxHealth;
  private int id, transferX, transferY, transferDistance, transferedSoFar;
  private boolean preventControl, hasTransfered;
  public ArrayList<BubbleBlock> blocks;
  
  private int blaster, cannon, machinegun, missile, stunburst, areablast, superattack;

  public BubbleTank(float health, float radius, int id, float speed, int coolDown, 
                    int blaster, int cannon, int machinegun, int missile, int stunburst, 
                    int areablast, int superattack) {

    this.health = health;
    this.maxHealth = health;
    this.id = id;
    this.speed = speed;
    this.radius = radius;
    x = 0;
    y = 0;
    direction = 0;
    left = 0;
    right = 0;
    up = 0;
    down = 0;
    rotateLeft = 0;
    rotateRight = 0;
    if (id!=0){
     this.coolDown = coolDown; 
    }
    else {
    this.coolDown = 1;
    
    }
    if (id!=0) {
      isShooting = 1;
    } else {
      isShooting = 0;
    }
    preventControl = false;
    hasTransfered = false;
    transferX = 0;
    transferY = 0;
    transferDistance = 0;
    transferSpeed = 0;
    transferedSoFar = 0;
    blocks = new ArrayList<BubbleBlock>();
    // array with all of these + cool down (2d array) 
    // make something to show cool downs in bottom
    this.blaster = blaster; // 0
    this.cannon = cannon; // 1
    this.machinegun = machinegun; // 2
    this.missile = missile; // 3
    this.stunburst = stunburst; // 4
    this.areablast = areablast; // 5
    this.superattack = superattack; // 6
  }

  public abstract void updatedType();

  public void move(Map m) {
    if (!preventControl && id==0 && !showMap) {
      x += (right-left)*speed;
      y += (down-up)*speed;
      direction += rotateLeft - rotateRight;
    }
    float distFromCenter = dist(x, y, 0, 0);
    float angle = atan2(y, x);
    //if you are the player, handle changing rooms 
    if (id==0 && distFromCenter>750 && preventControl == false) {
      //transfering right
      if (angle>=-PI/4 && angle<PI/4 && m.canChangeRoom(0)) {
        preventControl = true;
        angle = abs(angle);
        transferX = 1;
        transferY = 0;
        transferDistance = (int) (3200+ radius - 750*cos(asin(y/750)) - distFromCenter*cos(angle));
        m.changeRooms(0);
      } 
      //transfering down
      else if (angle>=PI/4 && angle<3*PI/4&&m.canChangeRoom(1)) {
        preventControl = true;
        angle = abs(angle-(PI/2));
        transferX = 0;
        transferY = 1;
        transferDistance = (int) (3200 + radius - 750*cos(asin(x/750)) - distFromCenter*cos(angle));
        m.changeRooms(1);
      } 
      //transfering up
      else if (angle>=-3*PI/4 && angle<-PI/4&&m.canChangeRoom(3)) {
        preventControl = true;
        angle = abs(angle+(PI/2));
        transferX = 0;
        transferY = -1;
        transferDistance = (int) (3200 +radius - 750*cos(asin(x/750)) - distFromCenter*cos(angle));
        m.changeRooms(3);
      } 
      //transfering left
      else if (abs(angle)>3*PI/4&&m.canChangeRoom(2)) {
        preventControl = true;
        angle = PI - abs(angle);
        transferX = -1;
        transferY = 0;
        transferDistance = (int) (3200 + radius - (750*cos(asin(y/750))) - (distFromCenter*cos(angle)));
        m.changeRooms(2);
      } else {
        x=750*cos(angle);
        y=750*sin(angle);
      }
      if (preventControl) {
        transferSpeed = 60;
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
    if (code == 32 && (!showMap || state == 0) && mouseX > 0 && mouseX<700 && mouseY>0 && mouseY<700) {
      isShooting = state;
    }
  }

  public void display() {
    if (shootingDown > 0 && !showMap) {
      shootingDown--;
    }
    if (preventControl) {
      transferTank();
    }
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
    if (isShooting == 1 && shootingDown == 0) {
      shootingDown = coolDown;
      //radius,speed,tankRadius,x,y,direction,id
      //for machine gun
      arr.add(new BubbleBullet(5, 15, radius, x, y, direction, id));
    }
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void setX(float newX) {
    x = newX;
  }

  public void setY(float newY) {
    y = newY;
  }

  public float getRadius() {
    return radius;
  }

  public float getDirection() {
    return direction;
  }

  public boolean getHasTransfered() {
    return hasTransfered;
  }  

  public ArrayList<BubbleBlock> getBlocks() {
    return blocks;
  }
  
  public boolean getPreventControl(){
     return preventControl; 
  }

  public void setRadius(float val) {
    radius = val;
  }

  public void incrementHealth(float val) {
    health += val;
    if (health>maxHealth) {
      health = maxHealth;
    }
    if (health < 0) {
      health = 0;
    }
  }

  public float getHealth() {
    return health;
  }

  public float getMaxHealth() {
    return maxHealth;
  }

  public int getId() {
    return id;
  }

  public float getSpeed() {
    return speed;
  }

  public void setDirection(float x, float y) {
    direction =  atan2(y-this.y, x-this.x);
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
      transferSpeed -= 0.6;
    }
  }
  
  public void addBlaster () {
    System.out.println("blasters: " + blaster + " > " + (blaster + 1));
    blaster++;
  }
  
  public int getBlaster () {
    return blaster;
  }
  
  public void addCannon () {
    System.out.println("cannons: " + cannon + " > " + (cannon + 1));
    cannon++;
  }
  
  public int getCannon () {
    return cannon;
  }
  
  public void addMachineGun () {
    System.out.println("machine guns: " + machinegun + " > " + (machinegun + 1));
    machinegun++;
  }
  
  public int getMachineGun () {
    return machinegun;
  }
  
  public void addMissile () {
    System.out.println("missile: " + missile + " > " + (missile + 1));
    missile++;
  }
  
  public int getMissile () {
    return missile;
  }
  
  public void addStunBurst () {
    System.out.println("stun burst: " + stunburst + " > " + (stunburst + 1));
    stunburst++;
  }
  
  public int getStunBurst () {
    return stunburst;
  }
  
  public void addAreaBlast () {
    System.out.println("area burst: " + areablast + " > " + (areablast + 1));
    areablast++;
  }
  
  public int getAreaBlast () {
    return areablast;
  }
  
  public void addSuperAttack (int n) {
    System.out.println("super attack: " + n);
    superattack = n; // 1 = super missile        2 = super blaster        3 = super cannon
  }
  
  public int getAttack() {
    return superattack;
  }
}
