Map m; 
float x, y;

void setup() {
  size(700,750);
  background(178, 207, 255);
  fill(0);
  rect(0,700,700,50);
  
  x = 350;
  y = 350;
  
  m = new Map(3);
  
  System.out.println(m.currentR() + ", " + m.currentC());
}

void draw() {
  size(700,750);
  background(178, 207, 255);
  fill(0);
  rect(0,700,700,50);
  fill(255);
  ellipse(x,y,20,20);
}

void keyPressed() {
  if (keyCode == 87) {
    if (y > 10) {
      y -= 20;
    }
  }
  if (keyCode == 65) {
    if (x > 10) {
      x -= 20;
    }
  }
  if (keyCode == 83) {
    if (y < 690) {
      y += 20;
    }
  }
  if (keyCode == 68) {
    if (x < 690) {
      x += 20;
    }
  }
}
