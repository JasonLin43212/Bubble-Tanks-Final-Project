Map m; 
float x, y;

void setup() {
  size(700,750); // the background
  background(178, 207, 255);
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  x = 350; // sets the initial coordinates
  y = 350; // to the center of the Room
  
  m = new Map(3); // 3 x 3
  
  System.out.println(m.currentRoomR() + ", " + m.currentRoomC());
}

void draw() {
  size(700,750); // the background
  background(178, 207, 255);
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  fill(255); // "player"
  ellipse(x,y,20,20);
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
