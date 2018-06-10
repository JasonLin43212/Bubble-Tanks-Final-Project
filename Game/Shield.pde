public class Shield extends BubbleTank {

  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  int bossCoolDown;
  boolean shielded;
  float closeFactor = 1;

  public Shield(int difficulty) {
    super(3000 + difficulty*500 + bossesKilled*1000, 40, -5, difficulty/2, 0, 0, 0, 0, 0, 0, 0, 0);
    bossCoolDown = 500 - difficulty*20;
    shielded = false;
  }

  public void updatedType() {
    return;
  }

  public void display() {
    super.display();   
    blocks.clear();
    if (shielded){
      fill(126,173,189);
       blocks.add(new BubbleBlock(getX(), getY(), 120, getDirection(), color(126,173,189)));
    }
    buildBlocks();    
    for (int i=0; i<blocks.size(); i++) {
      blocks.get(i).display();
    }
    rect(getX()-2.5*getRadius(), getY()-3*getRadius(), 5*getRadius()*(getHealth()/getMaxHealth()), 1*getRadius());
    
  }

  public void move(Map m) {
    setDirection(tank.getX(), tank.getY());
    setX(getX()+closeFactor*cos(getDirection())*getSpeed());
    setY(getY()+closeFactor*sin(getDirection())*getSpeed());
    float angle = atan2(getY(),getX());
    if (dist(getX(),getY(),0,0)>750-getRadius()){
       setX((750-getRadius())*cos(angle));
       setY((750-getRadius())*sin(angle));
    }
    bossCoolDown--;
    incrementStun(-10);
    if (bossCoolDown <=0) {
      bossCoolDown = 500 - difficulty*20;
    }
    if (getStunPeriod() <=0) {
      shielded = bossCoolDown < 100;
      if (bossCoolDown > 50) {
        if (bossCoolDown % 200==0) {
          for (int i=0; i<1+(difficulty/2); i++) {
            allBullets.add(new MissileBullet(8+difficulty, 6+difficulty, getRadius(), getX(), getY(), getDirection()+2*PI*i/(1+(difficulty/2)), getId()));
          }
        }
        if (bossCoolDown % 50==0) {
          allBullets.add(new BubbleBullet(20+difficulty, 6+difficulty, getRadius(), getX(), getY(), getDirection(), getId()));
        }
      }
      if (bossCoolDown > 200 && bossCoolDown < 230) { 
        if (bossCoolDown % 3==0) {
          for (int i=0; i<difficulty; i++) {
            allBullets.add(new StunBullet(7, 1.5+difficulty*1.5, getRadius(), getX(), getY(), getDirection()+i*2*PI/difficulty, getId(), difficulty*5));
          }
        }
      }
    }
    if ((float)getHealth()/getMaxHealth() < 0.3 && bossCoolDown%20==0) {  
      allBullets.add(new BubbleBullet(6+difficulty, 3+difficulty, getRadius(), getX(), getY(), getDirection(), getId()));
    }
    if (bossCoolDown %300 == 0 && difficulty > 3) {
      allBullets.add(new BubbleBullet(60, 3+difficulty*0.5, getRadius(), getX(), getY(), getDirection(), getId()));
    }
    if (bossCoolDown % 200 ==0){
      closeFactor= -closeFactor;
    }
  }
  
  public void incrementHealth(float val){
     if (shielded){
        val = 0; 
     }
     super.incrementHealth(val);
  }

  public void buildBlocks() {
    float x= getX();
    float y= getY();
    blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), 60, getDirection(), base));
    blocks.add(new BubbleBlock(x+65*cos(getDirection()), y+65*sin(getDirection()), 75, getDirection(), base));
    blocks.add(new BubbleBlock(x+75*cos(getDirection()+PI), y+75*sin(getDirection()+PI), 60, getDirection(), base));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()+3*PI/10), y+115*sin(getDirection()+3*PI/10), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()-3*PI/10), y+115*sin(getDirection()-3*PI/10), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+90*cos(getDirection()+8*PI/18), y+90*sin(getDirection()+8*PI/18), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+90*cos(getDirection()-8*PI/18), y+90*sin(getDirection()-8*PI/18), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+80*cos(getDirection()+11*PI/18), y+80*sin(getDirection()+11*PI/18), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+80*cos(getDirection()-11*PI/18), y+80*sin(getDirection()-11*PI/18), 30, getDirection(), base));  
    blocks.add(new BubbleBlock(x+95*cos(getDirection()+7*PI/9), y+95*sin(getDirection()+7*PI/9), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+95*cos(getDirection()-7*PI/9), y+95*sin(getDirection()-7*PI/9), 30, getDirection(), base));  
    blocks.add(new BubbleBlock(x+105*cos(getDirection()+8*PI/9), y+105*sin(getDirection()+8*PI/9), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+105*cos(getDirection()-8*PI/9), y+105*sin(getDirection()-8*PI/9), 30, getDirection(), base));  
    blocks.add(new BubbleBlock(x+125*cos(getDirection()+PI), y+125*sin(getDirection()+PI), 30, getDirection(), base));
  }

  public void spawnBubbles(ArrayList<Bubble> arr) {
    arr.add(new Bubble(getX()+random(20), getY()+random(20), getRadius()*20));
  }
}
