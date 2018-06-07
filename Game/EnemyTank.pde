public class EnemyTank extends BubbleTank {

  private int type;
  color base = color(20, 54, 129);
  color internal = color(214, 149, 9);
  private float goToAngle, goToDistance, distanceSoFar;

  public EnemyTank(float health, float radius, int id, float speed, int type,float coolDown) {
    super(health, radius, id, speed,coolDown);
    this.type = type;
    goToAngle = random(2*PI);
    goToDistance = 1;
    distanceSoFar = 1;
    setX(random(800)*cos(-goToAngle));
    setY(random(800)*sin(-goToAngle));
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
    float x = getX();
    float y = getY();
    if (type == 0) {
      blocks.add(new BubbleBlock(x+cos(getDirection()), y+sin(getDirection()), getRadius(), getDirection(), base));
      blocks.add(new BubbleBlock(x+getRadius()*cos(getDirection()), y+getRadius()*sin(getDirection()), getRadius()/4, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()+2*PI/3), y+1.3*getRadius()*sin(getDirection()+2*PI/3), 5*getRadius()/8, getDirection(), base));
      blocks.add(new BubbleBlock(x+1.3*getRadius()*cos(getDirection()-2*PI/3), y+1.3*getRadius()*sin(getDirection()-2*PI/3), 5*getRadius()/8, getDirection(), base));
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
}
