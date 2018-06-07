public class Player {

  private int bubblePoints;
  private BubbleTank tank;
  //new
  private int maxPoints;

  public Player() {
    bubblePoints = 0;
    //health,radius,id,speed,type,coolDown
    tank = new EnemyTank(1000, 40,0, 10,0,5);
  }

  public boolean canUpgrade() {
    return bubblePoints >= maxPoints;
  }

  public void addPoints(int points) {
    bubblePoints += points;
    if (bubblePoints > maxPoints) {
      bubblePoints = maxPoints;
    }
  }

  public BubbleTank getTank() {
    return tank;
  }
}
