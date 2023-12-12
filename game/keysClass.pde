class KeysClass {
  int keysIndex, left, right, up, down, tileSize, marginX, marginY, spacer, currentSlot, delayTime, score, keysIndexMax;
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
    marginX = 88;
    // spacing from tiles to top border
    marginY = 112;
    // space between tiles
    spacer = 8;

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
      resultList.shuffle();
    }

    // shuffles order inside the keys


    currentSlot = 0;
    delayTime = 100; // testing diff values rn
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

      float keyPosX = returnPosition(marginX*currentSlot);

      // needs to be replaced with Pimage logic
      int originalColor = g.fillColor;
      delay(delayTime);


      if (keyCode == result || key == symbol) {
        // correct input

        // score added
        score = score+20;
        score(score);
        println(score(score));

        waitingForInput = true;
        lastInputTime = millis();


        // replace this with Pimage
        fill(0, 255, 0); // Set color to green for correct input
        keyCheck = true;

        // state of current pressed key
        keyStates[currentSlot] = true;

        delay(delayTime); // delay for input
        // catch

        currentSlot++;
        keyPressedLogic(); // recursive function
      } else if ( keyCode != result || key != symbol) {
        // incorrect input
        if (keyPressed) {
          // replace this with Pimage
          fill(255, 0, 0); // Set color to red for incorrect input
          keyCheck = false;

          // state of current pressed key
          keyStates[currentSlot] = false;
          score = score-1;
          score(score);
          println("else", score(score));
        }
        delay(delayTime);
      } else {
        fill(0); // default
      }


      // logic needs to be replaced with PImage
      // overwriting the declared symbols
      if ( currentSlot == 0) {
        text(symbol, keyPosX+spacer, marginY);
      } else if ( keyPosX < width ) {
        // TODO: if it's outside of with it needs to be moved
        text(symbol, keyPosX, marginY);
        println("keyPosX", keyPosX);
      } else {
        keyPosX = marginX;
        text(symbol, keyPosX, marginY*marginY);
        println("keyPosX", keyPosX);
      }
      // restoring to default colour
      fill(originalColor);
    } else {
      // done with all the slots
      println("All slots checked");
      startNewLevel();
    }
  }

  void displayScore() {
    text(score, marginX, height);
  }

  void displayKeys() {
    for ( int i = 0; i < keysIndex; i++) {
      float keyPosX = returnPosition(marginX*i);
      int result = resultList.get(i);
      char symbol = getSymbol(result);

      println("i: " + i + ", keyStates[i]: " + keyStates[i]);

      if ( keyStates[i] ) {
        // REPLACE WITH PIMAGE
        fill(0, 255, 0);
        text(symbol, spacer+keyPosX, marginY);
      } else {
        // REPLACE WITH PIMAGE
        fill(0);
        text(symbol, keyPosX, marginY);
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
    println("startNewLevel");

    // making sure we don't go out of bound
    if ( keysIndex < keysIndexMax ) {
      keysIndex++;

      keyStates = new boolean[keysIndex];
      Arrays.fill(keyStates, false);
    }

    println("keysIndex: " + keysIndex);
    println("keyStates.length: " + keyStates.length);

    // clearing filled slots
    Arrays.fill(keyStates, false);

    for ( int i = 0; i < keysIndex; i++) {
      //int index = int(random(keys.size()));
      // resultList.append(keys.get(index)); // for random output
      resultList.append(keys.get(i));
      resultList.shuffle();
    }
  }

  void autoProceed() {
    // once we hit all the keys, start new level
    if ( currentSlot == keysIndex ) {
      currentSlot = 0;
      startNewLevel();
    }
  }
  
  
  void keyPressed() {
    keysSetup.keyPressedLogic();
  }
}
