public class Map {
  private Room[][] rooms;
  private Room currentRoom;

  private int[][] coordRooms = {{1,0},{0,1},{-1,0},{0,-1}};
  private int n;

  public Map (int num) {
    n = num;
    rooms = new Room[n][n];

    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        rooms[r][c] = new Room (n, r, c);
      }
    }

    // if it has an odd number of rows x cols, the starting currentRoom is at the center
    currentRoom = rooms[(n - 1) / 2][(n - 1) / 2];
  }  

  private void changeRooms (int changeTo) { // lets you actually change rooms
    if (currentRoom.getAvailable()[changeTo]){
      currentRoom = rooms[currentRoomR()+coordRooms[changeTo][0]][currentRoomC()+coordRooms[changeTo][1]];
    }
  }

  public int currentRoomR () { 
    return currentRoom.getR();
  }

  public int currentRoomC () {
    return currentRoom.getC();
  }
}
