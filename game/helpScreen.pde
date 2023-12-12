int backgroundColor = 255;
PImage photo;
int rectX = gameWidth-160;
int rectY = gameHeight-121;
int rectS = 111;
int rectV = 58;

void helpScreen() {
  background (backgroundColor);
  PFont font; //schriftart ändern
  font = createFont("PixeloidMono.otf", 128);
  textFont(font);

  fill(0);
  textSize(13);
  text ("Gib die angezeigten Tasten so schnell wie möglich an", gameWidth/2, gameHeight-350);
  textSize(15);
  text ("Controls:", 50, gameHeight-300);
  text ("use the arrowkeys and keyboard", 200, gameHeight-250);


  PFont font2;
  font2 = createFont("PixeloidSans-Bold.otf", 128);
  textFont(font2);
  textSize(30);
  text ("GUIDE FOR THE GAME", CENTER, gameHeight-400);

  /*
  photo = loadImage("Keyboard_letters.png");
   imageMode (CENTER);
   image(photo, 150, gameHeight-250, 175, 75);
   
   */

  noFill();
  rectMode(CENTER);
  rect (rectX, rectY, rectS, rectV);
  text ("BACK", gameWidth-152, gameHeight-81);
}

void mousePressed() {
  if (mouseX >= rectX && mouseX <= rectX + rectS && mouseY >= rectY && mouseY <= rectY + rectV) {
    gameState = START_SCREEN;
  }
}
