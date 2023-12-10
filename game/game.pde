int START_SCREEN = 1;
int GAME = 2;
int GAME_END = 3;
int gameState = GAME;

// aspect ratio 8:7, typical SNES had a resolution of 256x224, we're scaling it with a factor of x2
int gameWidth = 512;
int gameHeight = 448;

// keys list
IntList keys;
IntList resultList;

KeysClass keysSetup;

void setup() {

  keysSetup = new KeysClass(5);
  keysSetup.createLists();
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
