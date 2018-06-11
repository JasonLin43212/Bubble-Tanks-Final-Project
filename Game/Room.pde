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
    //check going right
    availableRooms[0] = col+1<mapSize;
    //checking down
    availableRooms[1] = row+1<mapSize;
    //checking left
    availableRooms[2] = col-1>=0;
    //checkning up
    availableRooms[3] = row-1>=0;
    int manhattanDist = abs(row - ((mapSize-1)/2)) + abs(col - ((mapSize-1)/2));
    int numEnemies = (int) (random(manhattanDist) + (manhattanDist+3))+ difficulty; 
    numEnemies = 10;
    allEnemyTanks = new ArrayList<EnemyTank>();
    for (int i=0; i<numEnemies; i++){
       int type = (int) (random(3)+manhattanDist);
       int id = maxID;
       maxID++;
       //health,radius,id,speed,type,coolDown
       allEnemyTanks.add(new EnemyTank(random(10)*difficulty+60 + manhattanDist*10,manhattanDist*3 + difficulty*1.5 + 10,id,manhattanDist*0.7*0 + 2 + 0*difficulty,type));
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
  
  public String toString(){
     return row + " " + col; 
  }
}
