public class EnemyTank extends BubbleTank{

  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  
  public EnemyTank(float health, float radius, int id, float speed, int type) {
    super(health, radius, id, speed);
    this.type = type;
  }
  
   public void display() {
    super.display();   
    buildBlocks();
    for (int i=0; i<blocks.size(); i++) {
      blocks.get(i).display();
    }
  }
  
  public void buildBlocks(){
     blocks.clear();
     if (type == 0){
       blocks.add(new BubbleBlock(350+cos(getDirection()), 350+sin(getDirection()), getRadius(), getDirection(), base));
       blocks.add(new BubbleBlock(350+getRadius()*cos(getDirection()), 350+getRadius()*sin(getDirection()), getRadius()/4, getDirection(), base));
       blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()+2*PI/3), 350+1.3*getRadius()*sin(getDirection()+2*PI/3), 5*getRadius()/8, getDirection(), base));
       blocks.add(new BubbleBlock(350+1.3*getRadius()*cos(getDirection()-2*PI/3), 350+1.3*getRadius()*sin(getDirection()-2*PI/3), 5*getRadius()/8, getDirection(), base));
     }
     if (type > 12){
       
     }
  }
}
