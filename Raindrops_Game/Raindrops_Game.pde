Raindrop[] rains = new Raindrop[2000];
Catchers catchers;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER);
  textSize(30);
  catchers = new Catchers();
  for (int i = 0; i < rains.length; i++) {
    rains[i] = new Raindrop();
  }
}

void draw() {
  background(0);
  catchers.catchersDisplay();
  for (int i = 0; i < rains.length; i++) {
    rains[i].raindropShow();
    rains[i].raindropMove();
    catchers.catchesRain(rains[i]);
  }
  catchers.catcherCounter();
}

