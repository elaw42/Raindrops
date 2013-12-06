class Raindrop {
  PVector loc, vel;
  color c;
  int d;

  Raindrop() {
    loc = new PVector(random(width), random(-500));
    vel = new PVector(0, random(2, 5));
    c = color(random(180, 200), 100, 100);
    d = 6;
  }

  void raindropShow() {
    //displays raindrop
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }

  void raindropMove() {
    //makes rain fall down
    loc.add(vel);
    if (loc.y > height+10) {
      loc.y=0;
    }
  }
}
