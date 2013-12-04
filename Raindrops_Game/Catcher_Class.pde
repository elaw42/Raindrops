class Catchers {
  PVector loc;
  float d;
  color f;

  Catchers() {
    d = 50;
    f = color(random(360), 100, 100);
    numberofcatches = 0;
    numberofloses = 0;
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
      numberofcatches++;
      b.loc.x = random(width);
      b.loc.y = random(-500);
    }
  }

  void lostRaindropCounter(Raindrop c) {
    if (c.loc.y >= height) {
      numberofloses++;
      text("loses " + numberofloses, width/2, 5*height/6);
    }
  }

  void catcherCounter() {
    fill(255);
    text("catches " + numberofcatches, width/2, height/6);
    if (numberofcatches > 500) {
      text("very catch", 150, 250);
      text("many raindrop", 350, 250);
      fill(236, 98, 36);
      text("coral blue lipstick #5", 250, 300);
    }
  }
}

