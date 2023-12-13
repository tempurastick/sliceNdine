// imports
import java.util.Arrays;
import processing.sound.*;

// game states
int START_SCREEN = 1;
int GAME = 2;
int GAME_END = 3;
int HELP = 4;
int gameState = START_SCREEN;

// sound file
SoundFile song;

// aspect ratio 8:7, typical SNES had a resolution of 256x224, we're scaling it with a factor of x2
int gameWidth = 512;
int gameHeight = 448;

// text sizes
int fontSizeMd = 42;
int fontSizeSm = 24;
int fontSizeXs = 14;

// keys list
IntList keys;
IntList resultList;
KeysClass keysSetup;

// font
PFont pixeloid;

// all images used
PImage menu_photo;
PImage btn;
PImage banner;
PImage tile;
PImage select;
PImage roundBtn;
PImage checkmark;
PImage error;
PImage btnS;
PImage cutting;

void setup() {
  // loading images, fonts and sound
  cutting = loadImage ("cutting.gif");
  btn = loadImage ("btn.png");
  banner = loadImage ("flag_banner.png");
  tile = loadImage ("tile.png");
  select = loadImage ("select.png");
  roundBtn = loadImage ("round_btn.png");
  checkmark = loadImage ("check.png");
  error = loadImage("cross.png");
  btnS = loadImage ("btn_scaled.png");
  pixeloid = createFont("PixeloidMono.otf", 128);
  textFont(pixeloid, fontSizeMd);
  textSize(fontSizeMd);

  // KeysClass object initialized
  keysSetup = new KeysClass(4);

  // looping our sound
  song = new SoundFile(this, "pixelSound.mp3");
  song.loop();
}

void settings() {
  size(gameWidth, gameHeight);
}


void draw() {
  // Manages game screens based on gameState: start, gameplay, end, or help.
  // display each screen according to the state.

  if (gameState == START_SCREEN) {
    startScreen();
  } else if (gameState == GAME) {
    gameScreen();
  } else if (gameState == GAME_END) {
    gameEnd ();
  } else if (gameState == HELP) {
    helpScreen();
  }
}
