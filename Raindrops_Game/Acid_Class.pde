class Acid {
  PVector loc, vel;
  color c;
  int d;

  Acid() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 5);
    c = color(126, 100, 100);
    d = 6;
  }

  void acShow() {
    //displays acid
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }

  void acMove() {
    //makes acid fall down
    loc.add(vel);
    if (loc.y > height + 3.5) {
      loc.y=0;
    }
  }
}
