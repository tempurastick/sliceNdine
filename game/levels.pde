void level() {
  if (keyPressed) {
    keysSetup.keyPressed();
    
    // otherwise else would unintentionally fire
    keysSetup.checkInputDelay();
  }
  
  // displays the keys to input
  keysSetup.displayKeys();
  
  // displays the score
  keysSetup.displayScore();
  
  // if one set of keys is done, automatically jumps to the next
  keysSetup.autoProceed();
}
