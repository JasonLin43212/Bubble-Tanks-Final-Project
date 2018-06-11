public class Stationary extends BubbleTank {

  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  int bossCoolDown;

  public Stationary(int difficulty) {
    super(3000 + difficulty*500 + bossesKilled*1000, 40, -666,0);
    bossCoolDown = 500 - difficulty*20;
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
    setDirection(tank.getX(), tank.getY());
    bossCoolDown--;
    incrementStun(-10);
    if (bossCoolDown <=0) {
      bossCoolDown = 500 - difficulty*20;
    }
    if (getStunPeriod() <=0) {
      if (bossCoolDown <500) {
        if (bossCoolDown % 30==0) {
          for (int i=0; i<4+(difficulty/2); i++) {
            allBullets.add(new BubbleBullet(10+difficulty, 5+difficulty, getRadius(), getX(), getY(), getDirection()+2*PI*i/(4+(difficulty/2)), getId()));
          }
        }
      }
      if (bossCoolDown <140) {
        if (bossCoolDown % 20==0) {
          for (int i=0; i<1+(difficulty/2); i++) {
            allBullets.add(new BubbleBullet(10+difficulty, 5+difficulty, getRadius(), getX(), getY(), getDirection()+2*PI*i/(4+(difficulty/2)), getId()));
          }
        }
        if (bossCoolDown % 40==0) {
          allBullets.add(new BubbleBullet(30+difficulty, 8+difficulty, getRadius(), getX(), getY(), getDirection(), getId()));
        }
        if (bossCoolDown % 100==0) {
          for (int i=0; i<difficulty; i++) {
            allBullets.add(new StunBullet(6, 2+difficulty*1.5, getRadius(), getX(), getY(), getDirection()+i*2*PI/difficulty, getId(), difficulty*20));
          }
        }
      }
      if ((float)getHealth()/getMaxHealth() < 0.2 && bossCoolDown%10==0) {  
        allBullets.add(new BubbleBullet(4+difficulty, 5+difficulty, getRadius(), getX(), getY(), getDirection(), getId()));
      }
      if (bossCoolDown %300 == 0 && difficulty > 3) {
        allBullets.add(new MissileBullet(40, 2+difficulty*0.1, getRadius(), getX(), getY(), getDirection(), getId()));
      }
    }
  }

  public void buildBlocks() {
    float x= getX();
    float y= getY();
    blocks.add(new BubbleBlock(x+90*cos(getDirection()+PI), y+90*sin(getDirection()+PI), 30, getDirection(), base));
    //body
    blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), 90, getDirection(), base));
    blocks.add(new BubbleBlock(x+70*cos(getDirection()), y+70*sin(getDirection()), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+100*cos(getDirection()), y+100*sin(getDirection()), 10, getDirection(), base));
    //surrounding bubbles
    for (int i=0; i<5; i++) {
      blocks.add(new BubbleBlock(x+110*cos(getDirection()+i*PI/7+3*PI/14), y+110*sin(getDirection()+i*PI/7+3*PI/14), 25, getDirection(), base)); 
      blocks.add(new BubbleBlock(x+110*cos(getDirection()-i*PI/7-3*PI/14), y+110*sin(getDirection()-i*PI/7-3*PI/14), 25, getDirection(), base));
    }
    //tail
    blocks.add(new BubbleBlock(x+130*cos(getDirection()+PI), y+130*sin(getDirection()+PI), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+150*cos(getDirection()+15*PI/16), y+150*sin(getDirection()+15*PI/16), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+150*cos(getDirection()-15*PI/16), y+150*sin(getDirection()-15*PI/16), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+170*cos(getDirection()+30*PI/32), y+170*sin(getDirection()+30*PI/32), 10, getDirection(), base));
    blocks.add(new BubbleBlock(x+170*cos(getDirection()-30*PI/32), y+170*sin(getDirection()-30*PI/32), 10, getDirection(), base));
    //extra bubbles
    blocks.add(new BubbleBlock(x+110*cos(getDirection()+4*PI/32), y+110*sin(getDirection()+4*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+110*cos(getDirection()-4*PI/32), y+110*sin(getDirection()-4*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+133*cos(getDirection()+7*PI/32), y+133*sin(getDirection()+7*PI/32), 20, getDirection(), base));
    blocks.add(new BubbleBlock(x+133*cos(getDirection()-7*PI/32), y+133*sin(getDirection()-7*PI/32), 20, getDirection(), base));
    blocks.add(new BubbleBlock(x+133*cos(getDirection()+PI/2), y+133*sin(getDirection()+PI/2), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+133*cos(getDirection()-PI/2), y+133*sin(getDirection()-PI/2), 15, getDirection(), base));
    //antenna
    blocks.add(new BubbleBlock(x+133*cos(getDirection()+7*PI/32), y+133*sin(getDirection()+7*PI/32), 12, getDirection(), internal));
    blocks.add(new BubbleBlock(x+133*cos(getDirection()-7*PI/32), y+133*sin(getDirection()-7*PI/32), 12, getDirection(), internal));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()+8*PI/32), y+142*sin(getDirection()+8*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()-8*PI/32), y+142*sin(getDirection()-8*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()+6*PI/32), y+142*sin(getDirection()+6*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+142*cos(getDirection()-6*PI/32), y+142*sin(getDirection()-6*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+155*cos(getDirection()+8*PI/32), y+155*sin(getDirection()+8*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+155*cos(getDirection()-8*PI/32), y+155*sin(getDirection()-8*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+155*cos(getDirection()+6*PI/32), y+155*sin(getDirection()+6*PI/32), 7, getDirection(), internal));
    blocks.add(new BubbleBlock(x+155*cos(getDirection()-6*PI/32), y+155*sin(getDirection()-6*PI/32), 7, getDirection(), internal));
    //internal
    blocks.add(new BubbleBlock(x+40*cos(getDirection()+6*PI/32), y+40*sin(getDirection()+6*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+40*cos(getDirection()-6*PI/32), y+40*sin(getDirection()-6*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+28*cos(getDirection()+2*PI/3), y+28*sin(getDirection()+2*PI/3), 10, getDirection(), internal));
    blocks.add(new BubbleBlock(x+28*cos(getDirection()-2*PI/3), y+28*sin(getDirection()-2*PI/3), 10, getDirection(), internal));
    blocks.add(new BubbleBlock(x+40*cos(getDirection()+26*PI/32), y+40*sin(getDirection()+26*PI/32), 10, getDirection(), internal));
    blocks.add(new BubbleBlock(x+40*cos(getDirection()-26*PI/32), y+40*sin(getDirection()-26*PI/32), 10, getDirection(), internal));
    blocks.add(new BubbleBlock(x+51*cos(getDirection()+29*PI/32), y+51*sin(getDirection()+29*PI/32), 10, getDirection(), internal));
    blocks.add(new BubbleBlock(x+51*cos(getDirection()-29*PI/32), y+51*sin(getDirection()-29*PI/32), 10, getDirection(), internal));
    blocks.add(new BubbleBlock(x+3*cos(getDirection()), y+3*sin(getDirection()), 25, getDirection(), internal));
    blocks.add(new BubbleBlock(x+65*cos(getDirection()+PI), y+65*sin(getDirection()+PI), 20, getDirection(), internal));
  }

  public void spawnBubbles(ArrayList<Bubble> arr) {
    arr.add(new Bubble(getX()+random(20), getY()+random(20), getRadius()*20));
  }
}
