Raindrop[] rains = new Raindrop[2000];
Acid[] ac = new Acid[10];
Catchers catchers;
Timed timer, timers;
int numberofcatches, numberoflosses, gameChanger, index, indexs;
boolean hard;
PImage net;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER);
  rectMode(CENTER);
  textSize(30);
  net = loadImage("Net.png");
  //changes to screens from start - 0, main game - 1, end - 2
  gameChanger = 0;
  //determines if hard or easy
  hard = false;
  catchers = new Catchers();
  //the number of milli sec needed in timer
  timer = new Timed(2000);
  timers = new Timed(2500);
  //number of raindrops on screen
  index = 100;
  indexs = 0;
  //iniializes raindrops
  for (int i = 0; i < rains.length; i++) {
    rains[i] = new Raindrop();
  }
  //initializes acid
  for (int i = 0; i < ac.length; i++) {
    ac[i] = new Acid();
  }
}

void draw() {

  //this is the start screen
  if (gameChanger == 0) {
    background(0);
    text("Catch raindrops using the mouse.", width/2, height/8);
    text("Don't lose raindrops or catch", width/2, 2*height/8);
    text("acid rain in hard mode.", width/2, 3*height/8);
    text("Press p to pause the game", width/2, 4*height/8);
    text("press any key to replay it.", width/2, 5*height/8);
    //easy mode
    fill(0, 100, 100);
    rect(width/4, 3*height/4, 200, 100, 25);
    fill(90, 90, 50);
    rect(width/4, 3*height/4, 175, 75, 50);
    fill(180, 100, 100);
    text("EASY", width/4, 3*height/4+10);
    //hard mode
    fill(0, 100, 100);
    rect(3*width/4, 3*height/4, 200, 100, 25);
    fill(90, 90, 50);
    rect(3*width/4, 3*height/4, 175, 75, 50);
    fill(180, 100, 100);
    text("HARD", 3*width/4, 3*height/4+10);
  }

  //this is the main game screen
  if (gameChanger == 1) {
    background(25);
    catchers.catchersDisplay();
    for (int i = 0; i < index; i++) {
      if (index < rains.length) {
        rains[i].raindropShow();
        rains[i].raindropMove();
        catchers.lostRaindropCounter(rains[i]);
        catchers.catchesRain(rains[i]);
      }
    }
    catchers.catcherCounter();
    //creates hard mode
    if (hard) {
      for (int i = 0; i < indexs; i++) {
        if (indexs < ac.length) {
          ac[i].acShow();
          ac[i].acMove();
        }
        catchers.acidCatch(ac[i]);
      }
    }
    //adds raindrops periodically
    if (timer.time()) {
      index+=100;
    }
    if (timers.time()) {
      indexs++;
    }
  }

  //this is the loss screen
  if (gameChanger == 2) {
    background(0);
    fill(random(360), 100, 100);
    text("U LOSER", width/2, height/3);
    text("score " + numberofcatches, width/2, height/2);
    fill(0, 100, 100);
    rect(width/2, 3*height/4, 200, 100, 25);
    fill(90, 90, 50);
    rect(width/2, 3*height/4, 175, 75, 50);
    fill(180, 100, 100);
    text("RESTART?", width/2, 3*height/4+10);
  }

  //this shows the game over screen
  if (numberoflosses >= 1000) {
    gameChanger = 2;
  }

  if (gameChanger == 0 || gameChanger == 2) {
    if (mousePressed) {
      //easy game
      if (mouseX > 25 && mouseX < 225 && mouseY > 325 && mouseY < 425) {
        gameChanger = 1;
        numberoflosses = 0;
        numberofcatches = 0;
      }
      //hard game
      if (mouseX > 225 && mouseX < 425 && mouseY > 325 && mouseY < 425) {
        gameChanger = 1;
        hard = true;
        numberoflosses = 0;
        numberofcatches = 0;
      }
    }
  }
}

void keyPressed() {
  if (key == 'p') {
    noLoop();
  }
  else {
    loop();
  }
}

