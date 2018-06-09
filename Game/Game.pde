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
ArrayList<Bubble> allBubbles;
int mapSize;
float selected;
boolean showMap = false;
float maprad = 40;
int maxID=0;

void setup() {
  size(700, 800);
  background(39, 150, 203);
  fill(200);
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
  allBullets = new ArrayList<BubbleBullet>();
  titleCircles = new ArrayList<TitleBubble>();
  allBubbles = new ArrayList<Bubble>();
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
    if (tank.getHasTransfered()) {
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
    translate(-tank.getX()+350, -tank.getY()+350);
    ellipse(0, 0, 1495, 1495);
    popMatrix();
    drawEnemies(tank.getX(), tank.getY());
    tank.display();
    tank.move(m);
    drawBullets(tank.getX(), tank.getY());
    if (useMouse) {
      tank.realignDirection(mouseX, mouseY);
    }
    drawShading(tank.getX(), tank.getY());
    drawBubbles(tank.getX(), tank.getY());
    fill(200);
    rect(0, 700, 700, 100);
    fill(0);
    rect(30, 720, 300, 35);  
    rect(30, 760, 300, 35);  
    fill(251, 31, 50);
    rect(30, 720, 300*(tank.getHealth()/tank.getMaxHealth()), 35);
    fill(20, 54, 129);
    rect(30, 760, 300*((float)player.getPoints()/player.getMaxPoints()), 35);
    fill(200);
    rect(0, 700, 700, 100);

    fill(46, 89, 47);
    strokeWeight(3);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(46, 89, 47);
    rect(25, 720, 200, 20);

    fill(1, 24, 45);
    strokeWeight(3);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(1, 24, 45);
    rect(25, 760, 200, 20);

    float percentPoint = (float)player.getPoints()/ player.getMaxPoints();
    float percentHealth = tank.getHealth() / tank.getMaxHealth();

    fill(72, 139, 73);
    noStroke();
    rect(26.5, 721.5, percentHealth*197, 17.5);

    fill(3, 64, 120);
    noStroke();
    rect(26.5, 761.5, percentPoint *197, 17.5);

    // test for health
    fill(255);
    if (percentHealth > 0.66) {
      textAlign(RIGHT);
      textFont(ptmono);
      textSize(12); 
      text((int)(percentHealth*100) + "%", 20 + (int)(percentHealth*200), 736);
    } else {
      textAlign(LEFT);
      textFont(ptmono);
      textSize(12); 
      text((int)(percentHealth*100) + "%", 26.5 + (int)(percentHealth*200), 736);
    }

    // text for bubble points
    fill(255);
    if (percentPoint > 0.66) {
      textAlign(RIGHT);
      textFont(ptmono);
      textSize(12); 
      text((int)(percentPoint*100) + "%", 20 + (int)(percentPoint*200), 776);
    } else {
      textAlign(LEFT);
      textFont(ptmono);
      textSize(12);
      text((int)(percentPoint*100) + "%", 26.5 + (int)(percentPoint*200), 776);
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
        fill(211, 234, 244);
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
  ellipse(0, 0, 1500, 1500);
  popMatrix();
}  

void drawShading(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  strokeWeight(0);
  fill(255, 70);
  ellipse(-151, -464, 187.5, 187.5);
  ellipse(-422, -244, 250, 250);
  fill(255, 40);
  ellipse(390, 225, 250, 250);
  ellipse(139, 428, 187.5, 187.5);
  popMatrix();
}

void drawBubbles(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  for (int i=0; i<allBubbles.size(); i++) {
    Bubble currentBubble = allBubbles.get(i);
    currentBubble.move(tank.getX(), tank.getY());
    currentBubble.display();
    if (dist(currentBubble.getX(), currentBubble.getY(), tank.getX(), tank.getY())<tank.getRadius()+currentBubble.getRadius()) {
      player.addPoints((int)currentBubble.getRadius());
      tank.incrementHealth(currentBubble.getRadius());
      allBubbles.remove(i);
      i--;
    }
  }
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
    } else if (current.getId()==0) {
      ArrayList<EnemyTank> enemies = m.getCurrentRoom().getEnemies();
      for (int j=0; j<enemies.size(); j++) {
        EnemyTank currentEnemy = enemies.get(j);
        for (int k=0; k<currentEnemy.getBlocks().size(); k++) {
          BubbleBlock currentBlock = currentEnemy.getBlocks().get(k);
          if (dist(current.getX(), current.getY(), currentBlock.getX(), currentBlock.getY())<current.getRadius()+currentBlock.getRadius()) {
            currentEnemy.incrementHealth(-2*current.getRadius());
            allBullets.remove(i);
            i--;
            k=currentEnemy.getBlocks().size();
            j=enemies.size();
          }
        }
      }
    } else if (current.getId() != 0) {
      for (int k=0; k<tank.getBlocks().size(); k++) {
        BubbleBlock currentBlock = tank.getBlocks().get(k);
        if (dist(current.getX(), current.getY(), currentBlock.getX()-350+tank.getX(), currentBlock.getY()-350+tank.getY())<current.getRadius()+currentBlock.getRadius()) {
          tank.incrementHealth(-2*current.getRadius());
          allBullets.remove(i);
          i--;
          k=tank.getBlocks().size();
        }
      }
    }
  }
  popMatrix();
}

void drawEnemies(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  ArrayList<EnemyTank> enemies = m.getCurrentRoom().getEnemies();
  if (enemies.size() == 0) {
    for (Bubble b : allBubbles) {
      b.setClearState(true);
    }
  }
  for (int i=0; i<enemies.size(); i++) {
    EnemyTank currentEnemy = enemies.get(i);
    currentEnemy.spawnBullets(allBullets);
    currentEnemy.setDirection(tank.getX(), tank.getY());
    currentEnemy.move();
    currentEnemy.display();
    if (currentEnemy.getHealth()<=0) {
      currentEnemy.spawnBubbles(allBubbles);
      enemies.remove(i);
      i--;
    }
  }
  popMatrix();
}

void keyPressed() {
  if (keyCode==222) {
    tank.updatedType();
  }
  if (useMouse) {
    if (keyCode != 37 && keyCode != 39) {
      tank.setMovement(keyCode, 1);
    }
  } else {
    tank.setMovement(keyCode, 1);
  }
  if (keyCode == 76) {
    difficulty = 1;
    mapSize = 19;
    useMouse = true;
    m = new Map(19, difficulty);
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
  } else if (menuSetting == 6) {
    if (!(mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70)) {
      menuSetting = 7;
      m = new Map(mapSize, difficulty);
    }
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      menuSetting = 5;
    }
  } else if (showMap) {
    showMap = false;
  } else if (mouseX > 575 && mouseX < 675 && mouseY > 725 && mouseY < 775 && !showMap) {
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
