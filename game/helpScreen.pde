int backgroundColor = #fff6e5;
PImage photo;
//functions for the BACK button
int rectX = gameWidth-225;
int rectY = gameHeight-130;
int rectS = 140;
int rectV = 70;

void helpScreen() {
  background (backgroundColor);
  PFont font; //schriftart ändern
  font = createFont("PixeloidMono.otf", 128);
  textFont(font);

  fill(0);
  textSize(fontSizeXs);
  text ("type the shown keys as quickly as you can", gameWidth/2, gameHeight-350);
  textSize(fontSizeXs);
  text("correct inputs = +5 points", gameWidth/2, gameHeight-300);
  text(" incorrect inputs = -5 points", gameWidth/2, gameHeight-260);
  text ("Controls:", 50, gameHeight-200);
  text ("use the arrowkeys and keyboard", 200, gameHeight-150);


  PFont font2;
  font2 = createFont("PixeloidSans-Bold.otf", 128);
  textFont(font2);
  textSize(fontSizeMd);
  text ("GUIDE FOR THE GAME", CENTER, gameHeight-400);

  //button to go back to menu
  noFill();
  strokeWeight (2);
  rectMode (CORNER);
  rect (rectX, rectY, rectS, rectV);
  text ("BACK", gameWidth-152, gameHeight-81);
}

void mousePressed() {
  //if the BACK button is pressed it goes back to the start Screen
  if (mouseX >= rectX && mouseX <= rectX + rectS && mouseY >= rectY && mouseY <= rectY + rectV) {
    gameState = START_SCREEN;
    startScreen();
  }
}
