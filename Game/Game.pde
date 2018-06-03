Map m; 
PFont bubble;
PFont ptmono;
Player player = new Player();
BubbleTank tank = player.getTank();
ArrayList<BubbleBullet> allBullets;
boolean useMouse = false;
float centerX = 350;
float centerY = 350;

boolean menu = true;
boolean editting = false;
int menupage = 0; 
int edit = -1;
float selected = -500; // for map size

String selectedDifficulty;
int selectedSize;


void setup() {
  size(700, 800);
  background(178, 207, 255);
  fill(200);
  rect(0, 700, 700, 100);
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
  m = new Map(5);
  allBullets = new ArrayList<BubbleBullet>();
}

void draw() {
  background(200);
  fill(0);
  
  frameRate(40);
  
  tank.spawnBullets(allBullets);
  drawMap(tank.getX(), tank.getY());
  tank.display();
  tank.move();
  drawBullets(tank.getX(), tank.getY());
  if (useMouse) {
    tank.realignDirection(mouseX, mouseY);
  }
  
  fill(200);
  noStroke();
  rect(0, 700, 700, 100);
  
  if (menu) {
    if (menupage == 0) {
      title();
    }
    if (menupage == 1) {
      mouseuse();
    }
    if (menupage == 2) {
      difficulty();
    }
    if (menupage == 3) {
      mapsize();
    }
    if (menupage == 4) {
      mapsettings();
    }
  }
    
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

void title() {
  background(178, 207, 255);
  
  bubbles();
  
  fill(200); // bar designated for health, exp, etc. 
  noStroke();
  rect(0, 700, 700, 100);
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("bubble tanks", 350, 250); // starts at 207 ends at 250
      
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  textSize(36); 
  text("team bubb ling", 350, 300); 

  fill(242, 245, 252);
  noStroke();
  rect(200,450,300,105);
    
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("start", 350, 517); // starts at 488 ends at 517

  if (mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555) {
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,450,300,105);
    
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("start", 350, 517); // starts at 488 ends at 517
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      menupage++;
    }
  }

}

void difficulty() {
  background(178, 207, 255);
  
  bubbles();
  
  fill(200); // bar designated for health, exp, etc. 
  rect(0, 700, 700, 100);
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("difficulty", 350, 150); // starts at 207 ends at 250

  fill(242, 245, 252);
  noStroke();
  rect(200,242,300,69);
    
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("easy", 350, 291); // starts at 262 ends at 291
  
  if (mouseX > 200 && mouseX < 500 && mouseY > 242 && mouseY < 321) { // for easy
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,242,300,69);
      
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("easy", 350, 291);
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      selectedDifficulty = "easy";
      menupage++;
    }
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(200,331,300,69);
    
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("normal", 350, 380); // starts at 351 ends at 380
  
  if (mouseX > 200 && mouseX < 500 && mouseY > 331 && mouseY < 400) { // for normal
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,331,300,69);
      
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("normal", 350, 380); // starts at 351 ends at 380
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      selectedDifficulty = "normal";
      menupage++;
    }
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(200,420,300,69);
  
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("hard", 350, 469); // starts at 440 ends at 469
  
  if (mouseX > 200 && mouseX < 500 && mouseY > 420 && mouseY < 489) { // for hard
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,420,300,69);
  
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("hard", 350, 469); // starts at 440 ends at 469
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      selectedDifficulty = "hard";
      menupage++;
    }
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(200,511,300,69);
  
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("insane", 350, 558); // starts at 529 ends at 558

  if (mouseX > 200 && mouseX < 500 && mouseY > 511 && mouseY < 578) { // for insane
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,511,300,69);
  
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("insane", 350, 558); // starts at 529 ends at 558
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      selectedDifficulty = "insane";
      menupage++;
    }
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(10,10,100,50);
  
  fill(178, 207, 255, 225);
  textAlign(LEFT);
  textFont(bubble);
  textSize(30); // 29
  text("back", 17, 45);
  
  if (mouseX > 10 && mouseX < 110 && mouseY > 10 && mouseY < 60) { // for back    fill(255);
    fill(255);
    noStroke();
    rect(10,10,100,50);
    
    fill(178, 207, 255);
    textAlign(LEFT);
    textFont(bubble);
    textSize(30); // 29
    text("back", 17, 45);
    
    if (mousePressed) {
      menupage--;
    }
  }
  
}

