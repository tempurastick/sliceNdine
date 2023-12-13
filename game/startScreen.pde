int selection = 0; //differentiate between start and help

void startScreen () {

  //background image
  PFont font; //schriftart ändern
  font = createFont("PixeloidMono.otf", 128);
  textFont(font);
  float btnX = 160;
  menu_photo = loadImage ("menu_background.jpg");
  image (menu_photo, 0, 0);

  //title of the Game on banner
  fill (0);
  textSize (fontSizeMd);
  textAlign (CENTER);
  image(btnS, 100, 85);
  text ("Cooking Run", gameWidth/2+5, gameHeight-300);

  //startScreen
  textSize (40);
  image(btn, btnX, gameHeight-250 );
  text ("start", gameWidth/2, gameHeight-210);

  //helpScreen
  image(btn, btnX, gameHeight-190 );
  strokeWeight (0);
  text ("help", gameWidth/2, gameHeight-150);


  //select between start and help
  if (selection == 0)
  {
    fill(120, 70, 90, 100);
    rectMode(CENTER);
    rect(gameWidth/2, gameHeight-223, 184, 50);
  } else {
    text ("help", gameWidth/2, gameHeight-150);
    fill(120, 70, 90, 100);
    rectMode(CENTER);
    rect(gameWidth/2, gameHeight-162, 184, 50);
  }
}
void keyPressed() {
  if (keyCode == DOWN || keyCode == UP) {
    // Navigation between to option with key up and down
    if (selection == 0) {
      selection = 1; // navigate to "Help"
    } else {
      selection = 0; // navigate to "Start"
    }
  } else if (keyCode == ENTER) {
    if (selection == 0) {  //when start is clicked it travels to gameScreen

      if ( beginnTime.getTime() <= 0) {
        resetTimer();
        keysSetup.resetScore();
      }

      gameState = GAME;
      gameScreen();
    } else if (selection == 1) {  //when help is clicked it travels to helpScreen
      gameState = HELP;
      helpScreen();
    }
  }
}

void resetTimer() {
  float newTime = 20;
  beginnTime.resetTimer(newTime);
}
