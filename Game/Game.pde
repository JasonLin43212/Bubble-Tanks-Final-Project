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
int mapSize;
float selected;

void setup() {
  size(700, 800);
  background(39, 150, 203);
  fill(200);
  rect(0, 700, 700, 100);  
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
  m = new Map(5);
  allBullets = new ArrayList<BubbleBullet>();
  titleCircles = new ArrayList<TitleBubble>();
}


/*Menu Setting Numbers
 * 1: Title
 * 2: Difficulty
 * 3: Map Size
 * 4: Mouse Use
 * 5: All settings
 * 6: Actual Game
 * 7: Pause
 */
void draw() {
  if (menuSetting == 1) {
    title();
  } else if (menuSetting == 2) {
    difficulty();
  } else if (menuSetting == 3) {
    mapsize();
  } else if (menuSetting == 4) {
    mouseuse();
  } else if (menuSetting == 5) {
    mapsettings();
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

//shooting with mouse
void mousePressed() {
  if (useMouse) {
    tank.setMovement(32, 1);
  }
}

//stop shooting with mouse
void mouseReleased() {
  if (useMouse) {
    tank.setMovement(32, 0);
  }
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
      menuSetting = 3;
      difficulty = 1;
    }
    //normal
    if (mouseX > 200 && mouseX < 500 && mouseY > 331 && mouseY < 400) {
      menuSetting = 3;
      difficulty = 3;
    }
    //hard
    if (mouseX > 200 && mouseX < 500 && mouseY > 420 && mouseY < 489) {
      menuSetting = 3;
      difficulty = 5;
    }
    //insane
    if (mouseX > 200 && mouseX < 500 && mouseY > 511 && mouseY < 578) {
      menuSetting = 3;
      difficulty = 7;
    }
    //back
    if  (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 1;
    }
  }
  //map size
  else if (menuSetting == 3) {
    //5
    if (mouseX > 64.5 && mouseX < 110.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 5;
      selected = 87.5;
    }
    //7
    if (mouseX > 139.5 && mouseX < 185.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 7;
      selected = 162.5;
    }
    //9
    if (mouseX > 214.5 && mouseX < 260.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 9;
      selected = 237.5;
    }
    //11
    if (mouseX > 289.5 && mouseX < 335.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 11;
      selected = 312.5;
    }
    //13
    if  (mouseX > 364.5 && mouseX < 410.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 13;
      selected = 387.5;
    }

    //15
    if (mouseX > 439.5 && mouseX < 485.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 15;
      selected = 462.5;
    }
    //17
    if (mouseX > 514.5 && mouseX < 560.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 17;
      selected = 537.5;
    }
    //19
    if (mouseX > 589.5 && mouseX < 635.5 && mouseY > 200 && mouseY < 250) {
      mapSize = 19;
      selected = 612.5;
    }
    //OK
    if (mouseX > 200 && mouseX < 500 && mouseY > 360 & mouseY < 429 && selected > 0) {
      menuSetting = 4;
    }
    //back
    if  (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 2;
    }
  }
  //mouse use
  else if (menuSetting == 4) {
    //yes
    if (mouseX > 200 && mouseX < 500 && mouseY > 292 && mouseY < 371) {
      menuSetting = 5;
      useMouse = true;
    }
    //no
    if (mouseX > 200 && mouseX < 500 && mouseY > 381 && mouseY < 450) {
      menuSetting = 5;
      useMouse = false;
    }
    //back
    if  (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 3;
    }
  }
  //confirmation
  else if (menuSetting == 5) {
    if (mouseX > 200 && mouseX < 500 && mouseY > 500 && mouseY < 605) {
      menuSetting = 6;
    }
    //back
    if  (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 4;
    }
  }
}

void title() {
  background(39, 150, 203);
  noStroke();
  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("bubble tanks", 350, 250); // starts at 207 ends at 250
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
  }
}

