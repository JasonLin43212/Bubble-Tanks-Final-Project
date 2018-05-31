public class Room {
  
  private boolean[] availableRooms;
  private int[][] coordsRooms = {{-1,0},{0,-1},{1,0},{0,1}};
  
  // private BubbleTank[] allTanks; 
  
  private int n, r, c;
  
  public Room (int num, int row, int col) {
    availableRooms = new boolean[4];
    for (int i = 0; i < 4; i++) {
      if (row + coordsRooms[i][0] >= num || row + coordsRooms[i][0] < 0 || col + coordsRooms[i][1] >= num || col + coordsRooms[i][1] < 0) {
        availableRooms[i] = false;
      }
      else {
        availableRooms[i] = true;
      }
    }
    
    n = num; 
    r = row;
    c = col;
  }
  
  public int getR () {
    return r; 
  }
  
  public int getC () {
    return c;
  }
  
  public boolean available (int n) {
    return availableRooms[n];
  }
  
  public int[] roomCoords (int n) {
     return coordsRooms[n];
  }
  
  //private void setArrows (int num) {    
  //}
  
}
