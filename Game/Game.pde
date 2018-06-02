Map m; 
PFont bubble;
PFont ptmono;
Player player = new Player();
BubbleTank tank = player.getTank();
ArrayList<BubbleBullet> allBullets;
boolean useMouse = false;
int menuSetting = 1;
float centerX = 350;
float centerY = 350;
int difficulty = 0;
int bubbleCount = 1;
ArrayList<TitleBubble> titleCircles;

void setup() {
  size(700, 800);
  background(39, 150, 203);
  fill(0);
  rect(0, 0, 700, 50);
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
  m = new Map(5);
  allBullets = new ArrayList<BubbleBullet>();
  titleCircles = new ArrayList<TitleBubble>();
}

void draw() {
  if (menuSetting == 1) {
    title();
  } else if (menuSetting == 2) {
    difficulty();
  } else if (menuSetting == 3) {
    mapsize();
  } else {
    background(200);
    fill(0);
    strokeWeight(1);

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
}

void drawMap(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  noStroke();
  fill(39, 150, 203);
  ellipse(0, 0, 1500, 1500);
  ellipse(0, 2000, 1500, 1500);
  ellipse(0, -2000, 1500, 1500);
  ellipse(2000, 0, 1500, 1500);
  ellipse(-2000, 0, 1500, 1500);
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

void mouseClicked() {
  //title
  if (menuSetting == 1 && mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555) { 
    menuSetting = 2;
  }
  //difficulty
  else if (menuSetting == 2) {
    //easy
    if (mouseX > 200 && mouseX < 500 && mouseY > 242 && mouseY < 321) {
      difficulty = 1;
      menuSetting = 3;
    }
    //normal
    if (mouseX > 200 && mouseX < 500 && mouseY > 242 && mouseY < 321) {
      difficulty = 3;
      menuSetting = 3;
    }
    //hard
    if (mouseX > 200 && mouseX < 500 && mouseY > 420 && mouseY < 489) {
      difficulty = 5;
      menuSetting = 3;
    }
    //insane
    if (mouseX > 200 && mouseX < 500 && mouseY > 511 && mouseY < 578) {
      difficulty = 7;
      menuSetting = 3;
    }
  }
  //mapSetting
  else if (menuSetting == 3) {
    println("hi");
    menuSetting = 4;
  }
}

void title() {
  background(39, 150, 203);

  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("bubble tanks", 350, 250); // starts at 207 ends at 250
  // text("bubble tanks", 350, 365); // center of screen

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  textSize(36); 
  text("team bubb ling", 350, 300); 

  fill(242, 245, 252);
  noStroke();
  rect(200, 450, 300, 105);

  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("start", 350, 517); // starts at 488 ends at 517

  if (mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555) {
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 450, 300, 105);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("start", 350, 517); // starts at 488 ends at 517
    strokeWeight(0);
  }
}

void difficulty() {
  background(39, 150, 203);

  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("difficulty", 350, 150); // starts at 207 ends at 250
  // text("bubble tanks", 350, 365); // center of screen

  fill(242, 245, 252);
  noStroke();
  rect(200, 242, 300, 69);

  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("easy", 350, 291); // starts at 262 ends at 291

  if (mouseX > 200 && mouseX < 500 && mouseY > 242 && mouseY < 321) { // for easy
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 242, 300, 69);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("easy", 350, 291);
  }

  fill(242, 245, 252);
  noStroke();
  rect(200, 331, 300, 69);

  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("normal", 350, 380); // starts at 351 ends at 380

  if (mouseX > 200 && mouseX < 500 && mouseY > 331 && mouseY < 400) { // for normal
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 331, 300, 69);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("normal", 350, 380); // starts at 351 ends at 380
  }

  fill(242, 245, 252);
  noStroke();
  rect(200, 420, 300, 69);

  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("hard", 350, 469); // starts at 440 ends at 469

  if (mouseX > 200 && mouseX < 500 && mouseY > 420 && mouseY < 489) { // for hard
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 420, 300, 69);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("hard", 350, 469); // starts at 440 ends at 469
  }

  fill(242, 245, 252);
  noStroke();
  rect(200, 511, 300, 69);

  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("insane", 350, 558); // starts at 529 ends at 558

  if (mouseX > 200 && mouseX < 500 && mouseY > 511 && mouseY < 578) { // insane
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 511, 300, 69);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("insane", 350, 558); // starts at 529 ends at 558
  }
}

void mapsize() {
  background(39, 150, 203);

  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("map size", 350, 150); // starts at 207 ends at 250
  // text("bubble tanks", 350, 365); // center of screen

  float xsize = 100;
  float ysize = 100;
  for (int i = 0; i < 7; i++) {
    fill(255);
    ellipse(xsize, ysize, 20, 20);
    xsize += 50;
  }
}

void bubbles() { // reusable!! 
  bubbleCount++;
  if (bubbleCount % 10 == 0) {
    titleCircles.add(new TitleBubble(random(700), random(10)+1, random(20))); 
    bubbleCount = 1;
  }
  for (int i=0; i<titleCircles.size(); i++){
    TitleBubble current = titleCircles.get(i);
    current.display();
    if (current.move()){
       titleCircles.remove(i);
       i--;
    }
  }
}