void difficulty() {
  background(39, 150, 203);

  noStroke();
  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("difficulty", 350, 150); // starts at 207 ends at 250

  //easy button
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

  //normal button
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

  //hard button
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

  //insane button
  fill(242, 245, 252);
  noStroke();
  rect(200, 511, 300, 69);
  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("insane", 350, 558); // starts at 529 ends at 558

  if (mouseX > 200 && mouseX < 500 && mouseY > 511 && mouseY < 578) { // for insane
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

  //back button
  fill(242, 245, 252);
  noStroke();
  rect(20, 20, 100, 50);
  fill(39, 150, 203);
  textAlign(LEFT);
  textFont(bubble);
  textSize(30); // 29
  text("back", 27, 55);

  if  (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) { // for back
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(20, 20, 100, 50);

    fill(255);
    textAlign(LEFT);
    textFont(bubble);
    textSize(30); // 29
    text("back", 27, 55);
  }
}

void mapsize() {  
  background(39, 150, 203);
  noStroke();
  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("map size", 350, 150); // starts at 107 ends at 150
  textSize(24);
  text("choose the size of your map", 350, 310);  

  fill(255); // bar behind circles
  noStroke();
  rect(88.5, 218, 525, 16);

  float xsize = 12.5;
  int num = 3;
  for (int i = 0; i < 8; i++) {
    xsize += 75;
    num += 2; 

    fill(255); // big circle
    noStroke();
    ellipse(xsize, 225, 40, 40);

    fill(255); // little circle (changes colors and stuff)
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(xsize, 225, 20, 20);

    fill(255); // size
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); 
    text(num, xsize, 275);
  }

  fill(224, 235, 255);
  strokeWeight(6);
  stroke(178, 207, 255);
  if (mouseX > 64.5 && mouseX < 110.5 && mouseY > 200 && mouseY < 250) { // 5
    ellipse(87.5, 225, 20, 20);
  }

  if (mouseX > 139.5 && mouseX < 185.5 && mouseY > 200 && mouseY < 250) { // 7
    ellipse(162.5, 225, 20, 20);
  }

  if (mouseX > 214.5 && mouseX < 260.5 && mouseY > 200 && mouseY < 250) { // 9
    ellipse(237.5, 225, 20, 20);
  }

  if (mouseX > 289.5 && mouseX < 335.5 && mouseY > 200 && mouseY < 250) { // 11
    ellipse(312.5, 225, 20, 20);
  }

  if (mouseX > 364.5 && mouseX < 410.5 && mouseY > 200 && mouseY < 250) { // 13
    ellipse(387.5, 225, 20, 20);
  }

  if (mouseX > 439.5 && mouseX < 485.5 && mouseY > 200 && mouseY < 250) { // 15
    ellipse(462.5, 225, 20, 20);
  }

  if (mouseX > 514.5 && mouseX < 560.5 && mouseY > 200 && mouseY < 250) { // 17
    ellipse(537.5, 225, 20, 20);
  }

  if (mouseX > 589.5 && mouseX < 635.5 && mouseY > 200 && mouseY < 250) { // 19
    ellipse(612.5, 225, 20, 20);
  }

  if (selected > 0) { // if you chose something
    fill(90, 190, 240); // little circle (changes color while hovering)
    strokeWeight(6);
    stroke(224, 235, 255);
    ellipse(selected, 225, 20, 20);

    fill(242, 245, 252); // button to move to next page
    noStroke();
    rect(200, 360, 300, 69);
    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("ok", 350, 407);

    if (mouseX > 200 && mouseX < 500 && mouseY > 360 & mouseY < 429) { 
      fill(224, 235, 255);
      strokeWeight(5);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(255);
      rect(200, 360, 300, 69);

      fill(255);
      textAlign(CENTER);
      textFont(bubble);
      textSize(48); // 29
      text("ok", 350, 407);
    }
  }

  //back button
  fill(242, 245, 252);
  noStroke();
  rect(20, 20, 100, 50);
  fill(39, 150, 203);
  textAlign(LEFT);
  textFont(bubble);
  textSize(30); // 29
  text("back", 27, 55);

  if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) { // for back
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(20, 20, 100, 50);

    fill(255);
    textAlign(LEFT);
    textFont(bubble);
    textSize(30); // 29
    text("back", 27, 55);
  }
}

