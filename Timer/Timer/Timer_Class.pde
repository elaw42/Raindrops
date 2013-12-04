class Timed {
  int realTime, oldTime, numofsec;

  Timed(int n) {
    realTime = millis();
    oldTime = 0;
    numofsec = n;
  }

  void time() {
    if (realTime - oldTime < numofsec) {
    }
  }
}

