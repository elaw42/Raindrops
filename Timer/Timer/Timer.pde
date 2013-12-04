int currentTime, oldTime;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  textAlign(CENTER);
  textSize(25);
}

void draw() {
  currentTime = millis();
  if (currentTime - oldTime >= 2000) {
    background(0);
    for (int i = 0; i < 100; i++) {
      fill(random(360), 100, 100);
      ellipse(random(width), random(height), random(10, 50), random(10, 50));
    }
    fill(255);
    text("teh actual tim " + millis(), width/2, height/2);
    oldTime = currentTime;
  }
}

