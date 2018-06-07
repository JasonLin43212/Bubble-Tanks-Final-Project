public class PlayerTank extends BubbleTank {
  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);

  public PlayerTank(float health, float radius, int id, float speed, int type,float coolDown) {
    super(health, radius, id, speed, coolDown);
    this.type = type;
  }

  public void display() {
    super.display();   
    buildBlocks();
    for (int i=0; i<blocks.size(); i++) {
      blocks.get(i).display();
    }
  }

  // creates the tank depending on what type it is
  public void buildBlocks() {
    blocks.clear();
    //Type 0
    if (type == 0) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
    }
    //Type 1
    if (type == 1) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+2*PI/3), 350+1.5*getRadius()*sin(getDirection()+2*PI/3), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-2*PI/3), 350+1.5*getRadius()*sin(getDirection()-2*PI/3), getRadius()/2, getDirection(), base));
    }
    //Type 2
    if (type == 2) {
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI), 350+1.2*getRadius()*sin(getDirection()+PI), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.6*getRadius()*cos(getDirection()+PI), 350+1.6*getRadius()*sin(getDirection()+PI), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+2*PI/3), 350+1.5*getRadius()*sin(getDirection()+2*PI/3), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-2*PI/3), 350+1.5*getRadius()*sin(getDirection()-2*PI/3), getRadius()/2, getDirection(), base));
    }
    //Type 3
    if (type == 3) {
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI), 350+1.2*getRadius()*sin(getDirection()+PI), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.6*getRadius()*cos(getDirection()+PI), 350+1.6*getRadius()*sin(getDirection()+PI), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+2*PI/3), 350+1.3*getRadius()*sin(getDirection()+2*PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()-2*PI/3), 350+1.3*getRadius()*sin(getDirection()-2*PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI/5), 350+1.2*getRadius()*sin(getDirection()+PI/5), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()-PI/5), 350+1.2*getRadius()*sin(getDirection()-PI/5), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+PI/6), 350+1.5*getRadius()*sin(getDirection()+PI/6), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-PI/6), 350+1.5*getRadius()*sin(getDirection()-PI/6), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.8*getRadius()*cos(getDirection()+PI/9), 350+1.8*getRadius()*sin(getDirection()+PI/9), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.8*getRadius()*cos(getDirection()-PI/9), 350+1.8*getRadius()*sin(getDirection()-PI/9), getRadius()/5, getDirection(), base));
    }
    //Type 4
    if (type == 4) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      for (int i=0; i<6; i++) {
        blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+i*PI/3+PI/6), 350+1.2*getRadius()*sin(getDirection()+i*PI/3+PI/6), getRadius()/4.5, getDirection(), base)); 
        blocks.add(new BubbleBlock(350+1.6*getRadius()*cos(getDirection()+i*PI/3+PI/6), 350+1.6*getRadius()*sin(getDirection()+i*PI/3+PI/6), getRadius()/4.5, getDirection(), base));
      }
    }

    //Type 5
    if (type == 5) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      for (int i=0; i<8; i++) {
        blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+i*PI/4+PI/8), 350+1.2*getRadius()*sin(getDirection()+i*PI/4+PI/8), getRadius()/5, getDirection(), base)); 
        blocks.add(new BubbleBlock(350+1.6*getRadius()*cos(getDirection()+i*PI/4+PI/8), 350+1.6*getRadius()*sin(getDirection()+i*PI/4+PI/8), getRadius()/5, getDirection(), base));
        if (i%2==0) {
          blocks.add(new BubbleBlock(350+1.9*getRadius()*cos(getDirection()+i*PI/4+PI/16), 350+1.9*getRadius()*sin(getDirection()+i*PI/4+PI/16), getRadius()/5, getDirection(), base));
        } else {
          blocks.add(new BubbleBlock(350+1.9*getRadius()*cos(getDirection()+i*PI/4+3*PI/16), 350+1.9*getRadius()*sin(getDirection()+i*PI/4+3*PI/16), getRadius()/5, getDirection(), base));
        }
      }
    }
    //Type 6
    if (type == 6) {
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI), 350+1.4*getRadius()*sin(getDirection()+PI), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.9*getRadius()*cos(getDirection()+PI), 350+1.9*getRadius()*sin(getDirection()+PI), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.3*getRadius()*cos(getDirection()+PI), 350+2.3*getRadius()*sin(getDirection()+PI), getRadius()/7, getDirection(), base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+3*PI/4), 350+1.4*getRadius()*sin(getDirection()+3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-3*PI/4), 350+1.4*getRadius()*sin(getDirection()-3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/2), 350+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/2), 350+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/2.6), 350+2*getRadius()*sin(getDirection()+PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/2.6), 350+2*getRadius()*sin(getDirection()-PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/4), 350+2*getRadius()*sin(getDirection()+PI/4), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/4), 350+2*getRadius()*sin(getDirection()-PI/4), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/6), 350+2*getRadius()*sin(getDirection()+PI/6), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/6), 350+2*getRadius()*sin(getDirection()-PI/6), getRadius()/3, getDirection(), base));
    }
    //Type 7
    if (type == 7) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+3*PI/4), 350+1.4*getRadius()*sin(getDirection()+3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-3*PI/4), 350+1.4*getRadius()*sin(getDirection()-3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/2), 350+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/2), 350+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/2.6), 350+2*getRadius()*sin(getDirection()+PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/2.6), 350+2*getRadius()*sin(getDirection()-PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()+PI/3.5), 350+2.2*getRadius()*sin(getDirection()+PI/3.5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()-PI/3.5), 350+2.2*getRadius()*sin(getDirection()-PI/3.5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()+PI/5), 350+2.4*getRadius()*sin(getDirection()+PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()-PI/5), 350+2.4*getRadius()*sin(getDirection()-PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()+4*PI/5), 350+2.4*getRadius()*sin(getDirection()+4*PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()-4*PI/5), 350+2.4*getRadius()*sin(getDirection()-4*PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.7*getRadius()*cos(getDirection()+6*PI/7), 350+2.7*getRadius()*sin(getDirection()+6*PI/7), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.7*getRadius()*cos(getDirection()-6*PI/7), 350+2.7*getRadius()*sin(getDirection()-6*PI/7), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.9*getRadius()*cos(getDirection()+7*PI/9), 350+2.9*getRadius()*sin(getDirection()+7*PI/9), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.9*getRadius()*cos(getDirection()-7*PI/9), 350+2.9*getRadius()*sin(getDirection()-7*PI/9), getRadius()/5, getDirection(), base));
    }
    //Type 8
    if (type == 8) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+3*PI/4), 350+1.4*getRadius()*sin(getDirection()+3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-3*PI/4), 350+1.4*getRadius()*sin(getDirection()-3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/2), 350+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/2), 350+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/2.6), 350+2*getRadius()*sin(getDirection()+PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/2.6), 350+2*getRadius()*sin(getDirection()-PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()+PI/3.5), 350+2.2*getRadius()*sin(getDirection()+PI/3.5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()-PI/3.5), 350+2.2*getRadius()*sin(getDirection()-PI/3.5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()+PI/5), 350+2.4*getRadius()*sin(getDirection()+PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()-PI/5), 350+2.4*getRadius()*sin(getDirection()-PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.1*getRadius()*cos(getDirection()+4*PI/5), 350+2.1*getRadius()*sin(getDirection()+4*PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.1*getRadius()*cos(getDirection()-4*PI/5), 350+2.1*getRadius()*sin(getDirection()-4*PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()+6*PI/7), 350+2.2*getRadius()*sin(getDirection()+6*PI/7), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()-6*PI/7), 350+2.2*getRadius()*sin(getDirection()-6*PI/7), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.5*getRadius()*cos(getDirection()+7*PI/9), 350+2.5*getRadius()*sin(getDirection()+7*PI/9), getRadius()/5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.5*getRadius()*cos(getDirection()-7*PI/9), 350+2.5*getRadius()*sin(getDirection()-7*PI/9), getRadius()/5, getDirection(), base));
    }
    //Type 9
    if (type == 9) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.7*getRadius()*cos(getDirection()), 350+1.7*getRadius()*sin(getDirection()), getRadius()/1.2, getDirection(), base));
      for (int i=0; i<4; i++) {
        blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+i*PI/2+PI/4), 350+1.3*getRadius()*sin(getDirection()+i*PI/2+PI/4), getRadius()/3, getDirection(), base)); 
        blocks.add(new BubbleBlock(350+1.8*getRadius()*cos(getDirection()+i*PI/2+PI/4), 350+1.8*getRadius()*sin(getDirection()+i*PI/2+PI/4), getRadius()/3, getDirection(), base));
      }
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/13), 350+2*getRadius()*sin(getDirection()+PI/13), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/13), 350+2*getRadius()*sin(getDirection()-PI/13), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI/26), 350+1.2*getRadius()*sin(getDirection()+PI/26), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()-PI/26), 350+1.2*getRadius()*sin(getDirection()-PI/26), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/10), 350+1.4*getRadius()*sin(getDirection()+PI/10), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/10), 350+1.4*getRadius()*sin(getDirection()-PI/10), getRadius()/8, getDirection(), internal));
    }
    //Type 10
    if (type == 10) {
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+4*PI/5), 350+1.3*getRadius()*sin(getDirection()+4*PI/5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()-4*PI/5), 350+1.3*getRadius()*sin(getDirection()-4*PI/5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.9*getRadius()*cos(getDirection()+5*PI/6), 350+1.9*getRadius()*sin(getDirection()+5*PI/6), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.9*getRadius()*cos(getDirection()-5*PI/6), 350+1.9*getRadius()*sin(getDirection()-5*PI/6), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.6*getRadius()*cos(getDirection()+6*PI/7), 350+2.6*getRadius()*sin(getDirection()+6*PI/7), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.6*getRadius()*cos(getDirection()-6*PI/7), 350+2.6*getRadius()*sin(getDirection()-6*PI/7), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+3*PI/4), 350+1.4*getRadius()*sin(getDirection()+3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-3*PI/4), 350+1.4*getRadius()*sin(getDirection()-3*PI/4), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/2), 350+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/2), 350+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/2.6), 350+2*getRadius()*sin(getDirection()+PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/2.6), 350+2*getRadius()*sin(getDirection()-PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()+PI/3.5), 350+2.2*getRadius()*sin(getDirection()+PI/3.5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()-PI/3.5), 350+2.2*getRadius()*sin(getDirection()-PI/3.5), getRadius()/2.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.5*getRadius()*cos(getDirection()+PI/5), 350+2.5*getRadius()*sin(getDirection()+PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.5*getRadius()*cos(getDirection()-PI/5), 350+2.5*getRadius()*sin(getDirection()-PI/5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+PI/4.5), 350+1.3*getRadius()*sin(getDirection()+PI/4.5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()-PI/4.5), 350+1.3*getRadius()*sin(getDirection()-PI/4.5), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()), 350+1.3*getRadius()*sin(getDirection()), getRadius()/1.5, getDirection(), base));
    }
    //Type 11
    if (type == 11) {
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+PI), 350+1.3*getRadius()*sin(getDirection()+PI), getRadius()/1.2, getDirection(), base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()), 350+1.3*getRadius()*sin(getDirection()), getRadius()/1.5, getDirection(), base));

      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()+6*PI/7), 350+2*getRadius()*sin(getDirection()+6*PI/7), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()-6*PI/7), 350+2*getRadius()*sin(getDirection()-6*PI/7), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.6*getRadius()*cos(getDirection()+5*PI/6), 350+2.6*getRadius()*sin(getDirection()+5*PI/6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.6*getRadius()*cos(getDirection()-5*PI/6), 350+2.6*getRadius()*sin(getDirection()-5*PI/6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.1*getRadius()*cos(getDirection()+6*PI/7), 350+3.1*getRadius()*sin(getDirection()+6*PI/7), getRadius()/2.8, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.1*getRadius()*cos(getDirection()-6*PI/7), 350+3.1*getRadius()*sin(getDirection()-6*PI/7), getRadius()/2.8, getDirection(), base));

      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/2), 350+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/2), 350+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()+PI/2.1), 350+2.4*getRadius()*sin(getDirection()+PI/2.1), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()-PI/2.1), 350+2.4*getRadius()*sin(getDirection()-PI/2.1), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.8*getRadius()*cos(getDirection()+PI/2.6), 350+2.8*getRadius()*sin(getDirection()+PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.8*getRadius()*cos(getDirection()-PI/2.6), 350+2.8*getRadius()*sin(getDirection()-PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.2*getRadius()*cos(getDirection()+PI/3), 350+3.2*getRadius()*sin(getDirection()+PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.2*getRadius()*cos(getDirection()-PI/3), 350+3.2*getRadius()*sin(getDirection()-PI/3), getRadius()/3, getDirection(), base));
    }
    //Type 12
    if (type == 12) {
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()), 350+2*getRadius()*sin(getDirection()), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+PI/4), 350+2*getRadius()*sin(getDirection()+PI/4), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+PI/2), 350+2*getRadius()*sin(getDirection()+PI/2), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+3*PI/4), 350+2*getRadius()*sin(getDirection()+3*PI/4), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+PI), 350+2*getRadius()*sin(getDirection()+PI), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+5*PI/4), 350+2*getRadius()*sin(getDirection()+5*PI/4), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+3*PI/2), 350+2*getRadius()*sin(getDirection()+3*PI/2), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+4*getRadius()*cos(getDirection()+7*PI/4), 350+2*getRadius()*sin(getDirection()+7*PI/4), getRadius()/10, getDirection(), internal));
      
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()), 350+4*getRadius()*sin(getDirection()), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/4), 350+4*getRadius()*sin(getDirection()+PI/4), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/2), 350+4*getRadius()*sin(getDirection()+PI/2), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+3*PI/4), 350+4*getRadius()*sin(getDirection()+3*PI/4), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI), 350+4*getRadius()*sin(getDirection()+PI), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+5*PI/4), 350+4*getRadius()*sin(getDirection()+5*PI/4), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+3*PI/2), 350+4*getRadius()*sin(getDirection()+3*PI/2), getRadius()/10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+7*PI/4), 350+4*getRadius()*sin(getDirection()+7*PI/4), getRadius()/10, getDirection(), internal));
      
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.8*getRadius()*cos(getDirection()), 350+1.8*getRadius()*sin(getDirection()), getRadius()/2, getDirection(), internal));

      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+PI), 350+1.3*getRadius()*sin(getDirection()+PI), getRadius()/1.2, getDirection(), base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()), 350+1.3*getRadius()*sin(getDirection()), getRadius()/1.5, getDirection(), base));

      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()+6*PI/7), 350+2*getRadius()*sin(getDirection()+6*PI/7), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.2*getRadius()*cos(getDirection()-6*PI/7), 350+2*getRadius()*sin(getDirection()-6*PI/7), getRadius()/1.8, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.6*getRadius()*cos(getDirection()+5*PI/6), 350+2.6*getRadius()*sin(getDirection()+5*PI/6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.6*getRadius()*cos(getDirection()-5*PI/6), 350+2.6*getRadius()*sin(getDirection()-5*PI/6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.1*getRadius()*cos(getDirection()+6*PI/7), 350+3.1*getRadius()*sin(getDirection()+6*PI/7), getRadius()/2.8, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.1*getRadius()*cos(getDirection()-6*PI/7), 350+3.1*getRadius()*sin(getDirection()-6*PI/7), getRadius()/2.8, getDirection(), base));

      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()+PI/2), 350+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+1.4*getRadius()*cos(getDirection()-PI/2), 350+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/1.5, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()+PI/2.1), 350+2.4*getRadius()*sin(getDirection()+PI/2.1), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()-PI/2.1), 350+2.4*getRadius()*sin(getDirection()-PI/2.1), getRadius()/1.7, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.8*getRadius()*cos(getDirection()+PI/2.6), 350+2.8*getRadius()*sin(getDirection()+PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+2.8*getRadius()*cos(getDirection()-PI/2.6), 350+2.8*getRadius()*sin(getDirection()-PI/2.6), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.2*getRadius()*cos(getDirection()+PI/3), 350+3.2*getRadius()*sin(getDirection()+PI/3), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(350+3.2*getRadius()*cos(getDirection()-PI/3), 350+3.2*getRadius()*sin(getDirection()-PI/3), getRadius()/3, getDirection(), base));
      
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()+PI/10), 350+2*getRadius()*sin(getDirection()+PI/10), getRadius()/5, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2*getRadius()*cos(getDirection()-PI/10), 350+2*getRadius()*sin(getDirection()-PI/10), getRadius()/5, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()+PI/10), 350+2.4*getRadius()*sin(getDirection()+PI/10), getRadius()/5, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()-PI/10), 350+2.4*getRadius()*sin(getDirection()-PI/10), getRadius()/5, getDirection(), internal));
      blocks.add(new BubbleBlock(350+2.4*getRadius()*cos(getDirection()), 350+2.4*getRadius()*sin(getDirection()), getRadius()/5, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+PI/20), 350+1.5*getRadius()*sin(getDirection()+PI/20), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-PI/20), 350+1.5*getRadius()*sin(getDirection()-PI/20), getRadius()/8, getDirection(), internal));
      blocks.add(new BubbleBlock(350+1*getRadius()*cos(getDirection()), 350+1*getRadius()*sin(getDirection()), getRadius()/4.5, getDirection(), internal));
    }
  }
}
