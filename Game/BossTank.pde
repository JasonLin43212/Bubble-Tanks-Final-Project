public class BossTank extends BubbleTank {
  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);

  public BossTank(float health, float radius, int id, float speed, int type, float coolDown) {
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

  public void updatedType() {
    return;
  }

  public void buildBlocks() {
    blocks.clear();
    float x = getX();
    float y = getY();
    if (type == 0) { // bull
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
    if (type == 1) {
      //shield
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
    if (type == 2) {
      //stationary
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
    if (type == 3) {
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
  }
}
