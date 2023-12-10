

void gameScreen() {
  // array of accepted keys. Can be appended and removed
  //keys = new IntList();
  //resultList = new IntList();
  
  // Dummy BG
  background(255);
  keysSetup.createLists();

  // LEVEL 1: Four slots
  level(5);
  gameState = GAME;
}
