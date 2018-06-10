public class Player {

  private int bubblePoints;
  private PlayerTank tank;
  //new
  private int maxPoints;
  private int level = 0; 
  private int health = 100; 
  private int maxHealth = 100; 
  
  // private int blaster, cannon, machinegun, missile, stunburst, areablast, superattack;

  public Player() {
    bubblePoints = 0;
    //health,radius,id,speed,coolDown,type,blaster, cannon, machinegun, missile, stunburst, areablast, superattack
    tank = new PlayerTank(5000, 40, 0, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0);

    maxPoints = 100;
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

  public PlayerTank getTank() {
    return tank;
  }
  public int getHealth () {
    return health;
  }
  
  public int maxHealth () {
    return maxHealth;
  }
  
  public void levelUp () {
    if (bubblePoints >= maxPoints && level < 25) {
      level++;
      tank.setType((int)(level/2));
      playerLevelUp = true;
      bubblePoints = 0;
      maxPoints += maxPoints*((float)difficulty/20);
    }
  }
    
  public int getLevel () {
    return level;  
  }
  
  public int getPoints() {
    return bubblePoints;
  }

  public int getMaxPoints() {
    return maxPoints;
  }
}
