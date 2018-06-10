public class EnemyTank extends BubbleTank {

  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  private float goToAngle, goToDistance, distanceSoFar;

  public EnemyTank(float health, float radius, int id, float speed, int type, int coolDown) {
    super(health, radius, id, speed, coolDown,0,0,0,0,0,0,0);
    this.type = type;
    goToAngle = random(2*PI);
    goToDistance = 1;
    distanceSoFar = 1;
    setX(random(600)*cos(-goToAngle));
    setY(random(600)*sin(-goToAngle));
  }

  public void updatedType() {
    return ;
  }

  public void display() {
    super.display();   
    buildBlocks();
    for (int i=0; i<blocks.size(); i++) {
      blocks.get(i).display();
    }
    fill(255, 190);
    rect(getX()-1.5*getRadius(), getY()-2*getRadius(), 3*getRadius()*(getHealth()/getMaxHealth()), 0.5*getRadius());
  }

  public void buildBlocks() {
    blocks.clear();
    float x = getX();
    float y = getY();
    if (type == 0) {
      blaster = -1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+getRadius()*cos(getDirection()), y+getRadius()*sin(getDirection()), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+2*PI/3), y+1.3*getRadius()*sin(getDirection()+2*PI/3), 5*getRadius()/8, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-2*PI/3), y+1.3*getRadius()*sin(getDirection()-2*PI/3), 5*getRadius()/8, getDirection(), base));
    }
    if (type == 1) {
      blaster = -1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      for (int i=0; i<5; i++) {
        blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()+i*PI/2.5), y+1.5*getRadius()*sin(getDirection()+i*PI/2.5), getRadius()/2, getDirection(), base));
      }
    }
    if (type == 2) {
      blaster = -1;
      for (int i=0; i<3; i++) {
        blocks.add(new BubbleBlock(x+0.6*getRadius()*cos(getDirection()+i*PI/1.5), y+0.6*getRadius()*sin(getDirection()+i*PI/1.5), getRadius()/2, getDirection(), base));
      }
      for (int i=0; i<3; i++) {
        blocks.add(new BubbleBlock(x+1.45*getRadius()*cos(getDirection()+i*PI/1.5), y+1.45*getRadius()*sin(getDirection()+i*PI/1.5), getRadius()/3, getDirection(), base));
        blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+i*PI/1.5+PI/6), y+1.3*getRadius()*sin(getDirection()+i*PI/1.5+PI/6), getRadius()/3, getDirection(), base));
        blocks.add(new BubbleBlock(x+1.1*getRadius()*cos(getDirection()+i*PI/1.5+PI/3), y+1.2*getRadius()*sin(getDirection()+i*PI/1.5+PI/3), getRadius()/3, getDirection(), base));
        blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+i*PI/1.5+PI/2), y+1.3*getRadius()*sin(getDirection()+i*PI/1.5+PI/2), getRadius()/3, getDirection(), base));
      }
    }
    if (type == 3) {
      blaster = 0;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()), y+1.4*getRadius()*sin(getDirection()), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+PI/2), y+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI/2), y+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI), y+1.4*getRadius()*sin(getDirection()-PI), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()+PI/9), y+1.9*getRadius()*sin(getDirection()+PI/9), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()-PI/9), y+1.9*getRadius()*sin(getDirection()-PI/9), getRadius()/3, getDirection(), base));
    }
    if (type == 4) {
      blaster = 1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      for (int i=0; i<3; i++) {
        blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+i*PI/1.5-PI/3), y+1.4*getRadius()*sin(getDirection()+i*PI/1.5-PI/3), getRadius()/2, getDirection(), base));
        blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+i*PI/1.5), y+1.4*getRadius()*sin(getDirection()+i*PI/1.5), getRadius()/2, getDirection(), base));
        blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+i*PI/1.5-PI/3.8), y+2.1*getRadius()*sin(getDirection()+i*PI/1.5-PI/3.8), getRadius()/4, getDirection(), base));
        blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+i*PI/1.5-PI/2.5), y+2.1*getRadius()*sin(getDirection()+i*PI/1.5-PI/2.5), getRadius()/4, getDirection(), base));
      }
    }
    if (type == 5) {
      machinegun=1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      for (int i=0; i<3; i++) {
        blocks.add(new BubbleBlock(x+(1.2+i*0.5)*getRadius()*cos(getDirection()+5*PI/6), y+(1.2+i*0.5)*getRadius()*sin(getDirection()+5*PI/6), getRadius()/4, getDirection(), base));
        blocks.add(new BubbleBlock(x+(1.2+i*0.5)*getRadius()*cos(getDirection()-5*PI/6), y+(1.2+i*0.5)*getRadius()*sin(getDirection()-5*PI/6), getRadius()/4, getDirection(), base));
      }
    }
    if (type == 6) {
      cannon = 1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+PI/3), y+1.4*getRadius()*sin(getDirection()+PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI/3), y+1.4*getRadius()*sin(getDirection()-PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.55*getRadius()*cos(getDirection()+PI), y+1.55*getRadius()*sin(getDirection()+PI), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+2*getRadius()*cos(getDirection()+8*PI/9), y+2*getRadius()*sin(getDirection()+8*PI/9), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2*getRadius()*cos(getDirection()-8*PI/9), y+2*getRadius()*sin(getDirection()-8*PI/9), getRadius()/4, getDirection(), base));
    }
    if (type == 7) {
      blaster = 3;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      for (int i=0; i<4; i++) {
        blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+i*PI/2+PI/4), y+1.4*getRadius()*sin(getDirection()+i*PI/2+PI/4), getRadius()/3, getDirection(), base));
        blocks.add(new BubbleBlock(x+2.4*getRadius()*cos(getDirection()+i*PI/2+PI/4), y+2.4*getRadius()*sin(getDirection()+i*PI/2+PI/4), getRadius()/1.5, getDirection(), base));
        blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+i*PI/2+PI/4), y+2.1*getRadius()*sin(getDirection()+i*PI/2+PI/4), getRadius()/3, getDirection(), base));
      }
    }
    if (type == 8) {
      blaster = 1;
      machinegun = 1;
      cannon = 1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+1*PI/11), y+1.3*getRadius()*sin(getDirection()+1*PI/11), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-1*PI/11), y+1.3*getRadius()*sin(getDirection()-1*PI/11), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.95*getRadius()*cos(getDirection()), y+1.95*getRadius()*sin(getDirection()), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()+39*PI/44), y+1.5*getRadius()*sin(getDirection()+39*PI/44), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()-39*PI/44), y+1.5*getRadius()*sin(getDirection()-39*PI/44), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.2*getRadius()*cos(getDirection()+PI/2), y+1.2*getRadius()*sin(getDirection()+PI/2), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.2*getRadius()*cos(getDirection()-PI/2), y+1.2*getRadius()*sin(getDirection()-PI/2), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.2*getRadius()*cos(getDirection()+PI/1.6), y+1.2*getRadius()*sin(getDirection()+PI/1.6), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.2*getRadius()*cos(getDirection()-PI/1.6), y+1.2*getRadius()*sin(getDirection()-PI/1.6), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()+PI/1.9), y+1.6*getRadius()*sin(getDirection()+PI/1.9), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()-PI/1.9), y+1.6*getRadius()*sin(getDirection()-PI/1.9), getRadius()/5, getDirection(), base));  
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()-PI/1.65), y+1.6*getRadius()*sin(getDirection()-PI/1.65), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()+PI/1.65), y+1.6*getRadius()*sin(getDirection()+PI/1.65), getRadius()/5, getDirection(), base));
    }
    if (type == 9) {
      blaster = 2;
      machinegun = 1;
      cannon = 1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()), y+1.4*getRadius()*sin(getDirection()), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI/4), y+1.4*getRadius()*sin(getDirection()-PI/4), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+PI/4), y+1.4*getRadius()*sin(getDirection()+PI/4), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-3*PI/4), y+1.4*getRadius()*sin(getDirection()-3*PI/4), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+3*PI/4), y+1.4*getRadius()*sin(getDirection()+3*PI/4), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+PI/13), y+2.1*getRadius()*sin(getDirection()+PI/13), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2*getRadius()*cos(getDirection()), y+2*getRadius()*sin(getDirection()), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()-PI/13), y+2.1*getRadius()*sin(getDirection()-PI/13), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.7*getRadius()*cos(getDirection()-7*PI/8), y+1.7*getRadius()*sin(getDirection()-7*PI/8), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.7*getRadius()*cos(getDirection()+7*PI/8), y+1.7*getRadius()*sin(getDirection()+7*PI/8), getRadius()/4, getDirection(), base));
    }
    if (type == 10) {
      machinegun = 3;
      cannon = 2;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()), y+1.4*getRadius()*sin(getDirection()), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI/4), y+1.4*getRadius()*sin(getDirection()-PI/4), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+PI/4), y+1.4*getRadius()*sin(getDirection()+PI/4), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-9*PI/12), y+1.3*getRadius()*sin(getDirection()-9*PI/12), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+9*PI/12), y+1.3*getRadius()*sin(getDirection()+9*PI/12), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-10.6*PI/12), y+1.3*getRadius()*sin(getDirection()-10.6*PI/12), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+10.6*PI/12), y+1.3*getRadius()*sin(getDirection()+10.6*PI/12), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()-10.8*PI/12), y+1.8*getRadius()*sin(getDirection()-10.8*PI/12), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()+10.8*PI/12), y+1.8*getRadius()*sin(getDirection()+10.8*PI/12), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()-9.6*PI/12), y+1.9*getRadius()*sin(getDirection()-9.6*PI/12), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()+9.6*PI/12), y+1.9*getRadius()*sin(getDirection()+9.6*PI/12), getRadius()/2, getDirection(), base));
    }
    if (type == 11) {
      machinegun = 3;
      blaster = 3;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()), y+1.3*getRadius()*sin(getDirection()), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.7*getRadius()*cos(getDirection()), y+1.7*getRadius()*sin(getDirection()), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+PI), y+1.3*getRadius()*sin(getDirection()+PI), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+6*PI/13), y+1.3*getRadius()*sin(getDirection()+6*PI/13), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+7.5*PI/13), y+1.3*getRadius()*sin(getDirection()+7.5*PI/13), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-6*PI/13), y+1.3*getRadius()*sin(getDirection()-6*PI/13), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-7.5*PI/13), y+1.3*getRadius()*sin(getDirection()-7.5*PI/13), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2*getRadius()*cos(getDirection()-6.5*PI/13), y+2*getRadius()*sin(getDirection()-6.5*PI/13), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+2*getRadius()*cos(getDirection()+6.5*PI/13), y+2*getRadius()*sin(getDirection()+6.5*PI/13), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()-5.5*PI/13), y+2.5*getRadius()*sin(getDirection()-5.5*PI/13), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()+7.5*PI/13), y+2.5*getRadius()*sin(getDirection()+7.5*PI/13), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()+5.5*PI/13), y+2.5*getRadius()*sin(getDirection()+5.5*PI/13), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()-7.5*PI/13), y+2.5*getRadius()*sin(getDirection()-7.5*PI/13), getRadius()/4, getDirection(), base));
    }
    if (type == 12) {
      machinegun = 3;
      cannon = 2;
      blaster = 1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()), y+1.3*getRadius()*sin(getDirection()), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.25*getRadius()*cos(getDirection()+PI), y+1.25*getRadius()*sin(getDirection()+PI), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.25*getRadius()*cos(getDirection()+PI/3), y+1.25*getRadius()*sin(getDirection()+PI/3), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.25*getRadius()*cos(getDirection()-PI/3), y+1.25*getRadius()*sin(getDirection()-PI/3), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()+PI/3), y+1.8*getRadius()*sin(getDirection()+PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()-PI/3), y+1.8*getRadius()*sin(getDirection()-PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.4*getRadius()*cos(getDirection()+PI/2.7), y+2.4*getRadius()*sin(getDirection()+PI/2.7), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.4*getRadius()*cos(getDirection()-PI/2.7), y+2.4*getRadius()*sin(getDirection()-PI/2.7), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()+PI/2.3), y+1.5*getRadius()*sin(getDirection()+PI/2.3), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()-PI/2.3), y+1.5*getRadius()*sin(getDirection()-PI/2.3), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()+PI/1.8), y+1.6*getRadius()*sin(getDirection()+PI/1.8), getRadius()/3.3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()-PI/1.8), y+1.6*getRadius()*sin(getDirection()-PI/1.8), getRadius()/3.3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()+PI/1.55), y+1.9*getRadius()*sin(getDirection()+PI/1.55), getRadius()/3.6, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()-PI/1.55), y+1.9*getRadius()*sin(getDirection()-PI/1.55), getRadius()/3.6, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.3*getRadius()*cos(getDirection()+PI/1.4), y+2.3*getRadius()*sin(getDirection()+PI/1.4), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.3*getRadius()*cos(getDirection()-PI/1.4), y+2.3*getRadius()*sin(getDirection()-PI/1.4), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()+PI/1.3), y+2.5*getRadius()*sin(getDirection()+PI/1.3), getRadius()/4.4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()-PI/1.3), y+2.5*getRadius()*sin(getDirection()-PI/1.3), getRadius()/4.4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+9.5*PI/11), y+1.3*getRadius()*sin(getDirection()+9.5*PI/11), getRadius()/3.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-9.5*PI/11), y+1.3*getRadius()*sin(getDirection()-9.5*PI/11), getRadius()/3.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()+9.7*PI/11), y+1.8*getRadius()*sin(getDirection()+9.7*PI/11), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()-9.7*PI/11), y+1.8*getRadius()*sin(getDirection()-9.7*PI/11), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()+9.9*PI/11), y+2.2*getRadius()*sin(getDirection()+9.9*PI/11), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()-9.9*PI/11), y+2.2*getRadius()*sin(getDirection()-9.9*PI/11), getRadius()/5, getDirection(), base));
    }
    if (type == 13) {
      cannon = 4;
      blaster = 1;
      machinegun = 1;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()+2*PI/5), y+1.5*getRadius()*sin(getDirection()+2*PI/5), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()-2*PI/5), y+1.5*getRadius()*sin(getDirection()-2*PI/5), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+3*PI/5), y+1.4*getRadius()*sin(getDirection()+3*PI/5), getRadius()/2.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-3*PI/5), y+1.4*getRadius()*sin(getDirection()-3*PI/5), getRadius()/2.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()+1.5*PI/5), y+2.2*getRadius()*sin(getDirection()+1.5*PI/5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()-1.5*PI/5), y+2.2*getRadius()*sin(getDirection()-1.5*PI/5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.6*getRadius()*cos(getDirection()+1.2*PI/5), y+2.6*getRadius()*sin(getDirection()+1.2*PI/5), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.6*getRadius()*cos(getDirection()-1.2*PI/5), y+2.6*getRadius()*sin(getDirection()-1.2*PI/5), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.6*getRadius()*cos(getDirection()+PI), y+1.6*getRadius()*sin(getDirection()+PI), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()+29*PI/32), y+1.8*getRadius()*sin(getDirection()+29*PI/32), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.8*getRadius()*cos(getDirection()-29*PI/32), y+1.8*getRadius()*sin(getDirection()-29*PI/32), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+31*PI/32), y+2.1*getRadius()*sin(getDirection()+31*PI/32), getRadius()/4.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()-31*PI/32), y+2.1*getRadius()*sin(getDirection()-31*PI/32), getRadius()/4.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.5*getRadius()*cos(getDirection()+PI), y+2.5*getRadius()*sin(getDirection()+PI), getRadius()/3.6, getDirection(), base));
      blocks.add(new BubbleBlock(x+3*getRadius()*cos(getDirection()+PI), y+3*getRadius()*sin(getDirection()+PI), getRadius()/4, getDirection(), base));
    }
    if (type == 14) {
      cannon = 3;
      blaster = 3;
      machinegun = 2;
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()), y+1.4*getRadius()*sin(getDirection()), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+PI), y+1.4*getRadius()*sin(getDirection()+PI), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.65*getRadius()*cos(getDirection()+2*PI/11), y+1.65*getRadius()*sin(getDirection()+2*PI/11), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.65*getRadius()*cos(getDirection()-2*PI/11), y+1.65*getRadius()*sin(getDirection()-2*PI/11), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.3*getRadius()*cos(getDirection()), y+2.3*getRadius()*sin(getDirection()), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.3*getRadius()*cos(getDirection()+7*PI/66), y+2.3*getRadius()*sin(getDirection()+7*PI/66), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.7*getRadius()*cos(getDirection()+6*PI/66), y+2.7*getRadius()*sin(getDirection()+6*PI/66), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+3*getRadius()*cos(getDirection()+4*PI/66), y+3*getRadius()*sin(getDirection()+4*PI/66), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.3*getRadius()*cos(getDirection()-7*PI/66), y+2.3*getRadius()*sin(getDirection()-7*PI/66), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.7*getRadius()*cos(getDirection()-6*PI/66), y+2.7*getRadius()*sin(getDirection()-6*PI/66), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+3*getRadius()*cos(getDirection()-4*PI/66), y+3*getRadius()*sin(getDirection()-4*PI/66), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.65*getRadius()*cos(getDirection()+5*PI/11), y+1.65*getRadius()*sin(getDirection()+5*PI/11), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.65*getRadius()*cos(getDirection()-5*PI/11), y+1.65*getRadius()*sin(getDirection()-5*PI/11), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.65*getRadius()*cos(getDirection()+8*PI/11), y+1.65*getRadius()*sin(getDirection()+8*PI/11), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.65*getRadius()*cos(getDirection()-8*PI/11), y+1.65*getRadius()*sin(getDirection()-8*PI/11), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.6*getRadius()*cos(getDirection()+8*PI/11), y+2.6*getRadius()*sin(getDirection()+8*PI/11), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.6*getRadius()*cos(getDirection()-8*PI/11), y+2.6*getRadius()*sin(getDirection()-8*PI/11), getRadius()/3, getDirection(), base));
    }
    if (type >= 15) {
      machinegun = 3;
      cannon = 3;
      blaster = 4;
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+15.5*PI/32), y+1.3*getRadius()*sin(getDirection()+15.5*PI/32), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()+14*PI/32), y+1.9*getRadius()*sin(getDirection()+14*PI/32), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-15.5*PI/32), y+1.3*getRadius()*sin(getDirection()-15.5*PI/32), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()-14*PI/32), y+1.9*getRadius()*sin(getDirection()-14*PI/32), getRadius()/3, getDirection(), base));
      
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()+10*PI/32), y+2.2*getRadius()*sin(getDirection()+10*PI/32), getRadius()/1.6, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()-10*PI/32), y+2.2*getRadius()*sin(getDirection()-10*PI/32), getRadius()/1.6, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()+7*PI/32), y+2.2*getRadius()*sin(getDirection()+7*PI/32), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.2*getRadius()*cos(getDirection()-7*PI/32), y+2.2*getRadius()*sin(getDirection()-7*PI/32), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+10*PI/32), y+1.4*getRadius()*sin(getDirection()+10*PI/32), getRadius()/1.3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-10*PI/32), y+1.4*getRadius()*sin(getDirection()-10*PI/32), getRadius()/1.3, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.9*getRadius()*cos(getDirection()+7*PI/32), y+2.9*getRadius()*sin(getDirection()+7*PI/32), getRadius()/1.4, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.9*getRadius()*cos(getDirection()-7*PI/32), y+2.9*getRadius()*sin(getDirection()-7*PI/32), getRadius()/1.4, getDirection(), base));

      blocks.add(new BubbleBlock(x+3.6*getRadius()*cos(getDirection()+5*PI/32), y+3.6*getRadius()*sin(getDirection()+5*PI/32), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+3.6*getRadius()*cos(getDirection()+7.5*PI/32), y+3.6*getRadius()*sin(getDirection()+7.5*PI/32), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+3*getRadius()*cos(getDirection()+8.8*PI/32), y+3*getRadius()*sin(getDirection()+8.8*PI/32), getRadius()/2.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.1*getRadius()*cos(getDirection()+3*PI/32), y+4.1*getRadius()*sin(getDirection()+3*PI/32), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.8*getRadius()*cos(getDirection()+3.5*PI/32), y+4.8*getRadius()*sin(getDirection()+3.5*PI/32), getRadius()/6, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.5*getRadius()*cos(getDirection()+1.5*PI/32), y+4.5*getRadius()*sin(getDirection()+1.5*PI/32), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.4*getRadius()*cos(getDirection()+7.6*PI/32), y+4.4*getRadius()*sin(getDirection()+7.6*PI/32), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+3.5*getRadius()*cos(getDirection()+11*PI/32), y+3.5*getRadius()*sin(getDirection()+11*PI/32), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+19*PI/32), y+2.1*getRadius()*sin(getDirection()+19*PI/32), getRadius()/1.7, getDirection(), base));
      
      blocks.add(new BubbleBlock(x+3.6*getRadius()*cos(getDirection()-5*PI/32), y+3.6*getRadius()*sin(getDirection()-5*PI/32), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+3.6*getRadius()*cos(getDirection()-7.5*PI/32), y+3.6*getRadius()*sin(getDirection()-7.5*PI/32), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+3*getRadius()*cos(getDirection()-8.8*PI/32), y+3*getRadius()*sin(getDirection()-8.8*PI/32), getRadius()/2.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.1*getRadius()*cos(getDirection()-3*PI/32), y+4.1*getRadius()*sin(getDirection()-3*PI/32), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.8*getRadius()*cos(getDirection()-3.5*PI/32), y+4.8*getRadius()*sin(getDirection()-3.5*PI/32), getRadius()/6, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.5*getRadius()*cos(getDirection()-1.5*PI/32), y+4.5*getRadius()*sin(getDirection()-1.5*PI/32), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(x+4.4*getRadius()*cos(getDirection()-7.6*PI/32), y+4.4*getRadius()*sin(getDirection()-7.6*PI/32), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(x+3.5*getRadius()*cos(getDirection()-11*PI/32), y+3.5*getRadius()*sin(getDirection()-11*PI/32), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()-19*PI/32), y+2.1*getRadius()*sin(getDirection()-19*PI/32), getRadius()/1.7, getDirection(), base));

      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
    }
  }

  public void move() {
    super.move(m);
    float distFromCenter = dist(getX(), getY(), 0, 0);
    float angle = atan2(getY(), getX());
    //Once you are at your destination, pick a new destination.
    //If enemy reaches bounds of bubble, pick a new destination.
    if (distanceSoFar >= goToDistance || distFromCenter>750-getRadius()) {
      if (distFromCenter>750-getRadius()) {
        setX((750-getRadius())*cos(angle));
        setY((750-getRadius())*sin(angle));
      }
      selectNewPath();
    }
    //Go towards your destination
    setX(getX()+cos(goToAngle)*getSpeed());
    setY(getY()+sin(goToAngle)*getSpeed());
    distanceSoFar += getSpeed();
}

  public void selectNewPath() {
    distanceSoFar = 0;
    goToAngle = goToAngle + random(4*PI/5)-2*PI/5;
    goToDistance = random(400)+50;
  }

  public String toString() {
    return distanceSoFar + " " +goToDistance;
  }

  public void spawnBubbles(ArrayList<Bubble> arr) {
    arr.add(new Bubble(getX()+random(20), getY()+random(20), getRadius()));
  }
}