void mouseuse() {
  background(178, 207, 255);
  
  bubbles();
  
  fill(200); // bar designated for health, exp, etc. 
  rect(0, 700, 700, 100);
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("mouse use", 350, 150); // starts at 207 ends at 250

  fill(242, 245, 252);
  noStroke();
  rect(200,292,300,69);
    
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("yes", 350, 341); // starts at 262 ends at 291
  
  if (mouseX > 200 && mouseX < 500 && mouseY > 292 && mouseY < 371) { // for yes
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,292,300,69);
      
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("yes", 350, 341);
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      useMouse = true;
      menupage++;
    }
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(200,381,300,69);
    
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("no", 350, 430); // starts at 351 ends at 380
  
  if (mouseX > 200 && mouseX < 500 && mouseY > 381 && mouseY < 450) { // for no
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,381,300,69);
      
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("no", 350, 430); // starts at 351 ends at 380
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      useMouse = false;
      menupage++;
    }
  }
}

void mapsize() {  
  background(178, 207, 255);
  
  bubbles();
  
  fill(200); // bar designated for health, exp, etc. 
  noStroke();
  rect(0, 700, 700, 100);
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("map size", 350, 150); // starts at 107 ends at 150
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
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
    ellipse(xsize,225,40,40);
    
    fill(255); // little circle (changes colors and stuff)
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(xsize,225,20,20);

    fill(255); // size
    textAlign(CENTER);
    textFont(bubble);
    textSize(24); 
    text(num, xsize, 275);
  }
  
  if (mouseX > 64.5 && mouseX < 110.5 && mouseY > 200 && mouseY < 250) { // 5
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(87.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 5;
      selected = 87.5;
    }
  }
  
  if (mouseX > 139.5 && mouseX < 185.5 && mouseY > 200 && mouseY < 250) { // 7
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(162.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 7;
      selected = 162.5;
    }
  }
  
  if (mouseX > 214.5 && mouseX < 260.5 && mouseY > 200 && mouseY < 250) { // 9
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(237.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 9;
      selected = 237.5;
    }
  }
  
  if (mouseX > 289.5 && mouseX < 335.5 && mouseY > 200 && mouseY < 250) { // 11
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(312.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 11;
      selected = 312.5;
    }
  }
  
  if (mouseX > 364.5 && mouseX < 410.5 && mouseY > 200 && mouseY < 250) { // 13
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(387.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 13;
      selected = 387.5;
    }
  }
  
  if (mouseX > 439.5 && mouseX < 485.5 && mouseY > 200 && mouseY < 250) { // 15
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(462.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 15;
      selected = 462.5;
    }
  }
  
  if (mouseX > 514.5 && mouseX < 560.5 && mouseY > 200 && mouseY < 250) { // 17
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(537.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 17;
      selected = 537.5;
    }
  }
  
  if (mouseX > 589.5 && mouseX < 635.5 && mouseY > 200 && mouseY < 250) { // 19
    fill(224,235,255);
    strokeWeight(6);
    stroke(178, 207, 255);
    ellipse(612.5,225,20,20);
    
    if (mousePressed) {
      selectedSize = 19;
      selected = 612.5;
    }
  }

  if (selected > 0) { // if you chose something
    fill(178, 207, 255); // little circle (changes color while hovering)
    strokeWeight(6);
    stroke(224,235,255);
    ellipse(selected,225,20,20);

    fill(242, 245, 252); // button to move to next page
    noStroke();
    rect(200,360,300,69);
    
    fill(178, 207, 255, 225); // button to move to next page
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("ok", 350, 407);
  
    if (mouseX > 200 && mouseX < 500 && mouseY > 360 & mouseY < 429) { 
      fill(224,235,255);
      strokeWeight(5);
      strokeJoin(MITER);
      strokeCap(SQUARE);
      stroke(255);
      rect(200,360,300,69);
    
      fill(255);
      textAlign(CENTER);
      textFont(bubble);
      textSize(48); // 29
      text("ok", 350, 407);
      
      // do some stuff to switch to the next menu page
      
      if (mousePressed) {
        menupage++;
      }
    }  
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(10,10,100,50);
  
  fill(178, 207, 255, 225);
  textAlign(LEFT);
  textFont(bubble);
  textSize(30); // 29
  text("back", 17, 45);
  
  if (mouseX > 10 && mouseX < 110 && mouseY > 10 && mouseY < 60) { // for back    fill(255);
    fill(255);
    noStroke();
    rect(10,10,100,50);
    
    fill(178, 207, 255);
    textAlign(LEFT);
    textFont(bubble);
    textSize(30); // 29
    text("back", 17, 45);
    
    if (mousePressed) {
      menupage--;
    }
  }
}

