
void gameScreen() {
  // visuals
  background(#fff6e5);
  image(cutting, 0, 0);

  textSize(fontSizeSm);
  rectMode(CORNER);
  //calls for the level
  level();

  // countdown
  beginnTime.countDown();
  beginnTime.changeScreen();
  fill(0);
  
  // shows countdown
  text (beginnTime.formatTimer(), 70, 60);
  
  // setting gameState
  gameState = GAME;

}
