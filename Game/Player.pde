public class Player {

  private int bubblePoints;
  private BubbleTank tank;
  //new
  private int maxPoints;
  private int level = 1; 
  private int health = 100; 
  private int maxhealth = 100; 
  
  private int blaster, cannon, machinegun, missile, stunburst, areaburst, superattack;

  public Player() {
    bubblePoints = 0;
    //health,radius,id,speed,numBullets,type
    tank = new PlayerTank(100, 40, 0, 5, 1, 12, 0, 0, 0, 0, 0, 0, 0);
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
  
  public int getHealth () {
    return health;
  }
  
  public int maxHealth () {
    return maxHealth ();
  }
  
  // levels
}
