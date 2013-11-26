Raindrop[] rains = new Raindrop[2000];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < rains.length; i++) {
    rains[i] = new Raindrop();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < rains.length; i++) {
    rains[i].raindropShow();
    rains[i].raindropMove();
    rains[i].raindropMouse();
  }
}
