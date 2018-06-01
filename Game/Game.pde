Player player = new Player();
BubbleTank tank = player.getTank();
ArrayList<BubbleBullet> allBullets;
boolean useMouse = true;

void setup() {
  size(700, 800);
  background(178, 207, 255);
  fill(0);
  rect(0, 0, 700, 50);
  allBullets = new ArrayList<BubbleBullet>();
}

void draw() {
  background(178, 207, 255);
  fill(0);
  rect(0, 0, 250, 30);
  rect(0, 0, 30, 250);
  rect(0, 450, 30, 250);
  rect(0, 670, 250, 30);
  rect(450, 0, 250, 30);
  rect(670, 0, 30, 250);
  rect(450, 670, 250, 30);
  rect(670, 450, 30, 250);
  if (useMouse){
     tank.realignDirection();  
  }
  tank.display();
  tank.move();
  tank.spawnBullets(allBullets);
  for (int i = 0; i<allBullets.size(); i++) {
    BubbleBullet current = allBullets.get(i);
    current.display();
    if (!current.move()){
        allBullets.remove(i);
        i--;
    }
  }
  fill(200);
  rect(0, 700, 700, 100);
}

void keyPressed() {
  if (useMouse){
    if (keyCode != 37 && keyCode != 39){
      tank.setMovement(keyCode, 1);
    }
  }
  else {
     tank.setMovement(keyCode,1); 
  }
}

void keyReleased() {
  if (useMouse){
    if (keyCode != 37 && keyCode != 39){
      tank.setMovement(keyCode, 0);
    }
  }
  else {
     tank.setMovement(keyCode,0); 
  }
}
