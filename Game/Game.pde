Map m; 
float x, y;

String currentRoom; // for testing

void setup() {
  size(700,750); // the background
  background(178, 207, 255);
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  x = 350; // sets the initial coordinates
  y = 350; // to the center of the Room
  
  m = new Map(5); // 3 x 3
    
  // System.out.println(m.currentRoomR() + ", " + m.currentRoomC()); // for testing
}

void draw() {
  size(700,750); // the background
  background(178, 207, 255);
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  fill(255); // "player"
  ellipse(x,y,20,20);
  
  fill(255);
  currentRoom = m.currentRoomR() + ", " + m.currentRoomC(); // coords of room
  text(currentRoom,10,20); // for testing
  
  direction();
}

void direction() { // for testing / indicating what direction the room you're trying to move to is in
  if (y < 11) {
    text("above",10,40);
  }
  if (x < 11) {
    text("left",10,40);
  }
  if (y > 689) {
    text("down",10,40);
  }
 if (x > 689) {
   text("right",10,40);
 } 
}

void keyPressed() { // for moving around
  if (keyCode == 87) { // w (up)
    if (y > 10) {
      y -= 20;
    }
  }
  if (keyCode == 65) { // a (left)
    if (x > 10) {
      x -= 20;
    }
  }
  if (keyCode == 83) { // s (down)
    if (y < 690) {
      y += 20;
    }
  }
  if (keyCode == 68) { // d (right)
    if (x < 690) {
      x += 20;
    }
  }
  
  m.switchR(); // for switching rooms
}
