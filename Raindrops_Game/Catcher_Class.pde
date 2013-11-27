class Catchers {
  PVector loc;
  float d;
  color f;
  int number;

  Catchers() {
    d = 50;
    f = color(random(360), 100, 100);
    number = 0;
  }

  void catchersDisplay() {
    loc = new PVector(mouseX, mouseY);
    fill(f);
    ellipse(loc.x, loc.y, d, d);
    if (mousePressed) {
      f = color(random(360), 100, 100);
    }
  }

  void catchesRain(Raindrop b) {
    if (loc.dist(b.loc) < d/2 + b.d/2) {
      number++;
      b.loc.x = random(width);
      b.loc.y = random(-500);
    }
  }

  void catcherCounter() {
    fill(255);
    text(number, width/2, height/6);
  }
}

