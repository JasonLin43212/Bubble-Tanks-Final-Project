public class MissileBullet extends BubbleBullet {

  private int followId;
  private BubbleBlock[] blocks;

  public MissileBullet(float radius, float speed, float tankRadius, float x, float y, float direction, int id) {
    super(radius, speed, tankRadius, x, y, direction, id);
    this.followId = followId;
    blocks = new BubbleBlock[3];
  }

  public void switchDirection() {
    ArrayList<EnemyTank> enemies = m.getCurrentRoom().getEnemies();
    for (int i=0; i<enemies.size(); i++) {
      EnemyTank cur = enemies.get(i);
      if ( cur.getId() == followId) {
        direction = atan2(cur.getY()-y, cur.getX()-x);
        return;
      }
    }
    if (enemies.size()!=0) {
      followId = enemies.get((int) (random(enemies.size()))).getId();
    }
  }

  public void display() {
    blocks[0] = new BubbleBlock(x, y, radius, direction, color(121, 114, 130));
    blocks[1] = new BubbleBlock(x+1.1*getRadius()*cos(direction+2*PI/3), y+1.1*getRadius()*sin(direction+2*PI/3), radius/3, direction, color(121, 114, 130));
    blocks[2] = new BubbleBlock(x+1.1*getRadius()*cos(direction-2*PI/3), y+1.1*getRadius()*sin(direction-2*PI/3), radius/3, direction, color(121, 114, 130));
    for (int i=0; i<3; i++) {
      blocks[i].display();
    }
    switchDirection();
  }
}
