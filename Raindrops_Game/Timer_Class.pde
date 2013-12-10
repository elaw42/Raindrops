class Timed {
  int currentTime, oldTime, numofsec;

  Timed(int n) {
    currentTime = millis();
    oldTime = 0;
    numofsec = n;
  }

  boolean time() {
    //if the time reaches a certain point, the index will increase
    if (currentTime - oldTime >= numofsec) {
      oldTime = currentTime;
      return true;
    }
    else { 
      return false;
    }
  }
}

