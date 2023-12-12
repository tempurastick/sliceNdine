
int storedScore = 0;

void gameEnd() {
  // gameend
  background(255);
  imageMode(CENTER);
  float middleX = width/2;
  float middleY = height/2;
  textSize(fontSizeSm);

  int finalScore = keysSetup.returnScore();

  // so we don't update the score with key inputs on gameEnd
  if ( storedScore == 0) {
    storedScore = finalScore;
  }

  image (banner, middleX, middleY);
  text("Score: " + storedScore, middleX-12, middleY+(fontSizeSm/2));
}
