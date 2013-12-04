Raindrop[] rains = new Raindrop[2000];
Catchers catchers;
boolean gameEnder;
int numberofcatches, numberofloses;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER);
  textSize(30);
  gameEnder = false;
  catchers = new Catchers();
  for (int i = 0; i < rains.length; i++) {
    rains[i] = new Raindrop();
  }
}

void draw() {
  if (numberofloses >= 5000) {
    gameEnder = true;
  }
  if (gameEnder == false) {
    background(0);
    catchers.catchersDisplay();
    for (int i = 0; i < rains.length; i++) {
      catchers.lostRaindropCounter(rains[i]);
      rains[i].raindropShow();
      rains[i].raindropMove();
      catchers.catchesRain(rains[i]);
    }
    catchers.catcherCounter();
  }
  else {
    background(0);
    fill(random(360), 100, 100);
    text("U LOSER", width/2, height/3);
    text("score " + numberofcatches, width/2, height/2);
  }
}

