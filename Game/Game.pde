Map m; 
// Room[] menu;
// boolean inMenu = true; // when you finish the menu, it'll set it to false and you'll be able to move around 

String currentRoom; // for testing

float x, y;

PFont bubble;
PFont ptmono;

void setup() {
  size(700,750); // the background
  background(178, 207, 255);
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  x = 350; // sets the initial coordinates
  y = 350; // to the center of the Room
    
  bubble = createFont("silkscreen.ttf", 72);
  ptmono = createFont("ptmono.ttf", 12);
  
  m = new Map(5); // 3 x 3

  // System.out.println(m.currentRoomR() + ", " + m.currentRoomC()); // for testing
  
}

void draw() {
  size(700,750); // the background
  background(178, 207, 255);
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  fill(255); // "player"
  ellipse(x,y,20,20);
  
  fill(255);
  currentRoom = m.currentRoomR() + ", " + m.currentRoomC(); // coords of room
  textAlign(LEFT);
  textFont(ptmono);
  text(currentRoom,10,20); // for testing
    
  //title();
  difficulty();
  
  direction();
}

void direction() { // for testing / indicating what direction the room you're trying to move to is in
  if (y < 11) {
    textAlign(LEFT);
    textFont(ptmono);
    text("above",10,40);
  }
  if (x < 11) {
    textAlign(LEFT);
    textFont(ptmono);
    text("left",10,40);
  }
  if (y > 689) {
    textAlign(LEFT);
    textFont(ptmono);
    text("down",10,40);
  }
  if (x > 689) {
    textAlign(LEFT);
    textFont(ptmono);
    text("right",10,40);
  } 
}

void keyPressed() { // for moving around
  if (keyCode == 87) { // w (up)
    if (y > 10) {
      y -= 20;
    }
  }
  if (keyCode == 65) { // a (left)
    if (x > 10) {
      x -= 20;
    }
  }
  if (keyCode == 83) { // s (down)
    if (y < 690) {
      y += 20;
    }
  }
  if (keyCode == 68) { // d (right)
    if (x < 690) {
      x += 20;
    }
  }
  
  m.switchR(); // for switching rooms
}

void title() {
  size(700,750); // the background
  background(178, 207, 255);
  
  bubbles();
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
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
  }

}

void difficulty() {
  size(700,750); // the background
  background(178, 207, 255);
  
  bubbles();
  
  fill(0); // bar designated for health, exp, etc. 
  rect(0,700,700,50);
  
  fill(255);
  textAlign(CENTER);
  textFont(bubble);
  text("difficulty", 350, 150); // starts at 207 ends at 250
  // text("bubble tanks", 350, 365); // center of screen

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
  }
  
  fill(242, 245, 252);
  noStroke();
  rect(200,511,300,69);
  
  fill(178, 207, 255, 225);
  textAlign(CENTER);
  textFont(bubble);
  textSize(48); // 29
  text("save me", 350, 558); // starts at 529 ends at 558

  if (mouseX > 200 && mouseX < 500 && mouseY > 511 && mouseY < 578) { // for save me
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
    text("save me", 350, 558); // starts at 529 ends at 558
  }
}



void bubbles() { // reusable!! 
  frameRate(4);
  for (int i = 5; i < 9; i++) {
    for (int j = 5; j < 9; j++) {
      float r = random(70) + 20 + random(5);
      fill(250, random(150) + 100);
      noStroke();
      ellipse((i * (random(105)) + random(15)) % 690,(j * (random(105)) + random(15)) % 690,r,r);
    }
  }
}
