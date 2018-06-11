public class BossRoom extends Room{
   
  private BubbleTank boss;
  
  public BossRoom( int mapSize, int row, int col, int difficulty,int type){
      super(mapSize,row,col,difficulty);
      getEnemies().clear();
      if (type == 0){
         boss = new Stationary(difficulty); 
      }
      if (type == 1){
        boss = new Shield(difficulty);
      }
      if (type == 2){
         boss = new Bull(difficulty); 
      }
      if (type == 3){
         boss = new FinalBoss(difficulty); 
      }
  }
  
  public String toString(){
     return "boss"; 
  }
  
  public BubbleTank getBoss(){
     return boss; 
  }
  
  public void setBoss(BubbleTank b){
     boss = b; 
  }
}
