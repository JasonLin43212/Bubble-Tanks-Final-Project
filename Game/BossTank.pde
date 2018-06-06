public class BossTank extends BubbleTank {
  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);

  public BossTank(float health, float radius, int id, float speed, int numBullets, int type) {
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
  
  public void buildBlocks() {
    blocks.clear();
    if (type == 0) { // bull
      blocks.add(new BubbleBlock(292, 325 - 80, 20, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(408, 325 - 80, 20, getDirection(), color(205,183,158)));

      blocks.add(new BubbleBlock(350, 365 - 80, 77, getDirection(), color(82,54,27))); 
      blocks.add(new BubbleBlock(350, 430 - 80, 40, 30, getDirection(), color(82,54,27)));
      
      blocks.add(new BubbleBlock(350, 430 - 80, 20, 10, getDirection(), color(175,28,25)));
      blocks.add(new BubbleBlock(320, 350 - 80, 10, getDirection(), color(175,28,25)));
      blocks.add(new BubbleBlock(380, 350 - 80, 10, getDirection(), color(175,28,25)));
      
      blocks.add(new BubbleBlock(340, 345 - 80, 5, getDirection(), color(101,15,22))); 
      blocks.add(new BubbleBlock(360, 345 - 80, 5, getDirection(), color(101,15,22)));
      blocks.add(new BubbleBlock(330, 330 - 80, 5, getDirection(), color(101,15,22)));
      blocks.add(new BubbleBlock(370, 330 - 80, 5, getDirection(), color(101,15,22)));
      blocks.add(new BubbleBlock(315, 325 - 80, 5, getDirection(), color(101,15,22)));
      blocks.add(new BubbleBlock(385, 325 - 80, 5, getDirection(), color(101,15,22)));
      
      blocks.add(new BubbleBlock(330, 400 - 80, 15, getDirection(), color(110,90,67)));
      blocks.add(new BubbleBlock(370, 400 - 80, 15, getDirection(), color(110,90,67)));
            
      blocks.add(new BubbleBlock(280, 315 - 80, 17, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(420, 315 - 80, 17, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(280, 315 - 80, 12, getDirection(), color(222,208,192)));
      blocks.add(new BubbleBlock(420, 315 - 80, 12, getDirection(), color(222,208,192)));
      
      blocks.add(new BubbleBlock(265, 300 - 80, 14, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(435, 300 - 80, 14, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(265, 300 - 80, 9, getDirection(), color(222,208,192)));
      blocks.add(new BubbleBlock(435, 300 - 80, 9, getDirection(), color(222,208,192)));
      
      blocks.add(new BubbleBlock(245, 295 - 80, 12, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(455, 295 - 80, 12, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(245, 295 - 80, 7, getDirection(), color(222,208,192)));
      blocks.add(new BubbleBlock(455, 295 - 80, 7, getDirection(), color(222,208,192)));
      
      blocks.add(new BubbleBlock(230, 295 - 80, 10, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(470, 295 - 80, 10, getDirection(), color(205,183,158)));
      blocks.add(new BubbleBlock(230, 295 - 80, 5, getDirection(), color(222,208,192)));
      blocks.add(new BubbleBlock(470, 295 - 80, 5, getDirection(), color(222,208,192)));
      
      blocks.add(new BubbleBlock(330, 400 - 80, 15, getDirection(), color(110,90,67)));
      blocks.add(new BubbleBlock(370, 400 - 80, 15, getDirection(), color(110,90,67)));
    }
    if (type == 1) {
      blocks.add(new BubbleBlock(300, 275, 25, getDirection(), color(255,231,0)));
      blocks.add(new BubbleBlock(400, 275, 25, getDirection(), color(255,231,0)));
      blocks.add(new BubbleBlock(310, 290, 25, getDirection(), color(255,231,0)));
      blocks.add(new BubbleBlock(390, 290, 25, getDirection(), color(255,231,0)));
      blocks.add(new BubbleBlock(350, 425, 50, getDirection(), color(255,231,0)));
      blocks.add(new BubbleBlock(350, 285, 50, getDirection(), color(255,231,0)));
      
      blocks.add(new BubbleBlock(350, 350, 75, 100, getDirection(), color(255,103,0)));
      blocks.add(new BubbleBlock(395, 350, 35, 85, getDirection(), color(255,141,0)));
      blocks.add(new BubbleBlock(305, 350, 35, 85, getDirection(), color(255,141,0)));
      blocks.add(new BubbleBlock(375, 350, 35, 85, getDirection(), color(255,193,0)));
      blocks.add(new BubbleBlock(325, 350, 35, 85, getDirection(), color(255,193,0)));
      blocks.add(new BubbleBlock(350, 350, 25, 70, getDirection(), color(255,231,0)));
    }
  }
  
}
