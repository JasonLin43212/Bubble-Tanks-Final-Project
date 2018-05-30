public class Map {
  private Room[][] rooms;
  private Room currentRoom;
  
  private int n;

  public Map (int num) {
    n = num;
    rooms = new Room[n][n];
    
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        rooms[r][c] = new Room (r,c);
      }
    }
    
    if (n % 2 == 1) {
      currentRoom = rooms[(n - 1) / 2][(n - 1) / 2];
    }
    
    else {
      currentRoom = rooms[0][0];
    }
  }  
  
  private void changeRooms (int row, int col) {
    if (row < n && row >= 0 && col < n && col >= 0) {
      currentRoom = rooms[row][col];
    }
  }

  public int currentR () {
    return currentRoom.getR();
  }
  
  public int currentC () {
    return currentRoom.getC();
  }
}
