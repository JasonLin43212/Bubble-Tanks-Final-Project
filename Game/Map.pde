public class Map {
  private Room[][] rooms;
  private Room currentRoom;
  
  private int n;

  public Map (int num) {
    n = num;
    rooms = new Room[n][n];
    
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        rooms[r][c] = new Room (n, r, c);
      }
    }
    
    if (n % 2 == 1) {
      currentRoom = rooms[(n - 1) / 2][(n - 1) / 2];
    }
    
    else {
      currentRoom = rooms[0][0];
    }
  }  

  void switchR () {
    if (y < 11.0 && keyCode == 32) {
      System.out.println(x + ", " + y);
      System.out.println("y: " + y);
      if (currentRoom.available(0)) {
        changeRooms(currentRoom.getR() + currentRoom.roomCoords(0)[0],currentRoom.getC() + currentRoom.roomCoords(0)[1]);
      }
    }
    if (y > 689.0 && keyCode == 32) {
      System.out.println(x + ", " + y);
      System.out.println("y: " + y);
      if (currentRoom.available(2)) {
        changeRooms(currentRoom.getR() + currentRoom.roomCoords(2)[0], currentRoom.getC() + currentRoom.roomCoords(2)[1]);
      }
    }
    if (x < 11.0 && keyCode == 32) {
      System.out.println(x + ", " + y);
      System.out.println("x: " + x);
      if (currentRoom.available(1)) {
        changeRooms(currentRoom.getR() + currentRoom.roomCoords(1)[0], currentRoom.getC() + currentRoom.roomCoords(1)[1]);
      }
    }
    if (x > 689.0 && keyCode == 32) { 
      System.out.println(x + ", " + y);
      System.out.println("x: " + x);
      if (currentRoom.available(3)) {
        changeRooms(currentRoom.getR() + currentRoom.roomCoords(3)[0], currentRoom.getC() + currentRoom.roomCoords(3)[1]);
      }
    }
  }
  
  private void changeRooms (int row, int col) {
    System.out.println(row + ", " + col);
    if (row < n && row >= 0 && col < n && col >= 0) { 
      currentRoom = rooms[row][col];
      x = 350;
      y = 350;
    }
  }

  public int currentR () {
    return currentRoom.getR();
  }
  
  public int currentC () {
    return currentRoom.getC();
  }
}
