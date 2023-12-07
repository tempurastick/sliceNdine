void gameScreen() {
  // game screen code
  
    if (keyPressed) {
    if ( keyCode == LEFT ) {
      rect(20, 20, 30, 30);
    } else if ( keyCode == RIGHT ) {
      rect(30, 40, 30, 30);
    } else if ( keyCode == UP) {
      rect(50, 60, 30, 30);
    } else if ( keyCode == DOWN ) {
      rect(60, 70, 30, 30);
    }
  }
}
