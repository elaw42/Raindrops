Raindrop[] rains = new Raindrop[2000];
Acid[] ac = new Acid[5];
Catchers catchers;
Timed timer, timers;
Star st;
int numberofcatches, numberoflosses, gameChanger, index, indexs;
boolean hardmode, netting;
PImage net, egg, back;
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
  back = loadImage("Back.jpg");
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
  //creates stars
  st = new Star();
  //initializes raindrops
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
    text("Catch raindrops by moving the mouse. \nDon't lose too many raindrops or catch \nthe acid rain in hard mode. \nPress p to pause the game and \npress any key to resume it. \nPress n to toggle the look of the catcher.", width/2, height/6);
    //easy mode
    fill(190, 100, 100);
    rect(width/4, 3*height/4, 200, 100, 25);
    fill(240, 90, 50);
    rect(width/4, 3*height/4, 175, 75, 50);
    fill(190, 100, 100);
    text("EASY", width/4, 3*height/4 + 10);
    //hard mode
    fill(190, 100, 100);
    rect(3*width/4, 3*height/4, 200, 100, 25);
    fill(240, 90, 50);
    rect(3*width/4, 3*height/4, 175, 75, 50);
    fill(190, 100, 100);
    text("HARD", 3*width/4, 3*height/4 + 10);
  }

  //this is the main game screen
  if (gameChanger == 1) {
    background(back);
    fill(60, 100, 100);
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
    //easy mode
    fill(190, 100, 100);
    rect(width/4, 3*height/4, 200, 100, 25);
    fill(240, 90, 50);
    rect(width/4, 3*height/4, 175, 75, 50);
    fill(190, 100, 100);
    text("RESTART \nEASY", width/4, 3*height/4 - 7);
    //hard mode
    fill(190, 100, 100);
    rect(3*width/4, 3*height/4, 200, 100, 25);
    fill(240, 90, 50);
    rect(3*width/4, 3*height/4, 175, 75, 50);
    fill(190, 100, 100);
    text("RESTART \nHARD", 3*width/4, 3*height/4 - 7);
    if (numberofcatches <= 500) {
      fill(random(360), 100, 100);
      text("U LOSER", width/2, height/3);
      text("score " + numberofcatches, width/2, height/2);
    } 
    else {
      text("U WHINER", width/2, height/3);
      text("score " + numberofcatches, width/2, height/2);
      fill(60, 100, 100);
      st.starShow();
    }
  }

  //this shows the game over screen
  if (numberoflosses >= 1000 && hardmode == true) {
    gameChanger = 2;
  }

  if (numberoflosses >= 250 && hardmode == false) {
    gameChanger = 2;
  }
}

void mousePressed() {
  if (gameChanger == 0 || gameChanger == 2) {
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

void keyPressed() {
  if (key =='n') {
    netting = !netting;
  }
  if (key == 'p') {
    if (gameChanger == 1) {
      noLoop();
      background(0);
      text("PAUSED", width/2, height/5);
      text("score " + numberofcatches, width/2, height/3);
      text("Achievment: Secret Easter Egg", width/2, height/2);
      imageMode(CENTER);
      image(egg, width/2, 4*height/5, egg.width*scale, egg.height*scale);
      imageMode(CORNER);
    }
  }
  else {
    loop();
  }
}

