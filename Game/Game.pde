import java.util.Arrays;

Map m; 
PFont bubble;
PFont ptmono;
Player player = new Player();
PlayerTank tank = player.getTank();
int bossesKilled = 0;

ArrayList<BubbleBullet> allBullets;
boolean useMouse = false;
int menuSetting = 1;
float centerX = 350;
float centerY = 350;
int difficulty = 0;
int bubbleTick = 1;
MenuPages pages = new MenuPages();
ArrayList<TitleBubble> titleCircles;
ArrayList<Bubble> allBubbles;
int mapSize;
float selected;
int maxID=0;
PImage imgUp;
PImage imgDown;
PImage imgLeft;
PImage imgRight;

boolean showMap = false;
float maprad = 40;

boolean playerLevelUp = false; 

void setup() {
  size(700, 800);
  fill(200);
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
  imgUp = loadImage("sandUp.png");
  imgDown = loadImage("sandDown.png");
  imgLeft = loadImage("sandLeft.png");
  imgRight = loadImage("sandRight.png");
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
    pages.title();
  } else if (menuSetting == 2) {
    pages.difficulty();
  } else if (menuSetting == 3) {
    pages.mapsize();
  } else if (menuSetting == 4) {
    pages.mouseuse();
  } else if (menuSetting == 5) {
    pages.mapsettings();
  } else if (menuSetting == 6) {
    pages.instructions();
  } else if (menuSetting == 0){
     pages.win(); 
  }else if (menuSetting == -1){
     pages.lose(); 
  }
  else {
    if (bossesKilled == 3){
       menuSetting = 0; 
    }
    if (tank.getHealth()==0){
       menuSetting = -1; 
    }
    background(0, 72, 110);
    fill(0);
    strokeWeight(1);  
    if (tank.getHasTransfered()) {
      allBullets.clear();
    }
    player.levelUp();
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
    m.spawnBoss();
    drawEnemies(tank.getX(), tank.getY());
    tank.display();
    tank.move(m);
    drawBullets(tank.getX(), tank.getY());
    if (useMouse) {
      tank.realignDirection(mouseX, mouseY);
    }

    drawShading(tank.getX(), tank.getY());
    drawBubbles(tank.getX(), tank.getY());
    fill(1, 135, 155, 100);
    strokeWeight(5);
    stroke(255, 100);
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
    if (player.getLevel()==25) {
      percentPoint = 1;
    }

    fill(72, 139, 73);
    noStroke();
    rect(26.5, 721.5, percentHealth*197.5, 17.5);

    fill(3, 64, 120);
    noStroke();
    rect(26.5, 761.5, percentPoint *197.5, 17.5);

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
    if (player.getLevel()==25) {
      textAlign(RIGHT);
      textFont(ptmono);
      textSize(12); 
      text("MAX", 20 + (int)(percentPoint*200), 776);
    } else if (percentPoint > 0.66) {
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
    int[][] coolDowns = tank.getCoolDowns();
    // first
    fill(147, 202, 229);
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(285, 750, 50, 50);

    fill(255); 
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(285, 750, 40, 40);

    if (tank.getMissile()>0) {
      if ((float)coolDowns[3][0]/coolDowns[3][1] == 0) {
        fill(121, 114, 130, 200);
        noStroke();
        ellipse(286, 750, 23, 23);
        ellipse(297, 760, 9, 9);
        ellipse(275, 760, 9, 9);
      }
      fill(10, 110, 162, 255-255*(float)coolDowns[3][0]/coolDowns[3][1]);
      textAlign(CENTER);
      textFont(bubble);
      textSize(24); 
      text("1", 286, 750 + 7.5);
    }


    // second
    fill(147, 202, 229);
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(365, 750, 50, 50);

    // fill(147,202,229,opacityone * 255);
    fill(255); 
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(365, 750, 40, 40);

    if (tank.getStunBurst()>0) {
      if ((float)coolDowns[4][0]/coolDowns[4][1] == 0) {
        fill(214, 149, 9, 100);
        noStroke();
        ellipse(365, 750, 25, 25);
      }
      fill(10, 110, 162, 255-255*(float)coolDowns[4][0]/coolDowns[4][1]);
      textAlign(CENTER);
      textFont(bubble);
      textSize(24); 
      text("2", 366, 750 + 7.5);
    }

    // third
    fill(147, 202, 229);
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(445, 750, 50, 50);

    // fill(147,202,229,opacityone * 255);
    fill(255); 
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(445, 750, 40, 40);

    if (tank.getAreaBlast()>0) {
      if ((float)coolDowns[5][0]/coolDowns[5][1] == 0) {
        fill(213, 77, 8, 200);
        noStroke();
        for (int i=0; i<8; i++) {
          ellipse(445+14*cos(i*PI/4), 750+14*sin(i*PI/4), 8, 8);
        }
      }
      fill(10, 110, 162, 255-255*(float)coolDowns[5][0]/coolDowns[5][1]);
      textAlign(CENTER);
      textFont(bubble);
      textSize(24); 
      text("3", 446, 750 + 7.5);
    }

    // fourth
    fill(147, 202, 229);
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(525, 750, 50, 50);

    // fill(147,202,229,opacityone * 255);
    fill(255); 
    strokeWeight(2.5);
    stroke(179, 217, 236);
    ellipse(525, 750, 40, 40);

    fill(147, 202, 255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); 
    if (tank.getAttack()>0) {
      if ((float)coolDowns[6][0]/coolDowns[6][1] == 0) {
        fill(195, 144, 163, 200);
        noStroke();
        ellipse(526, 750, 25, 25);
      }
      fill(10, 110, 162, 255-255*(float)coolDowns[6][0]/coolDowns[6][1]);
      textAlign(CENTER);
      textFont(bubble);
      textSize(24); 
      text("4", 526, 750 + 7.5);
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

      if (m.getHasBoss()) {
        fill(147, 61, 215);
        noStroke();
        ellipse(675, 725, 20, 20);
      }

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

      int playerLevel = player.getLevel();
      if (playerLevelUp) {
        if (playerLevel % 2 == 1 && playerLevel != 11) {
          pages.upgradeodd();
        }
        if (playerLevel % 2 == 0 && playerLevel != 11) {
          pages.upgradeeven();
        }
        if (playerLevel == 11) {
          pages.upgradeSuper();
        }
      }
      if (showMap) {
        pages.showmap();
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
  if (!tank.getPreventControl()) {
    boolean[] available = m.getCurrentRoom().getAvailable();
    if (!available[0]) {
      image(imgRight, 830, -1000, 300, 2000);
      fill(0, 72, 110);
      noStroke();
      rect(800, -1000, 100, 1400);
    }
    if (!available[1]) {
      image(imgDown, -850, 830, 2000, 300);
      fill(0, 72, 110);
      noStroke();
      rect(-800, 800, 1400, 100);
    }
    if (!available[2]) {
      image(imgLeft, -1100, -850, 300, 2000);
      fill(0, 72, 110);
      noStroke();
      rect(-900, -1000, 100, 1400);
    }
    if (!available[3]) {
      image(imgUp, -850, -1100, 2000, 300);
      fill(0, 72, 110);
      noStroke();
      rect(-800, -900, 1400, 100);
    }
  }
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
    if (!showMap && !playerLevelUp) {
      currentBubble.move(tank.getX(), tank.getY());
    }
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
    if (!showMap&& !playerLevelUp) {
      if (!current.move()) {
        allBullets.remove(i);
        i--;
      } else if (current.getId()==0) {
        if (m.getCurrentRoom().toString().equals("boss")&&m.getHasBoss()) {
          BossRoom bRoom = (BossRoom)m.getCurrentRoom();
          BubbleTank boss = bRoom.getBoss();
          if (boss!=null) {
            for (int k=0; k<boss.getBlocks().size(); k++) {
              BubbleBlock currentBlock = boss.getBlocks().get(k);
              if (dist(current.getX(), current.getY(), currentBlock.getX(), currentBlock.getY())<current.getRadius()+currentBlock.getRadius()) {
                if (current.toString().equals("stun")) {
                  StunBullet stunner = (StunBullet)current;
                  boss.stun(stunner.getStunTime());
                }
                if (!current.toString().equals("super")) {
                  boss.incrementHealth(-2*current.getRadius());
                  allBullets.remove(i);
                  i--;
                  k=boss.getBlocks().size();
                }
              }
            }
          }
        }
        ArrayList<EnemyTank> enemies = m.getCurrentRoom().getEnemies();
        for (int j=0; j<enemies.size(); j++) {
          EnemyTank currentEnemy = enemies.get(j);
          for (int k=0; k<currentEnemy.getBlocks().size(); k++) {
            BubbleBlock currentBlock = currentEnemy.getBlocks().get(k);
            if (dist(current.getX(), current.getY(), currentBlock.getX(), currentBlock.getY())<current.getRadius()+currentBlock.getRadius()) {
              if (current.toString().equals("stun")) {
                StunBullet stunner = (StunBullet)current;
                currentEnemy.stun(stunner.getStunTime());
              }
              if (!current.toString().equals("super")) {
                currentEnemy.incrementHealth(-2*current.getRadius());
                allBullets.remove(i);
                i--;
                k=currentEnemy.getBlocks().size();
                j=enemies.size();
              }
            }
          }
        }
      } else if (current.getId() != 0) {
        for (int k=0; k<tank.getBlocks().size(); k++) {
          BubbleBlock currentBlock = tank.getBlocks().get(k);
          if (dist(current.getX(), current.getY(), currentBlock.getX()-350+tank.getX(), currentBlock.getY()-350+tank.getY())<current.getRadius()+currentBlock.getRadius()) {
            tank.incrementHealth(-2*current.getRadius());
            if (current.toString().equals("stun")) {
              StunBullet stunner = (StunBullet)current;
              tank.stun(stunner.getStunTime());
            }
            allBullets.remove(i);
            i--;
            k=tank.getBlocks().size();
          }
        }
      }
    }
  }
  popMatrix();
}

void drawEnemies(float xOffset, float yOffset) {
  pushMatrix();
  translate(-xOffset+350, -yOffset+350);
  Room currentRoom = m.getCurrentRoom();
  ArrayList<EnemyTank> enemies = currentRoom.getEnemies();
  BubbleTank boss;
  BossRoom bRoom;
  if (currentRoom.toString().equals("boss") &&m.getHasBoss()) {
    bRoom = (BossRoom)currentRoom;
    boss = bRoom.getBoss();
    if (boss!=null&&boss.getHealth() == 0) {
      for (Bubble b : allBubbles) {
        b.setClearState(true);
      }
    }
    if (boss!=null&&!showMap&& !playerLevelUp) {
      boss.move(m);
    }
    if (boss != null) {
      boss.display();
    }
  }
  if (enemies.size() == 0) {
    for (Bubble b : allBubbles) {
      b.setClearState(true);
    }
  }
  for (int i=0; i<enemies.size(); i++) {
    EnemyTank currentEnemy = enemies.get(i);
    if (!showMap&& !playerLevelUp) {
      currentEnemy.spawnBullets(allBullets);
      currentEnemy.setDirection(tank.getX(), tank.getY());
      currentEnemy.move();
    }
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
  if (useMouse) {
    if (keyCode != 37 && keyCode != 39) {
      tank.setMovement(keyCode, 1);
    }
  } else {
    tank.setMovement(keyCode, 1);
  }
  if (keyCode == 86) {
    showMap = !showMap;
  }
  if (keyCode == 49) { // 1
    tank.activateMissile();
  }
  if (keyCode == 50) { // 2
    tank.activateStun();
  }
  if (keyCode == 51) { // 3  
    tank.activateAreaBurst();
  }
  if (keyCode == 52) { // 4
    tank.activateSuper();
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
  } else if (showMap) {
    showMap = false;
  } else if (mouseX > 575 && mouseX < 675 && mouseY > 725 && mouseY < 775 && !showMap) {
    showMap = true;
  }
  // player leveled up > options
  else if (playerLevelUp && player.getLevel()< 26) { // (player.canUpgrade()) {
    // odd levels
    if (player.getLevel() % 2 == 1 && player.getLevel() != 11) {
      if (mouseX > 150 && mouseX < 270 && mouseY > 150 && mouseY < 550) { // for blaster
        if (tank.addBlaster()) {
          playerLevelUp = false;
        }
      }
      if (mouseX > 300 && mouseX < 420 && mouseY > 150 && mouseY < 550) { // for cannon
        if (tank.addCannon()) {
          playerLevelUp = false;
        }
      }
      if (mouseX > 450 && mouseX < 550 && mouseY > 150 && mouseY < 550) { // for machine gun
        if (tank.addMachineGun()) { 
          playerLevelUp = false;
        }
      }
    }
    // even levels
    if (player.getLevel() % 2 == 0 && player.getLevel() != 11) {
      if (mouseX > 150 && mouseX < 270 && mouseY > 150 && mouseY < 550) { // for missile
        if (tank.addMissile()) {
          playerLevelUp = false;
        }
      }
      if (mouseX > 300 && mouseX < 420 && mouseY > 150 && mouseY < 550) { // for stun
        if ( tank.addStunBurst()) {
          playerLevelUp = false;
        }
      }
      if (mouseX > 450 && mouseX < 550 && mouseY > 150 && mouseY < 550) { // for area blast
        if ( tank.addAreaBlast()) { 
          playerLevelUp = false;
        }
      }
    }
    // level 10 (aka super attack)
    if (player.getLevel() == 11) {
      if (mouseX > 150 && mouseX < 270 && mouseY > 150 && mouseY < 550) { // for missile
        tank.addSuperAttack(1);
        playerLevelUp = false;
      }
      if (mouseX > 300 && mouseX < 420 && mouseY > 150 && mouseY < 550) { // for stun
        tank.addSuperAttack(2);
        playerLevelUp = false;
      }
      if (mouseX > 450 && mouseX < 550 && mouseY > 150 && mouseY < 550) { // for area burst
        tank.addSuperAttack(3);
        playerLevelUp = false;
      }
    }
  }
  if (menuSetting <1  ){
     if (mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555){
        menuSetting = 1;
        bossesKilled = 0;
        player = new Player();
        tank = player.getTank();
     }
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
