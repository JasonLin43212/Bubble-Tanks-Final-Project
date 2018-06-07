public class Room {
  
  private boolean[] availableRooms;
  
  private ArrayList<EnemyTank> allEnemyTanks;
  
  private int mapSize;
  private int row, col;
  
  public Room (int mapSize, int row, int col, int difficulty) {
    this.mapSize = mapSize; 
    this.row = row;
    this.col = col;
    
    availableRooms = new boolean[4];
    for (int i = 0; i < 4; i++) {
      if (row + 1 >= mapSize || row -1 < 0 || col + 1 >= mapSize || col -1 < 0) {
        availableRooms[i] = false; // can't move to
      }
      else { // if within bounds
        availableRooms[i] = true; // can move to
      }
    }
    int manhattanDist = abs(row - ((mapSize-1)/2)) + abs(col - ((mapSize-1)/2));
    int numEnemies = (int) (random(manhattanDist) + (manhattanDist+3))+ difficulty; 
    allEnemyTanks = new ArrayList<EnemyTank>();
    for (int i=0; i<numEnemies; i++){
       int type = (int) (random(manhattanDist/3) * difficulty);
       int id = maxID;
       maxID++;
       //health,radius,id,speed,type,coolDown
       allEnemyTanks.add(new EnemyTank(random(10)*difficulty+60 + manhattanDist*10,manhattanDist*3 + difficulty*1.5 + 10,id,manhattanDist*0.7 + 2 + difficulty,0,160-difficulty*5-manhattanDist));
    }
  }
  
  public int getR () {
    return row; 
  }
  
  public int getC () {
    return col;
  }
  
  public boolean available (int n) { // returns whether or not there is a room / you can move into that room
    return availableRooms[n];
  }
  
  public boolean[] getAvailable(){
     return availableRooms; 
  }
  
  public ArrayList<EnemyTank> getEnemies(){
     return allEnemyTanks; 
  }
  //private void setArrows (int num) {   
    //
  //}
  
}
