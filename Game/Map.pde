public class Map {
  private Room[][] rooms;
  private Room currentRoom;

  public Map (int num) {
    rooms = new Room[][];
    
    if (num % 2 == 1) { // choose center
       currentRoom =  
    }
    else { // choose top left
      currentRoom = 
    }
  }
  
  private changeRooms(int current, int next) {
    
    currentRoom = next;
    
  }
  
}