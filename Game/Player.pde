public class Player{
 
  private int bubblePoints;
  private BubbleTank tank;
  //new
  private int maxPoints;
  
  public Player(){
     bubblePoints = 0;
     tank = new BasicTank();
  }
  
  public boolean canUpgrade(){
     return bubblePoints >= maxPoints;
  }
  
  public void addPoints(int points){
     bubblePoints += points;
     if (bubblePoints > maxPoints){
        bubblePoints = maxPoints; 
     }
  }
  
}
