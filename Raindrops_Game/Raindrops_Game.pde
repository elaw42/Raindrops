Raindrop[] rains = new Raindrop[2000];
Acid[] ac = new Acid[10];
Catchers catchers;
Timed timer, timers;
int numberofcatches, numberoflosses, gameChanger, index, indexs;
boolean hardmode;
PImage net, egg;
float scale;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER);
  rectMode(CENTER);
  textSize(25);
  //loads pictures
  net = loadImage("Net.png");
  egg = loadImage("Egg.jpg");
  //scale for pictures
  scale = .5;
  //changes to screens from start - 0, main game - 1, end - 2
  gameChanger = 0;
  //determines if hard or easy
  hardmode = false;
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
    text("Catch raindrops by moving the mouse. \nDon't lose too many raindrops or catch \nthe acid rain in hard mode. \nPress p to pause the game and \npress any key to resume it.", width/2, height/6);
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
    if (hardmode) {
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
    //easy mode
    fill(0, 100, 100);
    rect(width/4, 3*height/4, 200, 100, 25);
    fill(90, 90, 50);
    rect(width/4, 3*height/4, 175, 75, 50);
    fill(180, 100, 100);
    text("RESTART \nEASY", width/4, 3*height/4 - 7);
    //hard mode
    fill(0, 100, 100);
    rect(3*width/4, 3*height/4, 200, 100, 25);
    fill(90, 90, 50);
    rect(3*width/4, 3*height/4, 175, 75, 50);
    fill(180, 100, 100);
    text("RESTART \nHARD", 3*width/4, 3*height/4 - 7);
  }

  //this shows the game over screen
  if (numberoflosses >= 1000) {
    gameChanger = 2;
  }

  if (gameChanger == 0 || gameChanger == 2) {
    if (mousePressed) {
      //easy game
      if (mouseX > 25 && mouseX < 225 && mouseY > 325 && mouseY < 425) {
        //starts and resets game
        gameChanger = 1;
        hardmode = false;
        numberoflosses = 0;
        numberofcatches = 0;
        index = 100;
        indexs = 0;
      }
      //hard game
      if (mouseX > 225 && mouseX < 425 && mouseY > 325 && mouseY < 425) {
        //starts and resets game
        gameChanger = 1;
        hardmode = true;
        numberoflosses = 0;
        numberofcatches = 0;
        index = 100;
        indexs = 0;
      }
    }
  }
}

void keyPressed() {
  if (key == 'p') {
    noLoop();
    background(0);
    text("PAUSED", width/2, height/5);
    text("score " + numberofcatches, width/2, height/3);
    text("Achievment: Secret Easter Egg", width/2, height/2);
    imageMode(CENTER);
    image(egg, width/2, 4*height/5, egg.width*scale, egg.height*scale);
    imageMode(CORNER);
  }
  else {
    loop();
  }
}

