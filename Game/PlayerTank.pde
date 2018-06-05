public class PlayerTank extends BubbleTank {
  private int type;
  color base = color(20, 54, 129);
  color internal = color(214,149,9);

  public PlayerTank(float health, float radius, int id, float speed, int numBullets, int type) {
    super(health, radius, id, speed, numBullets);
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
      blocks.add(new BubbleBlock(350+getRadius()*cos(getDirection()),350+getRadius()*sin(getDirection()),5,getDirection(),internal));
    }
    //Type 1
    if (type == 1){
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+getRadius()*cos(getDirection()),350+getRadius()*sin(getDirection()),getRadius()/5,getDirection(),internal));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+2*PI/3),350+1.5*getRadius()*sin(getDirection()+2*PI/3),getRadius()/2,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-2*PI/3),350+1.5*getRadius()*sin(getDirection()-2*PI/3),getRadius()/2,getDirection(),base));
    }
    //Type 2
    if (type == 2){
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI),350+1.2*getRadius()*sin(getDirection()+PI),getRadius()/4,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.6*getRadius()*cos(getDirection()+PI),350+1.6*getRadius()*sin(getDirection()+PI),getRadius()/3,getDirection(),base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+getRadius()*cos(getDirection()),350+getRadius()*sin(getDirection()),getRadius()/5,getDirection(),internal));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+2*PI/3),350+1.5*getRadius()*sin(getDirection()+2*PI/3),getRadius()/2,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-2*PI/3),350+1.5*getRadius()*sin(getDirection()-2*PI/3),getRadius()/2,getDirection(),base));
    }
    //Type 3
    if (type == 3){
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI),350+1.2*getRadius()*sin(getDirection()+PI),getRadius()/4,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.6*getRadius()*cos(getDirection()+PI),350+1.6*getRadius()*sin(getDirection()+PI),getRadius()/3,getDirection(),base));
      blocks.add(new BubbleBlock(350, 350, getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(350+getRadius()*cos(getDirection()),350+getRadius()*sin(getDirection()),getRadius()/5,getDirection(),internal));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+2*PI/3),350+1.3*getRadius()*sin(getDirection()+2*PI/3),getRadius()/3,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()-2*PI/3),350+1.3*getRadius()*sin(getDirection()-2*PI/3),getRadius()/3,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()+PI/5),350+1.2*getRadius()*sin(getDirection()+PI/5),getRadius()/5,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.2*getRadius()*cos(getDirection()-PI/5),350+1.2*getRadius()*sin(getDirection()-PI/5),getRadius()/5,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()+PI/6),350+1.5*getRadius()*sin(getDirection()+PI/6),getRadius()/5,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.5*getRadius()*cos(getDirection()-PI/6),350+1.5*getRadius()*sin(getDirection()-PI/6),getRadius()/5,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.8*getRadius()*cos(getDirection()+PI/9),350+1.8*getRadius()*sin(getDirection()+PI/9),getRadius()/5,getDirection(),base));
      blocks.add(new BubbleBlock(350+1.8*getRadius()*cos(getDirection()-PI/9),350+1.8*getRadius()*sin(getDirection()-PI/9),getRadius()/5,getDirection(),base));
    }
}
}
