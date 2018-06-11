public class Bull extends BubbleTank {

  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  int bossCoolDown;
  boolean shielded;
  boolean preventMovement;
  public Bull(int difficulty) {
    super(3000 + difficulty*500 + bossesKilled*1000, 40, -10, difficulty);
    bossCoolDown = 500 - difficulty*20;
    shielded = false;
    preventMovement = false;
  }

  public void updatedType() {
    return;
  }

  public void display() {
    super.display();   
    blocks.clear();
    buildBlocks();
    for (int i=0; i<blocks.size(); i++) {
      blocks.get(i).display();
    }
    showHealth();
  }

  public void showHealth() {
    pushMatrix();
    translate(tank.getX()-350, tank.getY()-350);
    fill(46, 89, 47);
    textAlign(CENTER);
    textFont(bubble);
    textSize(36); // 29
    text("Boss Health", 350, 50);
    rect(100, 50, 500, 30);
    fill(72, 139, 73);
    rect(105, 52.5, 490*(getHealth()/getMaxHealth()), 25);
    popMatrix();
  }


  public void move(Map m) {
    if (!preventMovement) {
      if (bossCoolDown>131 || bossCoolDown < 90) {
        setDirection(tank.getX(), tank.getY());
      }
      setX(getX()+cos(getDirection())*getSpeed());
      setY(getY()+sin(getDirection())*getSpeed());
      float angle = atan2(getY(), getX());
      if (dist(getX(), getY(), 0, 0)>750-getRadius()) {
        setX((750-getRadius())*cos(angle));
        setY((750-getRadius())*sin(angle));
      }
      if (dist(getX(), getY(), tank.getX(), tank.getY())<200) {
        bossCoolDown = 131;
      }
    }
    bossCoolDown--;
    incrementStun(-2);
    if (bossCoolDown <=0) {
      bossCoolDown = 500 - difficulty*20;
    }
    if (getStunPeriod() <=0) {
      if (bossCoolDown == 130) {
        setSpeed(difficulty+20);
        allBullets.add(new BubbleBullet(20+difficulty*1.5, difficulty+20, getRadius(), getX(), getY(), getDirection(), getId()));
      }
      if (bossCoolDown == 90) {
        setSpeed(difficulty);
        preventMovement = true;
      }
      if (bossCoolDown == 10+difficulty*5) {
        preventMovement = false;
      }
      if (bossCoolDown > 50) {
        if (bossCoolDown % 200==0) {
          for (int i=0; i<1+(difficulty/2); i++) {
            allBullets.add(new MissileBullet(8+difficulty, 6+difficulty, getRadius(), getX(), getY(), getDirection()+2*PI*i/(1+(difficulty/2)), getId()));
          }
        }
        if (bossCoolDown % 40==0) {
          allBullets.add(new BubbleBullet(20+difficulty, 6+difficulty, getRadius(), getX(), getY(), getDirection(), getId()));
        }
      }
      if (bossCoolDown < 130 && bossCoolDown > 100) { 
        if (bossCoolDown % 1==0) {
          for (int i=0; i<difficulty*2+4; i++) {
            allBullets.add(new StunBullet(8, difficulty+3, getRadius(), getX(), getY(), getDirection()+i*PI/(difficulty+2), getId(), difficulty*5));
          }
        }
      }
    }
    if ((float)getHealth()/getMaxHealth() < 0.3 && bossCoolDown%25==0) {  
      allBullets.add(new MissileBullet(7+difficulty, 4+difficulty, getRadius(), getX(), getY(), getDirection(), getId()));
    }
    if (bossCoolDown %150 == 0 && difficulty > 3) {
      allBullets.add(new StunBullet(50, 5+difficulty*2, getRadius(), getX(), getY(), getDirection(), getId(), 40));
    }
  }

  public void buildBlocks() {
    float x = getX();
    float y = getY();
    color bullBrown = color(82, 54, 27);
    color g = color(205, 183, 158);
    color bullRed = color(175, 28, 25);
    color eyebrow = color(101, 15, 22);
    color nose = color(110, 90, 67);
    color horn1 =color(205, 183, 158);
    color horn2 = color(222, 208, 192);
    //Horn 0
    blocks.add(new BubbleBlock(x+83*cos(getDirection()+28*PI/36), y+83*sin(getDirection()+28*PI/36), 17, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+83*cos(getDirection()-28*PI/36), y+83*sin(getDirection()-28*PI/36), 17, getDirection(), horn1));
    //Face
    blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), 77, getDirection(), bullBrown));
    blocks.add(new BubbleBlock(x+70*cos(getDirection()), y+70*sin(getDirection()), 40, getDirection(), bullBrown));
    //Nose and Eye
    blocks.add(new BubbleBlock(x+70*cos(getDirection()), y+70*sin(getDirection()), 20, getDirection(), bullRed));
    blocks.add(new BubbleBlock(x+30*cos(getDirection()-5*PI/8), y+30*sin(getDirection()-5*PI/8), 10, getDirection(), bullRed));
    blocks.add(new BubbleBlock(x+30*cos(getDirection()+5*PI/8), y+30*sin(getDirection()+5*PI/8), 10, getDirection(), bullRed));
    //Eyebrows
    blocks.add(new BubbleBlock(x+55*cos(getDirection()-27*PI/36), y+55*sin(getDirection()-27*PI/36), 5, getDirection(), eyebrow));
    blocks.add(new BubbleBlock(x+55*cos(getDirection()+27*PI/36), y+55*sin(getDirection()+27*PI/36), 5, getDirection(), eyebrow));
    blocks.add(new BubbleBlock(x+27*cos(getDirection()-32*PI/36), y+27*sin(getDirection()-32*PI/36), 5, getDirection(), eyebrow));
    blocks.add(new BubbleBlock(x+27*cos(getDirection()+32*PI/36), y+27*sin(getDirection()+32*PI/36), 5, getDirection(), eyebrow));
    blocks.add(new BubbleBlock(x+42*cos(getDirection()-30*PI/36), y+42*sin(getDirection()-30*PI/36), 5, getDirection(), eyebrow));
    blocks.add(new BubbleBlock(x+42*cos(getDirection()+30*PI/36), y+42*sin(getDirection()+30*PI/36), 5, getDirection(), eyebrow));
    //Nose
    blocks.add(new BubbleBlock(x+47*cos(getDirection()+6*PI/36), y+47*sin(getDirection()+6*PI/36), 15, getDirection(), nose));
    blocks.add(new BubbleBlock(x+47*cos(getDirection()-6*PI/36), y+47*sin(getDirection()-6*PI/36), 15, getDirection(), nose));
    //Horn 1
    blocks.add(new BubbleBlock(x+92*cos(getDirection()+28*PI/36), y+92*sin(getDirection()+28*PI/36), 17, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+92*cos(getDirection()-28*PI/36), y+92*sin(getDirection()-28*PI/36), 17, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+92*cos(getDirection()+28*PI/36), y+92*sin(getDirection()+28*PI/36), 12, getDirection(), horn2));
    blocks.add(new BubbleBlock(x+92*cos(getDirection()-28*PI/36), y+92*sin(getDirection()-28*PI/36), 12, getDirection(), horn2));
    // Horn 2
    blocks.add(new BubbleBlock(x+115*cos(getDirection()+27*PI/36), y+115*sin(getDirection()+27*PI/36), 14, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()-27*PI/36), y+115*sin(getDirection()-27*PI/36), 14, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()+27*PI/36), y+115*sin(getDirection()+27*PI/36), 9, getDirection(), horn2));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()-27*PI/36), y+115*sin(getDirection()-27*PI/36), 9, getDirection(), horn2));
    // Horn 3
    blocks.add(new BubbleBlock(x+132*cos(getDirection()+26*PI/36), y+132*sin(getDirection()+26*PI/36), 12, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+132*cos(getDirection()-26*PI/36), y+132*sin(getDirection()-26*PI/36), 12, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+132*cos(getDirection()+26*PI/36), y+132*sin(getDirection()+26*PI/36), 7, getDirection(), horn2));
    blocks.add(new BubbleBlock(x+132*cos(getDirection()-26*PI/36), y+132*sin(getDirection()-26*PI/36), 7, getDirection(), horn2));
    //horn 4
    blocks.add(new BubbleBlock(x+142*cos(getDirection()+25*PI/36), y+142*sin(getDirection()+25*PI/36), 10, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()-25*PI/36), y+142*sin(getDirection()-25*PI/36), 10, getDirection(), horn1));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()+25*PI/36), y+142*sin(getDirection()+25*PI/36), 5, getDirection(), horn2));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()-25*PI/36), y+142*sin(getDirection()-25*PI/36), 5, getDirection(), horn2));
  }



  public void spawnBubbles(ArrayList<Bubble> arr) {
    arr.add(new Bubble(getX()+random(20), getY()+random(20), getRadius()*20));
  }
}
