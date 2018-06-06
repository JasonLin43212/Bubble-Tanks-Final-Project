public class Boss {

  private BossTank tank;
  
  public Boss() {
    //health,radius,id,speed,numBullets,type
    tank = new BossTank(100, 10, 1, 5, 1, 0);
  }

  public BossTank getTank() {
    return tank;
  }
}
