public abstract class BubbleTank {
  private float health, x, y, direction, radius, left, right, up, down, rotateLeft, rotateRight, isShooting, speed, transferSpeed, maxHealth;
  private int id, transferX, transferY, transferDistance, transferedSoFar, stunPeriod;
  private boolean preventControl, hasTransfered;
  public ArrayList<BubbleBlock> blocks;

  public int blaster, cannon, machinegun, missile, stunburst, areablast, superattack;
  public int[][] coolDowns;

  public BubbleTank(float health, float radius, int id, float speed) {

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

    stunPeriod = 0;
    coolDowns = new int[7][2];
    for (int i=0; i<7; i++) {
      coolDowns[i][0] = 0;
    }
    coolDowns[0][1] = 22;
    coolDowns[1][1] = 14;
    coolDowns[2][1] = 34;
    coolDowns[3][1] = 400;
    coolDowns[4][1] = 400;
    coolDowns[5][1] = 400;
    coolDowns[6][1] = 900;
  }

  public abstract void updatedType();

  public void stun(int time) {
    stunPeriod = time;
  }

  public int getStunPeriod() {
    return stunPeriod;
  }

  public void incrementStun(int val) {
    stunPeriod += val;
  }

  public void move(Map m) {
    if (!preventControl && id==0 && !showMap && !playerLevelUp && stunPeriod <=0) {
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
        transferSpeed = 70;
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
    if (!showMap && stunPeriod<=0) {
      for (int i=0; i<7; i++) {
        if (coolDowns[i][0]>0) {
          coolDowns[i][0]--;
        }
      }
    }
    if (preventControl) {
      transferTank();
    }
    if (stunPeriod >0) {
      stunPeriod--;
    }
    println(coolDowns[6][0]);
  }

  public void realignDirection(float _x, float _y) {
    direction = atan2(_y-350, _x-350);
  }

  public void spawnBullets(ArrayList<BubbleBullet> arr) {
    if (isShooting == 1 &&!preventControl &&!playerLevelUp) {
      //for machine gun (cooldowns, 14,12,10,8)
      if (coolDowns[0][0] == 0) {
        for (int i=0; i<machinegun; i++) {
          float offSet;
          if (i%2==0) {
            offSet = (i+2)/2*40;
          } else {
            offSet= -(i+2)/2*40;
          }
          arr.add(new BubbleBullet(5, 15, radius, x+cos(direction+PI/2)*offSet, y+sin(direction+PI/2)*offSet, direction, id));
        }
        coolDowns[0][0] = coolDowns[0][1];
      }
      //for blaster (cooldowns: 22,20,18,16)
      if (coolDowns[1][0] ==0) {
        for (int i=0; i<blaster+1; i++) {
          float angle = 2*PI/(blaster+1);
          arr.add(new BubbleBullet(10, 15, radius, x, y, direction+i*angle, id));
        }
        coolDowns[1][0] = coolDowns[1][1];
      }
      //for canon
      if (coolDowns[2][0]==0){
      for (int i=0; i<cannon; i++) {
        float angle = PI/(cannon+1);
        arr.add(new BubbleBullet(20, 15, radius, x, y, direction-(PI/2)+(i+1)*angle, id));
      }
      coolDowns[2][0] = coolDowns[2][1];
      }
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

  public void setSpeed(float newSpeed) {
    speed = newSpeed;
  }

  public void setY(float newY) {
    y = newY;
  }

  public float getRadius() {
    return radius;
  }

  public void setDirection(float angle) {
    direction = angle;
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

  public boolean getPreventControl() {
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

  public void setHealth(float val) {
    health = val;
    maxHealth = val;
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

  public boolean addBlaster () {
    if (blaster==4){
       return false; 
    }
    blaster++;
    coolDowns[0][1] -= 2;
    return true;
  }

  public int getBlaster () {
    return blaster;
  }

  public void setBlaster(int val) {
    blaster = val;
  }

  public boolean addCannon () {
    if (cannon ==4){
      return false; 
    }
    cannon++;
    coolDowns[1][1] -= 2;
    return true;
  }

  public int getCannon () {
    return cannon;
  }

  public void setCannon(int val) {
    cannon = val;
  }


  public boolean addMachineGun () {
    if (machinegun==4){
       return false; 
    }
    machinegun++;
    coolDowns[2][1] -= 2;
    return true;
  }

  public int getMachineGun () {
    return machinegun;
  }

  public void setMachineGun(int val) {
    machinegun = val;
  }


  public boolean addMissile () {
    if (missile == 4){
       return false; 
    }
    missile++;
    coolDowns[3][1] -= 30;
    return true;
  }

  public int getMissile () {
    return missile;
  }

  public void setMissile(int val) {
    missile = val;
  }


  public boolean addStunBurst () {
    if (stunburst == 4){
       return false; 
    }
    stunburst++;
    coolDowns[4][1] -= 30;
    return true;
  }

  public int getStunBurst () {
    return stunburst;
  }

  public void setStunBurst(int val) {
    stunburst = val;
  }


  public boolean addAreaBlast () {
    if (areablast==4){
       return false; 
    }
    areablast++;
    coolDowns[5][1] -= 30;
    return true;
  }

  public int getAreaBlast () {
    return areablast;
  }

  public void setAreaBlast(int val) {
    areablast = val;
  }


  public void addSuperAttack (int n) {
    superattack = n; // 1 = super missile        2 = super blaster        3 = super cannon
  }

  public int getAttack() {
    return superattack;
  }

  public void activateMissile() {
    //if statement about cooldown
    if (missile>0 && coolDowns[3][0]==0) {
      for (int i=0; i<5+2*missile; i++) {
        allBullets.add(new MissileBullet(17, 3+missile*1.5, radius, x, y, direction+i*2*PI/(5+2*missile), id));
      }
      coolDowns[3][0] = coolDowns[3][1];
    }
  }
  public void activateStun() {
    //if statement about cooldown
    if (stunburst>0 && coolDowns[4][0]==0) {
      for (int i=0; i<10+12*stunburst; i++) {
        allBullets.add(new StunBullet(6, 3+stunburst*1.5, radius, x, y, direction+i*2*PI/(10+12*stunburst), id, 120+stunburst*30));
      }
      coolDowns[4][0] = coolDowns[4][1];
    }
  }
  public void activateAreaBurst() {
    //if statement about cooldown
    if (areablast>0&&coolDowns[5][0]==0) {
      for (int i=0; i<5+8*areablast; i++) {
        allBullets.add(new BubbleBullet(13, 3+areablast*1.2, radius, x, y, direction+i*2*PI/(5+8*areablast), id));
      }
      coolDowns[5][0] = coolDowns[5][1];
    }
  }
  public void activateSuper() {
    //if statement about cooldown
    //then turn on a variable to shoot 1 missiles
    if (getAttack() > 0&&coolDowns[6][0]==0) {
      allBullets.add(new SuperBullet(27, 5, radius, x, y, direction, id, getAttack()));
      coolDowns[6][0] = coolDowns[6][1];
    }
    
  }

  public void spawnBubbles(ArrayList<Bubble> arr) {
    return;
  }
  
  public int[][] getCoolDowns(){
     return coolDowns; 
  }
}
