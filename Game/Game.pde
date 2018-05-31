Player player = new Player();
BubbleTank tank = player.getTank();

void setup() {
  size(700, 800);
  background(178, 207, 255);
  fill(0);
  rect(0, 0, 700, 50);
}

void draw() {
  background(178, 207, 255);
  fill(200);
  rect(0, 700, 700, 100);
  fill(0);
  rect(0, 0, 250, 30);
  rect(0, 0, 30, 250);
  rect(0, 450, 30, 250);
  rect(0, 670, 250, 30);
  rect(450, 0, 250, 30);
  rect(670, 0, 30, 250);
  rect(450, 670, 250, 30);
  rect(670, 450, 30, 250);
  tank.display();
  tank.move();
}

void keyPressed() {
  tank.setMovement(keyCode, 1);
}

void keyReleased() {
  tank.setMovement(keyCode, 0);
}
