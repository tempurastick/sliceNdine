int selection = 0;

void startScreen () {

  background (#e4d5b7);
  fill (0);
  textSize (116);
  textAlign (CENTER);
  text ("Menu", gameWidth/2, gameHeight-300);

  //startScreen
  textSize (40);
  text ("start", gameWidth/2, gameHeight-200);
  //helpScreen
  strokeWeight (0);
  text ("help", gameWidth/2, gameHeight-150);

  fill(3, 3, 3, 0);
  rectMode(CENTER);
  rect(gameWidth/2, gameHeight-213, 184, 50);
  fill(3, 3, 3, 0);
  rectMode(CENTER);
  rect(gameWidth/2, gameHeight-162, 184, 50);

  if (selection == 0)
  {
    fill(120, 70, 90, 100);
    rectMode(CENTER);
    rect(gameWidth/2, gameHeight-213, 184, 50);
  } else {
    text ("help", gameWidth/2, gameHeight-150);
    fill(120, 70, 90, 100);
    rectMode(CENTER);
    rect(gameWidth/2, gameHeight-162, 184, 50);
  }
}
void keyPressed() {
  if (keyCode == DOWN || keyCode == UP) {
    // Navigation zwischen den Optionen
    if (selection == 0) {
      selection = 1; // Wechsle zur "Help" Option
    } else {
      selection = 0; // Wechsle zur "Start" Option
    }
  } else if (keyCode == ENTER) {
    if (selection == 0) {
      gameScreen();
    } else if (selection == 1) {
      helpScreen ();
    }
  }
}
