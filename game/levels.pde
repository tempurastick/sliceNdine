void level(int highest) {

  int i = 0;
  while ( i < highest) {
    //rect(0, 20+i, i, i+20); // testing
    i++;
  }

  if (keyPressed) {
    keysSetup.keyPressed();
    
    // otherwise else would unintentionally fire
    keysSetup.checkInputDelay();
  }

  keysSetup.displayKeys();
  keysSetup.displayScore();
  keysSetup.autoProceed();
}
