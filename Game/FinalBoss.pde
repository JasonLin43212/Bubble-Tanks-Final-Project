public class FinalBoss extends BubbleTank {

  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  int bossCoolDown;
  boolean shielded;
  boolean preventMovement;
  public FinalBoss(int difficulty) {
    super(8000 + difficulty*1000 + bossesKilled*2000, 150, -109, difficulty);
    bossCoolDown = 1000 - difficulty*20;
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
    setDirection(tank.getX(), tank.getY());
    float angle = 2*PI*((float)bossCoolDown/(1000 - difficulty*20));
    setX((800-getRadius())*cos(angle));
    setY((800-getRadius())*sin(angle));
    incrementStun(-2);
    float percentage = getHealth()/getMaxHealth();
    if (getStunPeriod() <=0) {
      bossCoolDown--;
      if (bossCoolDown <=0) {
        bossCoolDown = 1000 - difficulty*20;
      }
      if (bossCoolDown%20==0) {
        allBullets.add(new BubbleBullet(10+difficulty*1.5, difficulty+10, getRadius(), getX(), getY(), getDirection(), getId()));
      }
      if (bossCoolDown % 30==0) {
        allBullets.add(new BubbleBullet(20+difficulty*1.7, difficulty+2, getRadius(), getX(), getY(), getDirection(), getId()));
      }
      if (bossCoolDown % 40==0) {
        allBullets.add(new StunBullet(13+difficulty, difficulty+7, getRadius(), getX(), getY(), getDirection(), getId(), difficulty*3));
      }
      if (bossCoolDown % 50==0) {
        allBullets.add(new MissileBullet(11+difficulty, difficulty+3, getRadius(), getX(), getY(), getDirection(), getId()));
      }
      if (percentage < 0.75) {
        if (bossCoolDown % 40==0) {
          allBullets.add(new MissileBullet(7+difficulty/2, difficulty+4, getRadius(), getX(), getY(), getDirection(), getId()));
        }
        if (bossCoolDown % 500==0) {
          allBullets.add(new MissileBullet(110+difficulty, difficulty+10, getRadius(), getX(), getY(), getDirection(), getId()));
        }
      }
      if (percentage < 0.5){
        if (bossCoolDown % 800==0){
         allBullets.add(new SuperBullet(30+difficulty, 10-difficulty, getRadius(), getX(), getY(), getDirection(), getId(),1));
        }
      }
    }
  }

  public void buildBlocks() {
    float x = getX();
    float y = getY();
    color yellow = color(253, 243, 0);
    //rightside
    blocks.add(new BubbleBlock(x+65*cos(getDirection()+28*PI/32), y+65*sin(getDirection()+28*PI/32), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+75*cos(getDirection()+27*PI/32), y+75*sin(getDirection()+27*PI/32), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+127*cos(getDirection()+13*PI/32), y+127*sin(getDirection()+13*PI/32), 35, getDirection(), base));
    blocks.add(new BubbleBlock(x+127*cos(getDirection()+9*PI/32), y+127*sin(getDirection()+9*PI/32), 35, getDirection(), base));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()+11*PI/32), y+115*sin(getDirection()+11*PI/32), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+50*cos(getDirection()+13*PI/32), y+50*sin(getDirection()+13*PI/32), 58, getDirection(), base));
    blocks.add(new BubbleBlock(x+176*cos(getDirection()+11*PI/32), y+176*sin(getDirection()+11*PI/32), 42, getDirection(), base));
    blocks.add(new BubbleBlock(x+218*cos(getDirection()+11*PI/32), y+218*sin(getDirection()+11*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+213*cos(getDirection()+12.5*PI/32), y+213*sin(getDirection()+12.5*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+195*cos(getDirection()+13.7*PI/32), y+195*sin(getDirection()+13.7*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+218*cos(getDirection()+9*PI/32), y+218*sin(getDirection()+9*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+188*cos(getDirection()+7.9*PI/32), y+188*sin(getDirection()+7.9*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+216*cos(getDirection()+14.8*PI/32), y+216*sin(getDirection()+14.8*PI/32), 23, getDirection(), base));
    blocks.add(new BubbleBlock(x+242*cos(getDirection()+15.6*PI/32), y+242*sin(getDirection()+15.6*PI/32), 13, getDirection(), base));
    blocks.add(new BubbleBlock(x+220*cos(getDirection()+15*PI/32), y+220*sin(getDirection()+15*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+236*cos(getDirection()+15.4*PI/32), y+236*sin(getDirection()+15.4*PI/32), 8, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+238*cos(getDirection()+12.8*PI/32), y+238*sin(getDirection()+12.8*PI/32), 23, getDirection(), base));
    blocks.add(new BubbleBlock(x+263*cos(getDirection()+13*PI/32), y+263*sin(getDirection()+13*PI/32), 13, getDirection(), base));
    blocks.add(new BubbleBlock(x+238*cos(getDirection()+12.8*PI/32), y+238*sin(getDirection()+12.8*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+258*cos(getDirection()+13*PI/32), y+258*sin(getDirection()+13*PI/32), 8, getDirection(), yellow));

    blocks.add(new BubbleBlock(x+223*cos(getDirection()+7.3*PI/32), y+223*sin(getDirection()+7.3*PI/32), 26, getDirection(), base));
    blocks.add(new BubbleBlock(x+218*cos(getDirection()+5.8*PI/32), y+218*sin(getDirection()+5.8*PI/32), 30, getDirection(), base));

    blocks.add(new BubbleBlock(x+218*cos(getDirection()+6.2*PI/32), y+218*sin(getDirection()+6.2*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+224*cos(getDirection()+5.3*PI/32), y+224*sin(getDirection()+5.3*PI/32), 8, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+245*cos(getDirection()+5.3*PI/32), y+245*sin(getDirection()+5.3*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+215*cos(getDirection()+4.6*PI/32), y+215*sin(getDirection()+4.6*PI/32), 11, getDirection(), base));

    blocks.add(new BubbleBlock(x+295*cos(getDirection()+10*PI/32), y+295*sin(getDirection()+10*PI/32), 26, getDirection(), base));
    blocks.add(new BubbleBlock(x+295*cos(getDirection()+9.1*PI/32), y+295*sin(getDirection()+9.1*PI/32), 12, getDirection(), base));
    blocks.add(new BubbleBlock(x+295*cos(getDirection()+10*PI/32), y+295*sin(getDirection()+10*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+295*cos(getDirection()+9.4*PI/32), y+295*sin(getDirection()+9.4*PI/32), 8, getDirection(), yellow));

    //left side
    blocks.add(new BubbleBlock(x+65*cos(getDirection()-28*PI/32), y+65*sin(getDirection()-28*PI/32), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+75*cos(getDirection()-27*PI/32), y+75*sin(getDirection()-27*PI/32), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+127*cos(getDirection()-13*PI/32), y+127*sin(getDirection()-13*PI/32), 35, getDirection(), base));
    blocks.add(new BubbleBlock(x+127*cos(getDirection()-9*PI/32), y+127*sin(getDirection()-9*PI/32), 35, getDirection(), base));
    blocks.add(new BubbleBlock(x+115*cos(getDirection()-11*PI/32), y+115*sin(getDirection()-11*PI/32), 30, getDirection(), base));
    blocks.add(new BubbleBlock(x+50*cos(getDirection()-13*PI/32), y+50*sin(getDirection()-13*PI/32), 58, getDirection(), base));
    blocks.add(new BubbleBlock(x+176*cos(getDirection()-11*PI/32), y+176*sin(getDirection()-11*PI/32), 42, getDirection(), base));
    blocks.add(new BubbleBlock(x+218*cos(getDirection()-11*PI/32), y+218*sin(getDirection()-11*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+213*cos(getDirection()-12.5*PI/32), y+213*sin(getDirection()-12.5*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+195*cos(getDirection()-13.7*PI/32), y+195*sin(getDirection()-13.7*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+218*cos(getDirection()-9*PI/32), y+218*sin(getDirection()-9*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+188*cos(getDirection()-7.9*PI/32), y+188*sin(getDirection()-7.9*PI/32), 15, getDirection(), base));
    blocks.add(new BubbleBlock(x+216*cos(getDirection()-14.8*PI/32), y+216*sin(getDirection()-14.8*PI/32), 23, getDirection(), base));
    blocks.add(new BubbleBlock(x+242*cos(getDirection()-15.6*PI/32), y+242*sin(getDirection()-15.6*PI/32), 13, getDirection(), base));
    blocks.add(new BubbleBlock(x+220*cos(getDirection()-15*PI/32), y+220*sin(getDirection()-15*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+236*cos(getDirection()-15.4*PI/32), y+236*sin(getDirection()-15.4*PI/32), 8, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+238*cos(getDirection()-12.8*PI/32), y+238*sin(getDirection()-12.8*PI/32), 23, getDirection(), base));
    blocks.add(new BubbleBlock(x+263*cos(getDirection()-13*PI/32), y+263*sin(getDirection()-13*PI/32), 13, getDirection(), base));
    blocks.add(new BubbleBlock(x+238*cos(getDirection()-12.8*PI/32), y+238*sin(getDirection()-12.8*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+258*cos(getDirection()-13*PI/32), y+258*sin(getDirection()-13*PI/32), 8, getDirection(), yellow));

    blocks.add(new BubbleBlock(x+223*cos(getDirection()-7.3*PI/32), y+223*sin(getDirection()-7.3*PI/32), 26, getDirection(), base));
    blocks.add(new BubbleBlock(x+218*cos(getDirection()-5.8*PI/32), y+218*sin(getDirection()-5.8*PI/32), 30, getDirection(), base));

    blocks.add(new BubbleBlock(x+218*cos(getDirection()-6.2*PI/32), y+218*sin(getDirection()-6.2*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+224*cos(getDirection()-5.3*PI/32), y+224*sin(getDirection()-5.3*PI/32), 8, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+245*cos(getDirection()-5.3*PI/32), y+245*sin(getDirection()-5.3*PI/32), 11, getDirection(), base));
    blocks.add(new BubbleBlock(x+215*cos(getDirection()-4.6*PI/32), y+215*sin(getDirection()-4.6*PI/32), 11, getDirection(), base));

    blocks.add(new BubbleBlock(x+295*cos(getDirection()-10*PI/32), y+295*sin(getDirection()-10*PI/32), 26, getDirection(), base));
    blocks.add(new BubbleBlock(x+295*cos(getDirection()-9.1*PI/32), y+295*sin(getDirection()-9.1*PI/32), 12, getDirection(), base));
    blocks.add(new BubbleBlock(x+295*cos(getDirection()-10*PI/32), y+295*sin(getDirection()-10*PI/32), 13, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+295*cos(getDirection()-9.4*PI/32), y+295*sin(getDirection()-9.4*PI/32), 8, getDirection(), yellow));

    blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), 60, getDirection(), base));
    blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), 29, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+34*cos(getDirection()+PI), y+34*sin(getDirection()+PI), 10, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+47*cos(getDirection()+PI), y+47*sin(getDirection()+PI), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+67*cos(getDirection()), y+67*sin(getDirection()), 15, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+84*cos(getDirection()), y+84*sin(getDirection()), 10, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+88*cos(getDirection()+PI/32), y+88*sin(getDirection()+PI/32), 6, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+88*cos(getDirection()-PI/32), y+88*sin(getDirection()-PI/32), 6, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+99*cos(getDirection()), y+99*sin(getDirection()), 11, getDirection(), yellow));

    //left side
    blocks.add(new BubbleBlock(x+47*cos(getDirection()-27*PI/32), y+47*sin(getDirection()-27*PI/32), 10, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+47*cos(getDirection()-23*PI/32), y+47*sin(getDirection()-23*PI/32), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+79*cos(getDirection()-27*PI/32), y+79*sin(getDirection()-27*PI/32), 14, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+83*cos(getDirection()-24*PI/32), y+83*sin(getDirection()-24*PI/32), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+70*cos(getDirection()-24*PI/32), y+70*sin(getDirection()-24*PI/32), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+34*cos(getDirection()-8*PI/32), y+34*sin(getDirection()-8*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+42*cos(getDirection()-5*PI/32), y+42*sin(getDirection()-5*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+50*cos(getDirection()-3*PI/32), y+50*sin(getDirection()-3*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+70*cos(getDirection()-3.8*PI/32), y+70*sin(getDirection()-3.8*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+80*cos(getDirection()-5.3*PI/32), y+80*sin(getDirection()-5.3*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+93*cos(getDirection()-6.2*PI/32), y+93*sin(getDirection()-6.2*PI/32), 9, getDirection(), yellow));
    //right side

    blocks.add(new BubbleBlock(x+47*cos(getDirection()+27*PI/32), y+47*sin(getDirection()+27*PI/32), 10, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+47*cos(getDirection()+23*PI/32), y+47*sin(getDirection()+23*PI/32), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+79*cos(getDirection()+27*PI/32), y+79*sin(getDirection()+27*PI/32), 14, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+83*cos(getDirection()+24*PI/32), y+83*sin(getDirection()+24*PI/32), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+70*cos(getDirection()+24*PI/32), y+70*sin(getDirection()+24*PI/32), 7, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+34*cos(getDirection()+8*PI/32), y+34*sin(getDirection()+8*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+42*cos(getDirection()+5*PI/32), y+42*sin(getDirection()+5*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+50*cos(getDirection()+3*PI/32), y+50*sin(getDirection()+3*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+70*cos(getDirection()+3.8*PI/32), y+70*sin(getDirection()+3.8*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+80*cos(getDirection()+5.3*PI/32), y+80*sin(getDirection()+5.3*PI/32), 9, getDirection(), yellow));
    blocks.add(new BubbleBlock(x+93*cos(getDirection()+6.2*PI/32), y+93*sin(getDirection()+6.2*PI/32), 9, getDirection(), yellow));
  }

  public void spawnBubbles(ArrayList<Bubble> arr) {
    arr.add(new Bubble(getX()+random(20), getY()+random(20), getRadius()*20));
  }
}
