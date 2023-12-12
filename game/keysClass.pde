class KeysClass {
  int keysIndex, left, right, up, down, tileSize, spacer, currentSlot, delayTime, score, keysIndexMax, bonusTime, timeThreshold;
  float marginX, marginY, keyPosX, tilePosX, keyPosY, selectSize;
  boolean keyCheck;
  boolean[] keyStates;

  int lastInputTime = 0;
  boolean waitingForInput = false;

  KeysClass(int keysLength ) {
    // array of accepted keys. Can be appended and removed
    keys = new IntList();
    resultList = new IntList();
    rectMode(CORNER);
    keys.append(LEFT);
    keys.append(RIGHT);
    keys.append(UP);
    keys.append(DOWN);
    keys.append('w');
    keys.append('a');
    keys.append('s');
    keys.append('d');

    left = keys.get(0);
    right = keys.get(1);
    up = keys.get(2);
    down = keys.get(3);

    // total number in array
    //keysIndexMax = keys.size();
    keysIndexMax = 6;
    keysIndex = 3;
    keysLength = keysIndex;

    // px size of one tile
    tileSize = 56;
    // spacing from tiles to left border
    marginX = 80;
    // spacing from tiles to top border
    marginY = 112;
    // space between tiles
    spacer = 8;

    selectSize = 64;

    // somehow have to re-declare it inside an object
    pixeloid = createFont("PixeloidMono.otf", 128);

    textFont(pixeloid);
    keys.shuffle();

    keyStates = new boolean[keysIndex];
    Arrays.fill(keyStates, false);

    // grabbing the number of elements in the list
    for (int i = 0; i < keysIndex; i++) {
      // int index = int(random(keys.size())); // for random output

      //resultList.append(keys.get(index)); // for random output

      // storing the random numbers from keys
      resultList.append(keys.get(i)); // for non random
      // shuffles order inside the keys
      resultList.shuffle();
    }

    currentSlot = 0;
    delayTime = 100; // to prevent double input

    // threshold for bonus points
    timeThreshold = 100;
  }

  void keyPressedLogic() {
    if (waitingForInput) {
      return;
    }

    keyCheck = symbolCheck(keyCheck);
    // making sure we don't go out of bounds (array.length-1)
    if ( currentSlot < keysIndex) {

      int result = resultList.get(currentSlot);
      char symbol = getSymbol(result);
      int nextResult;

      if ( currentSlot < keysIndex-1) {
        nextResult = resultList.get(currentSlot+1);
      } else {
        nextResult = resultList.get(currentSlot);
      }

      char nextSymbol = getSymbol(nextResult);
      float tilePosX = returnPosition(marginX*currentSlot);

      // needs to be replaced with Pimage logic
      int originalColor = g.fillColor;
      delay(delayTime);

      if (keyCode == result || key == symbol) {
        // correct input

        // score added
        checkBonusTime();
        score = score+5;
        score(score);

        waitingForInput = true;
        lastInputTime = millis();

        // replace this with Pimage
        fill(0, 255, 0); // Set color to green for correct input
        keyCheck = true;
        image(checkmark, keyPosX, keyPosY);

        // state of current pressed key
        keyStates[currentSlot] = true;

        delay(delayTime); // delay for input
        // catch
        currentSlot++;
        keyPressedLogic(); // recursive function
      } else if ( keyCode != result || key != symbol) {
        // incorrect input
        if (keyPressed) {
          // Set color to red for incorrect input
          fill(255, 0, 0);

          // minus points
          image(error, keyPosX, keyPosY);

          // State of current pressed key
          keyStates[currentSlot] = false;
          
          // we don't want the score value to be negative 0
          if (score > 0) {
            score = score - 5;
          }
          score(score);
        }

        delay(delayTime);
      } else {
        fill(0); // default
      }

      // overwriting the declared symbols

      if ( currentSlot == 0) {
        // PIMAGE
        text(symbol, keyPosX, marginY);
      } else {
        tilePosX = marginX;
        text(symbol, tilePosX, marginY*marginY);
      }
      // restoring to default colour
      fill(originalColor);
    } else {

      score = score+15;
      score(score);

      // done with all the slots
      println("All slots checked");
      startNewLevel();
    }
  }

  void checkBonusTime() {
    int elapsedTime = millis() - bonusTime;

    if ( elapsedTime <= timeThreshold) {
      score = score+5;
    }
  }

  void displayScore() {

    image(select, width-selectSize-spacer, spacer);
    textSize(fontSizeXs);
    text(score, width-selectSize+spacer+spacer, spacer+fontSizeMd);
  }

  void displayKeys() {
    for ( int i = 0; i < keysIndex; i++) {
      tilePosX = returnPosition(marginX*i);
      tilePosX = tilePosX+spacer;
      keyPosX = tilePosX+spacer*3;
      keyPosY = marginY+(spacer*4);
      int result = resultList.get(i);
      char symbol = getSymbol(result);

      if ( keyStates[i] ) {
        fill(0, 255, 0);
        // successful input
        image(tile, tilePosX, marginY);
        text(symbol, keyPosX, keyPosY);
      } else {
        fill(0);
        // default state of the tiles
        image(tile, tilePosX, marginY);
        text(symbol, keyPosX, keyPosY);
      }
    }
  }

  void checkInputDelay() {
    // to ensure we catch input delay, because otherwise unintended consequences lead to the score being manipulated
    if (waitingForInput && millis() - lastInputTime >= delayTime) {
      waitingForInput = false;
    }
  }

  float returnPosition ( float posX ) {
    return posX;
  }

  boolean symbolCheck ( boolean check ) {
    return check;
  }

  // if we have a symbol that occupies two concurrent slots
  boolean matchSlot(int symbol) {
    for (int i = currentSlot; i < keysIndex; i++) {
      if (resultList.get(i) == symbol) {
        return true;
      }
    }
    return false;
  }

  char getSymbol(int keyCode) {
    if ( keyCode == left ) {
      return '<';
    } else if ( keyCode == right ) {
      return '>';
    } else if ( keyCode == up ) {
      return '^';
    } else if ( keyCode == down ) {
      return 'v';
    } else if ( keyCode == 'w' || keyCode == 119 ) {
      // since we're using char, to display the symbol we have to use the keyCode of the key
      return 'w';
    } else if ( keyCode == 'a' || keyCode == 65 ) {
      return 'a';
    } else if ( keyCode == 's' || keyCode == 83 ) {
      return 's';
    } else if ( keyCode == 'd' || keyCode == 68 ) {
      return 'd';
    }
    return ' ';
  }

  void startNewLevel() {
    currentSlot = 0;
    resultList.clear();

    // making sure we don't go out of bound
    if ( keysIndex < keysIndexMax ) {
      keysIndex++;

      keyStates = new boolean[keysIndex];
      Arrays.fill(keyStates, false);
    }
    
    // clearing filled slots
    Arrays.fill(keyStates, false);

    for ( int i = 0; i < keysIndex; i++) {
      //int index = int(random(keys.size()));
      // resultList.append(keys.get(index)); // for random output
      resultList.append(keys.get(i));
      resultList.shuffle();
    }
  }

  int returnScore() {
    return score;
  }

  void autoProceed() {
    // once we hit all the keys, start new level
    if ( currentSlot == keysIndex ) {
      currentSlot = 0;
      startNewLevel();
      score(score);
    }
  }


  void keyPressed() {
    bonusTime = millis();
    keysSetup.keyPressedLogic();
  }
}
