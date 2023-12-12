int START_SCREEN = 1;
int GAME = 2;
int GAME_END = 3;
int HELP = 4;
int gameState = START_SCREEN;
import java.util.Arrays;

// aspect ratio 8:7, typical SNES had a resolution of 256x224, we're scaling it with a factor of x2
int gameWidth = 512;
int gameHeight = 448;

int fontSizeMd = 42;
int fontSizeSm = 24;
int fontSizeXs = 12;

// keys list
IntList keys;
IntList resultList;

KeysClass keysSetup;

PFont pixeloid;

PImage btn;
PImage banner;
PImage tile;

void setup() {
  btn = loadImage ("btn.png");
  banner = loadImage ("flag_banner.png");
  tile = loadImage ("tile.png");
  keysSetup = new KeysClass(4);
  //keysSetup.createLists();
  pixeloid = createFont("PixeloidMono.otf", 128);
  textFont(pixeloid, fontSizeMd);
    textSize(fontSizeMd);
}

void settings() {
  size(gameWidth, gameHeight);

}


void draw() {
  if (gameState == START_SCREEN) {
    startScreen();
  } else if (gameState == GAME) {
    gameScreen();
  } else if (gameState == GAME_END) {
    gameEnd();
  }
}
