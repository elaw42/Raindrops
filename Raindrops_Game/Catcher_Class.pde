class Catchers {
  PVector loc;
  float d;
  color f;

  Catchers() {
    d = 60;
    f = color(random(360), 100, 100);
    numberofcatches = 0;
    numberoflosses = 0;
  }

  void catchersDisplay() {
    //displays the catcher and changes to a net
    //when the mouse is pressed
    loc = new PVector(mouseX, mouseY);
    fill(f);
    ellipse(loc.x, loc.y, d, d);
    if (mousePressed) {
      image(net, mouseX - 50, mouseY - 100, net.width*.2, net.height*.2);
    }
  }

  void catchesRain(Raindrop b) {
    //allows the catcher to catch and reset rain
    if (loc.x - b.loc.x < d/2 + b.d/2 && loc.x - b.loc.x > -d/2 - b.d/2) {
      if (loc.y - b.loc.y < d/2 + b.d/2 && loc.y - b.loc.y > -d/2 -b.d/2) {
        numberofcatches++;
        b.loc.x = random(width);
        b.loc.y = random(-500);
      }
    }
  }

  void lostRaindropCounter(Raindrop c) {
    //counter for lost raindrops
    text("losses " + numberoflosses, width/2, 5*height/6);
    if (c.loc.y > height) {
      numberoflosses++;
    }
  }

  void catcherCounter() {
    //counter for caught raindrops
    fill(255);
    text("catches " + numberofcatches, width/2, height/6);
    if (numberofcatches > 500) {
      fill(60, 100, 100);
      text("very catch", 150, 250);
      text("many raindrop", 350, 250);
    }
  }

  void acidCatch(Acid b) {
    if (loc.x - b.loc.x < d/2 + b.d/2 && loc.x - b.loc.x > -d/2 - b.d/2) {
      if (loc.y - b.loc.y < d/2 + b.d/2 && loc.y - b.loc.y > -d/2 -b.d/2) {
        gameChanger = 2;
      }
    }
  }
}

