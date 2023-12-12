void gameEnd() {
  // gameend
  background(255);
  imageMode(CENTER);
  float middleX = width/2;
  float middleY = height/2;
textSize(fontSizeSm);

  int finalScore = keysSetup.returnScore();
  image (banner, middleX, middleY);
  text("Score: " + finalScore, middleX-12, middleY+(fontSizeSm/2));
}
