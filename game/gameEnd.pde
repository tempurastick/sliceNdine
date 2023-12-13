//score starts at 0
int storedScore = 0;


void gameEnd() {
  // gameend

  background(#fff6e5);
  noFill();
  strokeWeight (2);
  rectMode (CORNER);
  rect (rectX, rectY, rectS, rectV);
  textSize (fontSizeSm);
  text ("RETURN", gameWidth-152, gameHeight-81);

  //show final score
  float middleX = width-400;
  float middleY = height-300;
  textSize(fontSizeSm);
  image (banner, middleX, middleY);
  text("Score: " + storedScore, middleX+150, middleY+45+(fontSizeSm/2));
  int finalScore = keysSetup.returnScore();

  // so we don't update the score with key inputs on gameEnd
  if ( storedScore == 0) {
    storedScore = finalScore;
  }

  //when return is clicked it goes back to the startScreen
  if (mousePressed  && (mouseX >= rectX && mouseX <= rectX + rectS && mouseY >= rectY && mouseY <= rectY + rectV)) {
    gameState = START_SCREEN;
  }
}
