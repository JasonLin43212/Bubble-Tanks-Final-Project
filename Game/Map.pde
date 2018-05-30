public class Map {
  private Room[][] rooms;
  private Room currentRoom;

  public Map (int num) {
    rooms = new Room[num][num];
    
    //if (num % 2 == 1) {
      //num / 2;
    //}
        
    currentRoom = rooms[1][1]; 
  }  
  
  private void changeRooms (int row, int col) {
    if (row <= 2 && row >= 0 && col <= 2 && col >= 0) {
      currentRoom = rooms[row][col];
    }
  }
  
}