class Timer {

  float startTime;
  Timer (float setTime) {

    startTime = setTime;
  }

  float getTime()
  {
    return(startTime); //returns current time
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
}

Timer beginnTime = new Timer(20); //Timer starts at 20sek.
