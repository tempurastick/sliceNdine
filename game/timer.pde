class Timer {

  float startTime;
  Timer (float setTime) {

    startTime = setTime;
  }

  float getTime()
  {
    return(startTime); //returns current time
  }
  
  String formatTimer() {
  int timeInt = int(startTime);
  return nf(timeInt, 2); // this way it's a countdown without decimals
  }

  void setTime (float set) //set the time
  {
    startTime = set;
  }

  void countUp ()
  {
    startTime += 1.0;
  }

  void countDown()
  {
    startTime -= 1.0/frameRate;
    if (startTime < 0) {
      startTime = 0;
    }
  }
  
  void changeScreen() {
      if ( startTime <= 0) {
      gameState = GAME_END;
      gameEnd();
    }
  }
}

Timer beginnTime = new Timer(20); //Timer starts at 20sek.
