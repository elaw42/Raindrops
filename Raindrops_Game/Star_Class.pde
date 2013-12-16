class Star {
  int deg;

  Star() {
    deg = 0;
  }

  void starShow() {
    translate(mouseX, mouseY);
    pushMatrix();
    rotate(radians(deg));
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    popMatrix();
    deg += 5;
  }
}

