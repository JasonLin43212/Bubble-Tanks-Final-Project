public class Room {
  
  private boolean[] availableRooms;
  
  // private BubbleTank[] allTanks; 
  
  private int n;
  private int r, c;
  
  public Room (int num, int row, int col) {
    n = num; 
    r = row;
    c = col;
    
    availableRooms = new boolean[4];
    for (int i = 0; i < 4; i++) {
      if (r + 1 >= n || r -1 < 0 || c + 1 >= n || c -1 < 0) {
        availableRooms[i] = false; // can't move to
      }
      else { // if within bounds
        availableRooms[i] = true; // can move to
      }
    }

  }
  
  public int getR () {
    return r; 
  }
  
  public int getC () {
    return c;
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
