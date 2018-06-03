public class Room {
  
  private boolean[] availableRooms;
  
  // private BubbleTank[] allTanks; 
  
  private int mapSize;
  private int row, col;
  
  public Room (int mapSize, int row, int col) {
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
