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
int bubbleTick = 1;
MenuPages mt = new MenuPages();
ArrayList<TitleBubble> titleCircles;
int mapSize;
float selected;
boolean showMap = false;
float maprad = 40;

// stuff for health and bubblepoints 
float health = 25;
float maxhealth = 100;
float percentHealth = (health / maxhealth) * 200;
float bubblepoints = 90;
float maxbp = 100;
float percentbp = (bubblepoints / maxbp) * 200;

void setup() {
  size(700, 800);
  background(39, 150, 203);
  fill(200);
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
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
    mt.title();
  } else if (menuSetting == 2) {
    mt.difficulty();
  } else if (menuSetting == 3) {
    mt.mapsize();
  } else if (menuSetting == 4) {
    mt.mouseuse();
  } else if (menuSetting == 5) {
    mt.mapsettings();
  } else if (menuSetting == 6) {
    mt.instructions();
  } else {
    background(200);
    fill(0);
    strokeWeight(1);
    
    if(tank.getHasTransfered()){
       allBullets.clear(); 
    }
    tank.spawnBullets(allBullets);
    drawMap(tank.getX(), tank.getY());
    fill(6, 153, 173);
    stroke(195, 234, 250);
    strokeWeight(5);
    ellipse(350, 350, 7*tank.getRadius(), 7*tank.getRadius());
    noStroke();
    pushMatrix();
    translate(-tank.getX()+350,-tank.getY()+350);
    ellipse(0,0,1995,1995);
    popMatrix();
    tank.display();
    tank.move(m);
    drawBullets(tank.getX(), tank.getY());
    if (useMouse) {
      tank.realignDirection(mouseX, mouseY);
    }
    
    fill(200);
    rect(0, 700, 700, 100);
    
    fill(46,89,47);
    strokeWeight(3);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(46,89,47);
    rect(25, 720, 200, 20);
    
    fill(1,24,45);
    strokeWeight(3);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(1,24,45);
    rect(25, 760, 200, 20);
    
    fill(72,139,73);
    noStroke();
    rect(26.5, 721.5, percentHealth - 2.5, 17.5);
    
    fill(3,64,120);
    noStroke();
    rect(26.5, 761.5, percentbp - 2.5, 17.5);
    
    // test for health
    fill(255);
    if (percentHealth > 66) {
      textAlign(RIGHT);
      textFont(ptmono);
      textSize(12); 
      text(int(percentHealth / 2) + "%", 20 + percentHealth, 736); 
    }
    else {
      textAlign(LEFT);
      textFont(ptmono);
      textSize(12); 
      text(int(percentHealth / 2) + "%", 26.5 + percentHealth, 736); 
    }
    
    // text for bubble points
    fill(255);
    if (percentbp > 66) {
      textAlign(RIGHT);
      textFont(ptmono);
      textSize(12); 
      text(int(percentbp / 2) + "%", 20 + percentbp, 776); 
    }
    else {
      textAlign(LEFT);
      textFont(ptmono);
      textSize(12); 
      text(int(percentbp / 2) + "%", 26.5 + percentbp, 776); 
    }
  
  // map button 
  if (menuSetting > 6) {
    fill(242, 245, 252);
    noStroke();
    rect(575, 725, 100, 50);
    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(30);
    text("map", 625, 759); 
  
    if (mouseX > 575 && mouseX < 675 && mouseY > 725 && mouseY < 775) { // for easy
      fill(211,234,244);
      strokeWeight(5);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(255);
      rect(575, 725, 100, 50);
  
      fill(255);
      textAlign(CENTER);
      textFont(bubble);
      textSize(30); 
      text("map", 625, 759);
    }
    
    if (showMap) {
      mt.showmap();
    }
  }
  }
  
}

void drawMap(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  stroke(195, 234, 250);
  strokeWeight(5);
  fill(6, 153, 173);
  ellipse(0, 0, 2000, 2000);
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
  if (keyCode == 76) {
    difficulty = 1;
    mapSize = 5;
    useMouse = true;
    m = new Map(5);
    menuSetting =6;
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
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 4;
    }
  }
  else if (menuSetting == 6) {
    if (!(mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70)) {
      menuSetting = 7;
      m = new Map(mapSize);
    }
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 5;
    }
  }
  else if (showMap) {
    showMap = false; 
  }
  else if (mouseX > 575 && mouseX < 675 && mouseY > 725 && mouseY < 775 && !showMap) {
      showMap = true;
  }
}

void bubbles() { // reusable!!
  bubbleTick++;
  if (bubbleTick % 10 == 0) {
    titleCircles.add(new TitleBubble(random(700), random(10)+1, random(20))); 
    bubbleTick = 1;
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