void mouseuse() {
  background(39, 150, 203);
  noStroke();
  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("mouse use", 350, 150); // starts at 207 ends at 250

  fill(242, 245, 252);
  noStroke();
  rect(200, 292, 300, 69);
  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("yes", 350, 341); // starts at 262 ends at 291

  if (mouseX > 200 && mouseX < 500 && mouseY > 292 && mouseY < 371) { // for yes
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 292, 300, 69);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("yes", 350, 341);
  }

  fill(242, 245, 252);
  noStroke();
  rect(200, 381, 300, 69);
  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("no", 350, 430); // starts at 351 ends at 380

  if (mouseX > 200 && mouseX < 500 && mouseY > 381 && mouseY < 450) { // for no
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 381, 300, 69);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("no", 350, 430); // starts at 351 ends at 380
  }

  //back button
  fill(242, 245, 252);
  noStroke();
  rect(20, 20, 100, 50);
  fill(39, 150, 203);
  textAlign(LEFT);
  textFont(bubble);
  textSize(30); // 29
  text("back", 27, 55);

  if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) { // for back
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(20, 20, 100, 50);

    fill(255);
    textAlign(LEFT);
    textFont(bubble);
    textSize(30); // 29
    text("back", 27, 55);
  }
}

void mapsettings() {  
  background(39, 150, 203);
  noStroke();
  bubbles();

  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("map settings", 350, 150); // starts at 107 ends at 150

  // difficulty button
  textAlign(LEFT);
  textSize(48); // 29
  text("difficulty", 100, 300);  
  // mouse use
  text("mouse use", 100, 350);
  //map size
  text("map size", 100, 400);

  // selected difficulty
  textAlign(RIGHT);
  textSize(36); // 29
  String difficultyText;
  if (difficulty == 1) {
    difficultyText = "easy";
  } else if (difficulty == 3) {
    difficultyText = "normal";
  } else if (difficulty == 5) {
    difficultyText = "hard";
  } else {
    difficultyText = "insane";
  }
  text(difficultyText, 600, 300);
  // selected mouse use
  if (useMouse) {
    text("yes", 600, 350);
  }
  if (!useMouse) {
    text("no", 600, 350);
  }
  // selected map size
  text(mapSize, 600, 400);

  fill(242, 245, 252); // start game
  noStroke();
  rect(200, 500, 300, 105);
  fill(39, 150, 203);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("start", 350, 567); // starts at 488 ends at 517
  if (mouseX > 200 && mouseX < 500 && mouseY > 500 && mouseY < 605) {
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200, 500, 300, 105);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("start", 350, 567); // starts at 488 ends at 517
  }

  //back button
  fill(242, 245, 252);
  noStroke();
  rect(20, 20, 100, 50);
  fill(39, 150, 203);
  textAlign(LEFT);
  textFont(bubble);
  textSize(30); // 29
  text("back", 27, 55);

  if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) { // for back
    fill(224, 235, 255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(20, 20, 100, 50);

    fill(255);
    textAlign(LEFT);
    textFont(bubble);
    textSize(30); // 29
    text("back", 27, 55);
  }
}

void bubbles() { // reusable!!
  bubbleCount++;
  if (bubbleCount % 10 == 0) {
    titleCircles.add(new TitleBubble(random(700), random(10)+1, random(20))); 
    bubbleCount = 1;
  }
  for (int i=0; i<titleCircles.size(); i++) {
    TitleBubble current = titleCircles.get(i);
    current.display();
    if (current.move()) {
      titleCircles.remove(i);
      i--;
    }
  }
}
