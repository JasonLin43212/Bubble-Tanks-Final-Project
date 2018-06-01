Player player = new Player();
BubbleTank tank = player.getTank();
ArrayList<BubbleBullet> allBullets;
boolean useMouse = false;
float centerX = 350;
float centerY = 350;

void setup() {
  size(700, 800);
  background(178, 207, 255);
  fill(0);
  rect(0, 0, 700, 50);
  allBullets = new ArrayList<BubbleBullet>();
}

void draw() {
  background(200);
  fill(0);

  tank.spawnBullets(allBullets);
  drawMap(tank.getX(), tank.getY());
  tank.display();
  tank.move();
  drawBullets(tank.getX(), tank.getY());
  if (useMouse) {
    tank.realignDirection(mouseX, mouseY);
  }
  fill(200);
  rect(0, 700, 700, 100);
}

void drawMap(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  noStroke();
  fill(178, 207, 255);
  ellipse(0, 0, 1500, 1500);
  ellipse(0,2000,1500,1500);
  ellipse(0,-2000,1500,1500);
  ellipse(2000,0,1500,1500);
  ellipse(-2000,0,1500,1500);
  popMatrix();
}  

void drawBullets(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  for (int i = 0; i<allBullets.size(); i++) {
    BubbleBullet current = allBullets.get(i);
    current.display();
    if (!current.move()) {
      allBullets.remove(i);
      i--;
    }
  }
  popMatrix();
}


void keyPressed() {
  if (useMouse) {
    if (keyCode != 37 && keyCode != 39) {
      tank.setMovement(keyCode, 1);
    }
  } else {
    tank.setMovement(keyCode, 1);
  }
}

void keyReleased() {
  if (useMouse) {
    if (keyCode != 37 && keyCode != 39) {
      tank.setMovement(keyCode, 0);
    }
  } else {
    tank.setMovement(keyCode, 0);
  }
}

void mousePressed() {
  tank.setMovement(32, 1);
}

void mouseReleased() {
  tank.setMovement(32, 0);
}