void mapsettings() {  
  background(178, 207, 255);
  
  bubbles();
  
  fill(200); // bar designated for health, exp, etc. 
  noStroke();
  rect(0, 700, 700, 100);
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("map settings", 350, 150); // starts at 107 ends at 150
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  textSize(30);
  text("click to edit", 350, 200);  

  
  fill(255); // difficulty
  textAlign(LEFT);
  textFont(bubble);
  textSize(48); // 29
  text("difficulty", 100, 300);  
  
  fill(255); // selected difficulty
  textAlign(RIGHT);
  textFont(bubble);
  textSize(36); // 29
  text(selectedDifficulty, 600, 300);

  fill(255); // mouse use
  textAlign(LEFT);
  textFont(bubble);
  textSize(48); // 29
  text("mouse use", 100, 350);

  fill(255); // selected mouse use
  textAlign(RIGHT);
  textFont(bubble);
  textSize(36); // 29
  if (useMouse) {
    text("yes", 600, 350);
  }
  if (!useMouse) {
    text("no", 600, 350);
  }

  fill(255); // map size
  textAlign(LEFT);
  textFont(bubble);
  textSize(48); // 29
  text("map size", 100, 400);
  
  fill(255); // selected map size
  textAlign(RIGHT);
  textFont(bubble);
  textSize(36); // 29
  text(selectedSize, 600, 400);
  
  fill(242, 245, 252); // start game
  noStroke();
  rect(200,500,300,105);
  
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("start", 350, 567); // starts at 488 ends at 517

  if (mouseX > 200 && mouseX < 500 && mouseY > 450 && mouseY < 555 && !editting) {
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,500,300,105);
    
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("start", 350, 567); // starts at 488 ends at 517
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      menu = false; // lets you start playing
    }
  }

  fill(242, 245, 252);
  noStroke();
  rect(200,381,300,69);
    
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("no", 350, 430); // starts at 351 ends at 380
  
  if (mouseX > 200 && mouseX < 500 && mouseY > 381 && mouseY < 450) { // for no
    fill(224,235,255);
    strokeWeight(5);
    strokeJoin(MITER);
    strokeCap(SQUARE);
    stroke(255);
    rect(200,381,300,69);
      
    fill(255);
    textAlign(CENTER);
    textFont(bubble);
    textSize(48); // 29
    text("no", 350, 430); // starts at 351 ends at 380
    
    // do some stuff to switch to the next menu page
    
    if (mousePressed) {
      useMouse = false;
      menupage++;
    }
  }

}

void bubbles() { // reusable!! 
  frameRate(4);
  
  for (int i = 5; i < 9; i++) {
    for (int j = 5; j < 9; j++) {
      float r = random(70) + 20 + random(5);
      fill(250, random(150) + 100);
      noStroke();
      ellipse((i * (random(105)) + random(15)) % 700,(j * (random(105)) + random(15)) % 700,r,r);
    }
  }
}
