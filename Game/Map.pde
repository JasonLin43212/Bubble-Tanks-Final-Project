public class Map {
  private Room[][] rooms;
  private Room currentRoom;

  public Map (int num) {
    rooms = new Room[3][3];
    
    currentRoom = rooms[1][1];  
  }  
  
  private void changeRooms (int r, int c) {
    currentRoom = rooms[r][c];
  }
  
}
