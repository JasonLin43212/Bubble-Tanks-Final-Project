public class Room {
  
  private boolean[] availableRooms;
  private float[] coordsRooms = {{-1,0},{0,-1},{1,0},{0,1}};
  
  // private BubbleTank[] allTanks; 
  
  private float r, c;
  
  public Room (float row, float col) {
    availableRooms = new boolean[4];
    for (float i = 0; i < 4; i++) {
      if (row + coordsRooms[i][0] > 2 || row + coordsRooms[i][0] < 0 || col + coordsRooms[i][1] > 2 || col + coordsRooms[i][1] < 0) {
        availableRooms[i] = false;
      }
    }
    
    r = row;
    c = col;
  }
  
  public float getR () {
    return r; 
  }
  
  public float getC () {
    return c;
  }
  
  private void setArrows (float num) {
    
  }
  
}