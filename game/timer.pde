class Timer {

  float startTime;  //store the starting time

  //set the starting time of the timer and initialize it
  Timer (float setTime) {

    startTime = setTime;
  }

  //retrieve current time
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

  void resetTimer( float newTime) {
    startTime = newTime;
  }

  //countdown the time
  void countDown()
  {
    startTime -= 1.0/frameRate;
    if (startTime < 0) {
      startTime = 0; //makes sure time doesn't go bellow 0
    }
  }

  void changeScreen() {  //when timer is 0 goes to end screen
    if ( startTime <= 0) {
      gameState = GAME_END;
      gameEnd();
    }
  }
}

Timer beginnTime = new Timer(20); //Timer starts at 20sek.
