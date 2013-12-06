Raindrop[] rains = new Raindrop[2000];
Catchers catchers;
int numberofcatches, numberofloses, gameChanger;
PImage net;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER);
  rectMode(CENTER);
  textSize(30);
  net = loadImage("Net.png");
  gameChanger = 0;
  catchers = new Catchers();
  for (int i = 0; i < rains.length; i++) {
    rains[i] = new Raindrop();
  }
}

void draw() {
  //this shows the game over screen
  if (numberofloses >= 5000) {
    gameChanger = 2;
  }
  //this is the start screen
  if (gameChanger == 0) {
    background(0);
    image(net, width/2, height/2);
    fill(140, 100, 100);
    rect(width/2, 3*height/4, 200, 100, 25);
    fill(230, 100, 100);
    rect(width/2, 3*height/4, 175, 75, 50);
    fill(200, 100, 100);
    text("START", width/2, 3*height/4+10);
  }
  //this is the main game screen
  if (gameChanger == 1) {
    background(25);
    catchers.catchersDisplay();
    for (int i = 0; i < rains.length; i++) {
      catchers.lostRaindropCounter(rains[i]);
      rains[i].raindropShow();
      rains[i].raindropMove();
      catchers.catchesRain(rains[i]);
    }
    catchers.catcherCounter();
  }
  //his is the loss screen
  if (gameChanger == 2) {
    background(0);
    fill(random(360), 100, 100);
    text("U LOSER", width/2, height/3);
    text("score " + numberofcatches, width/2, height/2);
  }
}

void mousePressed() {
  //this starts the game
  if (mouseX > 150 && mouseX < 350 && mouseY > 325 && mouseY < 425) {
    gameChanger = 1;
  }
}

