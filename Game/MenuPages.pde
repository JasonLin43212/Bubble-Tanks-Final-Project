public class MenuPages { 

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
      fill(211, 234, 244);
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
      fill(211, 234, 244);
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
      fill(211, 234, 244);
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
      fill(211, 234, 244);
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
      fill(211, 234, 244);
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
    backbutton();
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
      stroke(168, 213, 234);
      ellipse(xsize, 225, 20, 20);

      fill(255); // size
      textAlign(CENTER);
      textFont(bubble);
      textSize(24); 
      text(num, xsize, 275);
    }

    fill(39, 150, 203, 225);
    strokeWeight(6);
    stroke(168, 213, 234);
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
      fill(39, 150, 203); // little circle (changes color while hovering)
      strokeWeight(6);
      stroke(125, 192, 223);
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
        fill(211, 234, 244);
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
    backbutton();
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
      fill(211, 234, 244);
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
      fill(211, 234, 244);
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
    backbutton();
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
      fill(211, 234, 244);
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
    backbutton();
  }

  void instructions () {
    background(39, 150, 203);
    noStroke();
    bubbles();

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    text("instructions", 350, 150); // starts at 107 ends at 150
    
    textSize(24);
    if (useMouse) {
      text("to move, use\n\n\n\nuse your MOUSE to aim and CLICK to shoot\n\nclick the map button to check\nwhere you've been\nthen click anywhere to exit", 350, 225);
    } else {
      text("to move, use\n\n\n\nuse LEFT and RIGHT arrows to aim\n and SPACE to shoot\n\nclick the V button to toggle the map\n to check where you've been", 350, 225);
    }
    text("fight the other bubble tanks\n\n\nare used for missiles, stun, area burst,\nand your special attack\n\nclick anywhere to start", 350, 545); 
    
    textSize(36);
    text("w\na  s  d\n\n\n\n\n\n1 2 3 4\n", 350, 275);
    textSize(24);

    backbutton();
  }

  void showmap () {
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

    if (m.getHasBoss()) {
      fill(147, 61, 215);
      noStroke();
      ellipse(675, 725, 20, 20);
    }

    fill(255, 155);
    noStroke();
    rect(0, 0, 700, 800);

    fill(255);
    noStroke();
    rect(50, 50, 600, 600);

    float currentR = 120;
    float currentC = 120;
    float maprad = 53;

    if (mapSize == 5) { 
      currentR += 20; 
      currentC += 20;
    }
    if (mapSize == 7) { 
      maprad = 38.5;
    }
    if (mapSize == 9) { 
      currentR -= 21; 
      currentC -= 21; 
      maprad = 31.5;
    }
    if (mapSize == 11) { 
      currentR -= 28; 
      currentC -= 28; 
      maprad = 26;
    }
    if (mapSize == 13) { 
      currentR -= 45; 
      currentC -= 45;
      maprad = 23;
    }
    if (mapSize == 15) { 
      currentR -= 49; 
      currentC -= 49; 
      maprad = 20;
    }
    if (mapSize == 17) { 
      currentR -= 52; 
      currentC -= 52; 
      maprad = 17.7;
    }
    if (mapSize == 19) { 
      currentR -= 52; 
      currentC -= 52;
      maprad = 15.7;
    }

    for (int r = 0; r < mapSize; r++) {
      for (int c = 0; c < mapSize; c++) {
        if (m.currentRoomR() == r && m.currentRoomC() == c) {
          fill(39, 150, 203);
        } else if (m.getRooms()[r][c].toString().equals("boss")) {
          fill(147, 61, 215);
        } else {
          fill(211, 234, 244);
        }
        ellipse(currentC + (maprad*2*c), currentR + (maprad*2*r), maprad, maprad);
        if (r==(mapSize-1)/2 && c==(mapSize-1)/2) {
          if (m.currentRoomR() == r && m.currentRoomC() == c) {
            fill(255);
          } else {
            fill(39, 150, 203);
          }
          textAlign(CENTER);
          textFont(bubble);
          textSize(maprad*0.8); 
          text("S", currentC + (maprad*2*c), currentR + (maprad*2*r)+maprad*0.2);
        }
        if (m.getRooms()[r][c].getEnemies().size() == 0 && !m.getRooms()[r][c].toString().equals("boss")) {
          fill(163, 35, 9);
          textAlign(CENTER);
          textFont(bubble);
          textSize(maprad*0.8); 
          text("X", currentC + (maprad*2*c), currentR + (maprad*2*r)+maprad*0.2);
        }
      }
    }
  }

  void backbutton () {
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
      fill(211, 234, 244);
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

  void upgradeodd() {
    fill(255, 155);
    noStroke();
    rect(0, 0, 700, 800);

    fill(255);
    noStroke();
    rect(100, 100, 500, 500);

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    text("upgrade", 350, 200); 

    if (mouseX > 150 && mouseX < 270 && mouseY > 150 && mouseY < 550) { // for blaster
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(140, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29
    String extraBlaster="";
    if (tank.getBlaster()<4) {
      extraBlaster = ""+(tank.getBlaster()+1);
    }

    if (tank.getBlaster()==4) {
      text("MAXED", 210, 325);
      text("OUT", 210, 350);
      text("BLASTER", 210, 375);
    } else {
      text("blaster\n"+extraBlaster, 210, 300); 
      textAlign(CENTER);
      textSize(18); 
      text("a gun\nthat shoots\nbullets in\nmultiple\ndirections", 210, 370);
    }

    if (mouseX > 300 && mouseX < 420 && mouseY > 150 && mouseY < 550) { // for cannon
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(280, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 2

    String extraCannon="";
    if (tank.getCannon()<4) {
      extraCannon = ""+(tank.getCannon()+1);
    }

    if (tank.getCannon()==4) {
      text("MAXED", 350, 325);
      text("OUT", 350, 350);
      text("CANNON", 350, 375);
    } else {
      text("CANNON\n"+extraCannon, 350, 300); 
      textAlign(CENTER);
      textSize(18); 
      text("a gun\nthat\nshoots\nlarge\nbullets", 350, 370);
    }


    if (mouseX > 450 && mouseX < 550 && mouseY > 150 && mouseY < 550) { // for machine gun
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(420, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29

    String extraMachine="";
    if (tank.getMachineGun()<4) {
      extraMachine = ""+(tank.getMachineGun()+1);
    }

    if (tank.getMachineGun()==4) {
      text("MAXED", 490, 325);
      text("OUT", 490, 350);
      text("machine\ngun", 490, 375);
    } else {
      text("machine\ngun "+extraMachine, 490, 300); 
      textAlign(CENTER);
      textSize(18); 
      text("a gun\nthat\nrapidly\nshoots\na lot of\nbullets", 490, 370);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); 
    text("level: " + player.getLevel(), 350, 575);
  }

  void upgradeeven() {
    fill(255, 155);
    noStroke();
    rect(0, 0, 700, 800);

    fill(255);
    noStroke();
    rect(100, 100, 500, 500);

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    text("upgrade", 350, 200); 

    if (mouseX > 150 && mouseX < 270 && mouseY > 150 && mouseY < 550) { // for blaster
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(140, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29

    String extraMissile="";
    if (tank.getMissile()<4) {
      extraMissile = ""+(tank.getMissile()+1);
    }

    if (tank.getMissile()==4) {
      text("MAXED", 210, 325);
      text("OUT", 210, 350);
      text("missile", 210, 375);
    } else {
      text("missile "+extraMissile, 210, 300); 
      textAlign(CENTER);
      textSize(18); 
      text("bullets\nthat follow\nenemies", 210, 350);
    }

    if (mouseX > 300 && mouseX < 420 && mouseY > 150 && mouseY < 550) { // for cannon
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(280, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29
    String extraStun="";
    if (tank.getStunBurst()<4) {
      extraStun = ""+(tank.getStunBurst()+1);
    }

    if (tank.getStunBurst()==4) {
      text("MAXED", 350, 325);
      text("OUT", 350, 350);
      text("stun\nburst", 350, 380);
    } else {
      text("stun\nburst "+extraStun, 350, 300); 
      textAlign(CENTER);
      textSize(18); 
      text("bullets\nthat\nstun\nenemies", 350, 370);
    }

    if (mouseX > 450 && mouseX < 550 && mouseY > 150 && mouseY < 550) { // for machine gun
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(420, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29
    String extraArea="";
    if (tank.getAreaBlast()<4) {
      extraArea= ""+(tank.getAreaBlast()+1);
    }

    if (tank.getAreaBlast()==4) {
      text("MAXED", 490, 325);
      text("OUT", 490, 350);
      text("area\nblast", 490, 380);
    } else {
      text("area\nblast "+extraArea, 490, 300); 
      textAlign(CENTER);
      textSize(18); 
      text("bullets\nthat\nexplode", 490, 370);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48);
    text("level: " + player.getLevel(), 350, 575);
  }

  void upgradeSuper() { 
    fill(255, 155);
    noStroke();
    rect(0, 0, 700, 800);

    fill(255);
    noStroke();
    rect(100, 100, 500, 500);

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    text("upgrade", 350, 200); 

    if (mouseX > 150 && mouseX < 270 && mouseY > 150 && mouseY < 550) { // for blaster
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(140, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29
    text("super\nmissile", 210, 280); 

    textAlign(CENTER);
    textSize(18); 
    text("bullets\nthat\nfollow\nenemies\nlike they\nowe them\nmoney", 210, 350);

    if (mouseX > 300 && mouseX < 420 && mouseY > 150 && mouseY < 550) { // for cannon
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(280, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29
    text("super\nblaster", 350, 280); 

    textAlign(CENTER);
    textSize(18); 
    text("just\nlike the\noriginal\nblaster,\nbut better", 350, 350);

    if (mouseX > 450 && mouseX < 550 && mouseY > 150 && mouseY < 550) { // for machine gun
      fill(242, 245, 252);
      strokeWeight(7);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(247, 249, 253);
      rect(420, 240, 140, 277);
    }

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); // 29
    text("super\ncannon", 490, 280);

    textAlign(CENTER);
    textSize(18); 
    text("bigger,\nbetter,\neven\nmore\nbullets", 490, 350);

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48);
    text("level: " + player.getLevel(), 350, 575);
  }

  void pause() {
    fill(255, 150);
    rect(0, 0, 700, 700);
    fill(39, 150, 203, 200);
    rect(0, 0, 700, 700);

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    text("game paused", 350, 150); // starts at 207 ends at 250

    fill(255);
    rect(215, 250, 80, 300);
    rect(395, 250, 80, 300);
  }

  void win() {
    background(39, 150, 203);
    noStroke();
    bubbles();

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(84);
    text("you won", 350, 200); 
    textSize(36);
    text("congratulations", 350, 275); 
    text("would you like to", 350, 325); 
    text("play again?", 350, 375); 
    
    fill(242, 245, 252);
    noStroke();
    rect(200, 450, 300, 105);

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("retry", 350, 517); // starts at 488 ends at 517

    if (mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555) {
      fill(211, 234, 244);
      strokeWeight(5);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(255);
      rect(200, 450, 300, 105);

      fill(255);
      textAlign(CENTER);
      textFont(bubble);
      textSize(48); // 29
      text("retry", 350, 517); // starts at 488 ends at 517
    }
  }
  
  void lose(){
    background(39, 150, 203);
    noStroke();
    bubbles();

    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(84);
    text("you lost", 350, 200); 
    textSize(36);
    text("It is really sad", 350, 275); // starts at 207 ends at 250
    text("that you lost the game.", 350, 325); 
    text("try again?", 350, 375); 
    
    fill(242, 245, 252);
    noStroke();
    rect(200, 450, 300, 105);

    fill(39, 150, 203);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("retry", 350, 517); // starts at 488 ends at 517

    if (mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555) {
      fill(211, 234, 244);
      strokeWeight(5);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(255);
      rect(200, 450, 300, 105);

      fill(255);
      textAlign(CENTER);
      textFont(bubble);
      textSize(48); // 29
      text("retry", 350, 517); // starts at 488 ends at 517
    }
  }
}
