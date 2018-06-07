public class BossTank extends BubbleTank {
  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);

  public BossTank(float health, float radius, int id, float speed, int type) {
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

  public void buildBlocks() {
    blocks.clear();
    if (type == 0) { // bull
      setRadius(77);
      color bullBrown = color(82, 54, 27);
      color g = color(205, 183, 158);
      color bullRed = color(175, 28, 25);
      color eyebrow = color(101, 15, 22);
      color nose = color(110, 90, 67);
      color horn1 =color(205, 183, 158);
      color horn2 = color(222, 208, 192);
      //Horn 0
      blocks.add(new BubbleBlock(350+83*cos(getDirection()+28*PI/36), 350+83*sin(getDirection()+28*PI/36), 17, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+83*cos(getDirection()-28*PI/36), 350+83*sin(getDirection()-28*PI/36), 17, getDirection(), horn1));
      //Face
      blocks.add(new BubbleBlock(350+cos(getDirection()), 350+sin(getDirection()), 77, getDirection(), bullBrown));
      blocks.add(new BubbleBlock(350+70*cos(getDirection()), 350+70*sin(getDirection()), 40, getDirection(), bullBrown));
      //Nose and Eye
      blocks.add(new BubbleBlock(350+70*cos(getDirection()), 350+70*sin(getDirection()), 20, getDirection(), bullRed));
      blocks.add(new BubbleBlock(350+30*cos(getDirection()-5*PI/8), 350+30*sin(getDirection()-5*PI/8), 10, getDirection(), bullRed));
      blocks.add(new BubbleBlock(350+30*cos(getDirection()+5*PI/8), 350+30*sin(getDirection()+5*PI/8), 10, getDirection(), bullRed));
      //Eyebrows
      blocks.add(new BubbleBlock(350+55*cos(getDirection()-27*PI/36), 350+55*sin(getDirection()-27*PI/36), 5, getDirection(), eyebrow));
      blocks.add(new BubbleBlock(350+55*cos(getDirection()+27*PI/36), 350+55*sin(getDirection()+27*PI/36), 5, getDirection(), eyebrow));
      blocks.add(new BubbleBlock(350+27*cos(getDirection()-32*PI/36), 350+27*sin(getDirection()-32*PI/36), 5, getDirection(), eyebrow));
      blocks.add(new BubbleBlock(350+27*cos(getDirection()+32*PI/36), 350+27*sin(getDirection()+32*PI/36), 5, getDirection(), eyebrow));
      blocks.add(new BubbleBlock(350+42*cos(getDirection()-30*PI/36), 350+42*sin(getDirection()-30*PI/36), 5, getDirection(), eyebrow));
      blocks.add(new BubbleBlock(350+42*cos(getDirection()+30*PI/36), 350+42*sin(getDirection()+30*PI/36), 5, getDirection(), eyebrow));
      //Nose
      blocks.add(new BubbleBlock(350+47*cos(getDirection()+6*PI/36), 350+47*sin(getDirection()+6*PI/36), 15, getDirection(), nose));
      blocks.add(new BubbleBlock(350+47*cos(getDirection()-6*PI/36), 350+47*sin(getDirection()-6*PI/36), 15, getDirection(), nose));
      //Horn 1
      blocks.add(new BubbleBlock(350+92*cos(getDirection()+28*PI/36), 350+92*sin(getDirection()+28*PI/36), 17, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+92*cos(getDirection()-28*PI/36), 350+92*sin(getDirection()-28*PI/36), 17, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+92*cos(getDirection()+28*PI/36), 350+92*sin(getDirection()+28*PI/36), 12, getDirection(), horn2));
      blocks.add(new BubbleBlock(350+92*cos(getDirection()-28*PI/36), 350+92*sin(getDirection()-28*PI/36), 12, getDirection(), horn2));
      // Horn 2
      blocks.add(new BubbleBlock(350+115*cos(getDirection()+27*PI/36), 350+115*sin(getDirection()+27*PI/36), 14, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+115*cos(getDirection()-27*PI/36), 350+115*sin(getDirection()-27*PI/36), 14, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+115*cos(getDirection()+27*PI/36), 350+115*sin(getDirection()+27*PI/36), 9, getDirection(), horn2));
      blocks.add(new BubbleBlock(350+115*cos(getDirection()-27*PI/36), 350+115*sin(getDirection()-27*PI/36), 9, getDirection(), horn2));
      // Horn 3
      blocks.add(new BubbleBlock(350+132*cos(getDirection()+26*PI/36), 350+132*sin(getDirection()+26*PI/36), 12, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+132*cos(getDirection()-26*PI/36), 350+132*sin(getDirection()-26*PI/36), 12, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+132*cos(getDirection()+26*PI/36), 350+132*sin(getDirection()+26*PI/36), 7, getDirection(), horn2));
      blocks.add(new BubbleBlock(350+132*cos(getDirection()-26*PI/36), 350+132*sin(getDirection()-26*PI/36), 7, getDirection(), horn2));
      //horn 4
      blocks.add(new BubbleBlock(350+142*cos(getDirection()+25*PI/36), 350+142*sin(getDirection()+25*PI/36), 10, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()-25*PI/36), 350+142*sin(getDirection()-25*PI/36), 10, getDirection(), horn1));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()+25*PI/36), 350+142*sin(getDirection()+25*PI/36), 5, getDirection(), horn2));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()-25*PI/36), 350+142*sin(getDirection()-25*PI/36), 5, getDirection(), horn2));
    }
    if (type == 1) {
      //shield
      setRadius(90);
      blocks.add(new BubbleBlock(350+cos(getDirection()), 350+sin(getDirection()), 60, getDirection(), base));
      blocks.add(new BubbleBlock(350+65*cos(getDirection()), 350+65*sin(getDirection()), 75, getDirection(), base));
      blocks.add(new BubbleBlock(350+75*cos(getDirection()+PI), 350+75*sin(getDirection()+PI), 60, getDirection(), base));
      blocks.add(new BubbleBlock(350+115*cos(getDirection()+3*PI/10), 350+115*sin(getDirection()+3*PI/10), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+115*cos(getDirection()-3*PI/10), 350+115*sin(getDirection()-3*PI/10), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+90*cos(getDirection()+8*PI/18), 350+90*sin(getDirection()+8*PI/18), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+90*cos(getDirection()-8*PI/18), 350+90*sin(getDirection()-8*PI/18), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+80*cos(getDirection()+11*PI/18), 350+80*sin(getDirection()+11*PI/18), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+80*cos(getDirection()-11*PI/18), 350+80*sin(getDirection()-11*PI/18), 30, getDirection(), base));  
      blocks.add(new BubbleBlock(350+95*cos(getDirection()+7*PI/9), 350+95*sin(getDirection()+7*PI/9), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+95*cos(getDirection()-7*PI/9), 350+95*sin(getDirection()-7*PI/9), 30, getDirection(), base));  
      blocks.add(new BubbleBlock(350+105*cos(getDirection()+8*PI/9), 350+105*sin(getDirection()+8*PI/9), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+105*cos(getDirection()-8*PI/9), 350+105*sin(getDirection()-8*PI/9), 30, getDirection(), base));  
      blocks.add(new BubbleBlock(350+125*cos(getDirection()+PI), 350+125*sin(getDirection()+PI), 30, getDirection(), base));
    }
    if (type == 2) {
      //stationary
      setRadius(135);
      blocks.add(new BubbleBlock(350+90*cos(getDirection()+PI), 350+90*sin(getDirection()+PI), 30, getDirection(), base));
      //body
      blocks.add(new BubbleBlock(350+cos(getDirection()), 350+sin(getDirection()), 90, getDirection(), base));
      blocks.add(new BubbleBlock(350+70*cos(getDirection()), 350+70*sin(getDirection()), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+100*cos(getDirection()), 350+100*sin(getDirection()), 10, getDirection(), base));
      //surrounding bubbles
      for (int i=0; i<5; i++) {
        blocks.add(new BubbleBlock(350+110*cos(getDirection()+i*PI/7+3*PI/14), 350+110*sin(getDirection()+i*PI/7+3*PI/14), 25, getDirection(), base)); 
        blocks.add(new BubbleBlock(350+110*cos(getDirection()-i*PI/7-3*PI/14), 350+110*sin(getDirection()-i*PI/7-3*PI/14), 25, getDirection(), base));
      }
      //tail
      blocks.add(new BubbleBlock(350+130*cos(getDirection()+PI), 350+130*sin(getDirection()+PI), 30, getDirection(), base));
      blocks.add(new BubbleBlock(350+150*cos(getDirection()+15*PI/16), 350+150*sin(getDirection()+15*PI/16), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+150*cos(getDirection()-15*PI/16), 350+150*sin(getDirection()-15*PI/16), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+170*cos(getDirection()+30*PI/32), 350+170*sin(getDirection()+30*PI/32), 10, getDirection(), base));
      blocks.add(new BubbleBlock(350+170*cos(getDirection()-30*PI/32), 350+170*sin(getDirection()-30*PI/32), 10, getDirection(), base));
      //extra bubbles
      blocks.add(new BubbleBlock(350+110*cos(getDirection()+4*PI/32), 350+110*sin(getDirection()+4*PI/32), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+110*cos(getDirection()-4*PI/32), 350+110*sin(getDirection()-4*PI/32), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+133*cos(getDirection()+7*PI/32), 350+133*sin(getDirection()+7*PI/32), 20, getDirection(), base));
      blocks.add(new BubbleBlock(350+133*cos(getDirection()-7*PI/32), 350+133*sin(getDirection()-7*PI/32), 20, getDirection(), base));
      blocks.add(new BubbleBlock(350+133*cos(getDirection()+PI/2), 350+133*sin(getDirection()+PI/2), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+133*cos(getDirection()-PI/2), 350+133*sin(getDirection()-PI/2), 15, getDirection(), base));
      //antenna
      blocks.add(new BubbleBlock(350+133*cos(getDirection()+7*PI/32), 350+133*sin(getDirection()+7*PI/32), 12, getDirection(), internal));
      blocks.add(new BubbleBlock(350+133*cos(getDirection()-7*PI/32), 350+133*sin(getDirection()-7*PI/32), 12, getDirection(), internal));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()+8*PI/32), 350+142*sin(getDirection()+8*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()-8*PI/32), 350+142*sin(getDirection()-8*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()+6*PI/32), 350+142*sin(getDirection()+6*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+142*cos(getDirection()-6*PI/32), 350+142*sin(getDirection()-6*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+155*cos(getDirection()+8*PI/32), 350+155*sin(getDirection()+8*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+155*cos(getDirection()-8*PI/32), 350+155*sin(getDirection()-8*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+155*cos(getDirection()+6*PI/32), 350+155*sin(getDirection()+6*PI/32), 7, getDirection(), internal));
      blocks.add(new BubbleBlock(350+155*cos(getDirection()-6*PI/32), 350+155*sin(getDirection()-6*PI/32), 7, getDirection(), internal));
      //internal
      blocks.add(new BubbleBlock(350+40*cos(getDirection()+6*PI/32), 350+40*sin(getDirection()+6*PI/32), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+40*cos(getDirection()-6*PI/32), 350+40*sin(getDirection()-6*PI/32), 15, getDirection(), base));
      blocks.add(new BubbleBlock(350+28*cos(getDirection()+2*PI/3), 350+28*sin(getDirection()+2*PI/3), 10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+28*cos(getDirection()-2*PI/3), 350+28*sin(getDirection()-2*PI/3), 10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+40*cos(getDirection()+26*PI/32), 350+40*sin(getDirection()+26*PI/32), 10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+40*cos(getDirection()-26*PI/32), 350+40*sin(getDirection()-26*PI/32), 10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+51*cos(getDirection()+29*PI/32), 350+51*sin(getDirection()+29*PI/32), 10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+51*cos(getDirection()-29*PI/32), 350+51*sin(getDirection()-29*PI/32), 10, getDirection(), internal));
      blocks.add(new BubbleBlock(350+3*cos(getDirection()), 350+3*sin(getDirection()), 25, getDirection(), internal));
      blocks.add(new BubbleBlock(350+65*cos(getDirection()+PI), 350+65*sin(getDirection()+PI), 20, getDirection(), internal));
    }
  }
}
