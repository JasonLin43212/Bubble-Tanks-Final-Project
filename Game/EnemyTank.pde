public class EnemyTank extends BubbleTank{

  private int type;
  
  public EnemyTank(float health, float radius, int id, float speed, int numBullets, int type) {
    super(health, radius, id, speed, numBullets);
    this.type = type;
  }
}
