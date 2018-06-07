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
    int numEnemies = (int) (random(manhattanDist) + manhattanDist/2) * difficulty;
    allEnemyTanks = new ArrayList<EnemyTank>();
    for (int i=0; i<numEnemies; i++){
       int type = (int) (random(manhattanDist/3) * difficulty);
       int id = maxID;
       maxID++;
       allEnemyTanks.add(new EnemyTank(random(100+manhattanDist*10)*difficulty,manhattanDist*7.5,id,manhattanDist*0.6 + 3,type));
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
  //private void setArrows (int num) {   
    //
  //}
  
}
