public class Room {
  
  private boolean[] availableRooms;
  private int[][] coordsRooms = {{-1,0},{0,-1},{1,0},{0,1}};
  
  // private BubbleTank[] allTanks; 
  
  private int r, c;
  
  public Room (int row, int col) {
    availableRooms = new boolean[4];
    for (int i = 0; i < 4; i++) {
      if (row + coordsRooms[i][0] > 2 || row + coordsRooms[i][0] < 0 || col + coordsRooms[i][1] > 2 || col + coordsRooms[i][1] < 0) {
        availableRooms[i] = false;
      }
    }
    
    r = row;
    c = col;
  }
  
  public int getR () {
    return r; 
  }
  
  public int getC () {
    return c;
  }
  
  //private void setArrows (int num) {    
  //}
  
}
