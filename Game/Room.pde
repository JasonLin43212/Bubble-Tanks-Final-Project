public class Room {
  
  private boolean[] availableRooms;
  private int[][] coordsRooms = {{-1,0},{0,-1},{1,0},{0,1}}; // ccw - up left down right
  
  // private BubbleTank[] allTanks; 
  
  private int n;
  private int r, c;
  
  public Room (int num, int row, int col) {
    n = num; 
    r = row;
    c = col;
    
    availableRooms = new boolean[4];
    for (int i = 0; i < 4; i++) {
      if (r + coordsRooms[i][0] >= n || r + coordsRooms[i][0] < 0 || c + coordsRooms[i][1] >= n || c + coordsRooms[i][1] < 0) {
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
  
  public int[] roomCoords (int n) { // returns an array of the coordinates of a room you can move into
     return coordsRooms[n];
  }
  
  //private void setArrows (int num) {   
    //
  //}
  
}
