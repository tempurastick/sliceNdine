int selection = 0;
PImage menu_photo;

void startScreen () {
  PFont font; //schriftart ändern
  font = createFont("PixeloidMono.otf", 128);
  textFont(font);
  float btnX = 160;
  menu_photo = loadImage ("menu_background.jpg");
  image (menu_photo, 0, 0);

  fill (0);
  textSize (fontSizeMd);
  textAlign (CENTER);
  image(banner, 115, 85);
  text ("Menu", gameWidth/2+5, gameHeight-300);

  //startScreen
  textSize (40);
  image(btn, btnX, gameHeight-250 );
  text ("start", gameWidth/2, gameHeight-210);

  //helpScreen
  image(btn, btnX, gameHeight-190 );
  strokeWeight (0);
  text ("help", gameWidth/2, gameHeight-150);

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
    // Navigation zwischen den Optionen
    if (selection == 0) {
      selection = 1; // Wechsle zur "Help" Option
    } else {
      selection = 0; // Wechsle zur "Start" Option
    }
  } else if (keyCode == ENTER) {
    if (selection == 0) {
      gameState = GAME;
    } else if (selection == 1) {
      gameState = HELP;
      helpScreen();
    }
  }
}
