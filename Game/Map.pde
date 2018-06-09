public class Map {
  public Room[][] rooms;
  private Room currentRoom;

  private int[][] coordRooms = {{0,1},{1,0},{0,-1},{-1,0}};
  private int n;

  public Map (int num, int difficulty) {
    n = num;
    rooms = new Room[n][n];

    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        rooms[r][c] = new Room (n, r, c, difficulty);
      }
    }

    // if it has an odd number of rows x cols, the starting currentRoom is at the center
    currentRoom = rooms[(n - 1) / 2][(n - 1) / 2];
  }  

/* 0: right
*  1: down
*  2: left
*  3: up
*/
  private void changeRooms (int changeTo) { // lets you actually change rooms
      currentRoom = rooms[currentRoomR()+coordRooms[changeTo][0]][currentRoomC()+coordRooms[changeTo][1]];
  }
  
  public boolean canChangeRoom(int changeTo){
      return currentRoom.getAvailable()[changeTo];
  }

  public int currentRoomR () { 
    return currentRoom.getR();
  }

  public int currentRoomC () {
    return currentRoom.getC();
  }
  
  public Room getCurrentRoom(){
     return currentRoom; 
  }
  
}
