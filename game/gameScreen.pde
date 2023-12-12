

void gameScreen() {
  textSize(fontSizeSm);
  // array of accepted keys. Can be appended and removed
  //keys = new IntList();
  //resultList = new IntList();
  rectMode(CORNER);
  // Dummy BG
  background(255);
  // LEVEL 1: Four slots
  level(4);

  beginnTime.countDown ();
  beginnTime.changeScreen();
  fill(0);
  text (beginnTime.getTime(), 70, 60);
  gameState = GAME;
}
