public class EnemyTank extends BubbleTank {

  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  private float goToAngle, goToDistance, distanceSoFar;

  public EnemyTank(float health, float radius, int id, float speed, int type, float coolDown) {
    super(health, radius, id, speed, coolDown);
    this.type = type;
    goToAngle = random(2*PI);
    goToDistance = 1;
    distanceSoFar = 1;
    setX(random(800)*cos(-goToAngle));
    setY(random(800)*sin(-goToAngle));
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
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+getRadius()*cos(getDirection()), y+getRadius()*sin(getDirection()), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+2*PI/3), y+1.3*getRadius()*sin(getDirection()+2*PI/3), 5*getRadius()/8, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-2*PI/3), y+1.3*getRadius()*sin(getDirection()-2*PI/3), 5*getRadius()/8, getDirection(), base));
    }
    if (type == 1) {
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      for (int i=0; i<5; i++) {
        blocks.add(new BubbleBlock(x+1.5*getRadius()*cos(getDirection()+i*PI/2.5), y+1.5*getRadius()*sin(getDirection()+i*PI/2.5), getRadius()/2, getDirection(), base));
      }
    }
    if (type == 2) {
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
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()), y+1.4*getRadius()*sin(getDirection()), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+PI/2), y+1.4*getRadius()*sin(getDirection()+PI/2), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI/2), y+1.4*getRadius()*sin(getDirection()-PI/2), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()-PI), y+1.4*getRadius()*sin(getDirection()-PI), getRadius()/2, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()+PI/9), y+1.9*getRadius()*sin(getDirection()+PI/9), getRadius()/3, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.9*getRadius()*cos(getDirection()-PI/9), y+1.9*getRadius()*sin(getDirection()-PI/9), getRadius()/3, getDirection(), base));
    }
    if (type == 4) {
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      for (int i=0; i<3; i++) {
        blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+i*PI/1.5-PI/3), y+1.4*getRadius()*sin(getDirection()+i*PI/1.5-PI/3), getRadius()/2, getDirection(), base));
        blocks.add(new BubbleBlock(x+1.4*getRadius()*cos(getDirection()+i*PI/1.5), y+1.4*getRadius()*sin(getDirection()+i*PI/1.5), getRadius()/2, getDirection(), base));
        blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+i*PI/1.5-PI/3.8), y+2.1*getRadius()*sin(getDirection()+i*PI/1.5-PI/3.8), getRadius()/4, getDirection(), base));
        blocks.add(new BubbleBlock(x+2.1*getRadius()*cos(getDirection()+i*PI/1.5-PI/2.5), y+2.1*getRadius()*sin(getDirection()+i*PI/1.5-PI/2.5), getRadius()/4, getDirection(), base));
      }
    }
    if (type > 12) {
    }
  }

  public void move() {
    super.move(m);
    float distFromCenter = dist(getX(), getY(), 0, 0);
    float angle = atan2(getY(), getX());
    //Once you are at your destination, pick a new destination.
    //If enemy reaches bounds of bubble, pick a new destination.
    if (distanceSoFar >= goToDistance || distFromCenter>1000-getRadius()) {
      if (distFromCenter>1000-getRadius()) {
        setX((1000-getRadius())*cos(angle));
        setY((1000-getRadius())*sin(angle));
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
