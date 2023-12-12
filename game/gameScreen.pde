

void gameScreen() {
  textSize(fontSizeSm);
  // array of accepted keys. Can be appended and removed
  rectMode(CORNER);
  // Dummy BG
  background(255);

  //calls for the level
  level();
  
  // countdown
  beginnTime.countDown();
  beginnTime.changeScreen();
  fill(0);
  text (beginnTime.getTime(), 70, 60);
  gameState = GAME;
}
