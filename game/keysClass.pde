class KeysClass {
  int keysIndex, left, right, up, down, tileSize, marginX, marginY, spacer, currentSlot, delayTime, keysIndexMax;
  boolean keyCheck;

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
    left = keys.get(0);
    right = keys.get(1);
    up = keys.get(2);
    down = keys.get(3);

    // total number in array
    keysIndexMax = keys.size();
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

    // grabbing the number of elements in the list
    for (int i = 0; i < keysIndex; i++) {
      int index = int(random(keys.size()));

      // storing the random numbers from keys
      resultList.append(keys.get(index));
    }

    // shuffles order inside the keys
    keys.shuffle();

    currentSlot = 0;
    delayTime = 50; // testing diff values rn
  }

  void createLists () {
    keyCheck = symbolCheck(keyCheck);
    // making sure we don't go out of bounds (array.length-1)
    if ( currentSlot < keysIndex) {
      int result = resultList.get(currentSlot);
      char symbol = getSymbol(result);
      float keyPosX = returnPosition(marginX*currentSlot);

      // needs to be replaced with Pimage logic
      int originalColor = g.fillColor;
         println("currentSlot:", currentSlot, "result:", result, "keyCode:", keyCode, "symbol:", symbol);

      if (keyPressed && matchSlot(result)) {
        if (keyCode == result || key == symbol) {
          // correct input

          // replace this with Pimage
          fill(0, 255, 0); // Set color to green for correct input
          keyCheck = true;

          delay(delayTime); // delay for input
          // catch
         
          currentSlot++;
          createLists(); // recursive function
        } else {
          // incorrect input

          // replace this with Pimage
          fill(255, 0, 0); // Set color to red for incorrect input
          keyCheck = false;

          delay(delayTime);
        }
      } else {
        fill(0); // Reset to default color
      }

      // logic needs to be replaced with PImage
      // overwriting the declared symbols
      if ( currentSlot == 0) {
        text(symbol, keyPosX+spacer, marginY);
      } else {
        text(symbol, keyPosX, marginY);
      }
      // restoring to default colour
      fill(originalColor);
    } else {
      // done with all the slots
      println("All slots checked");
      startNewLevel();
    }
  }


  void displayKeys() {
    for ( int i = 0; i < keysIndex; i++) {
      float keyPosX = returnPosition(marginX*i);
      int result = resultList.get(i);
      char symbol = getSymbol(result);
  
      if ( i == 0 ) {
        // REPLACE WITH PIMAGE
        text(symbol, spacer+keyPosX, marginY);
      } else {
        // REPLACE WITH PIMAGE
        text(symbol, keyPosX, marginY);
      }
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
    }
    return ' ';
  }

  void startNewLevel() {
    currentSlot = 0;
    resultList.clear();
    if ( keysIndex < keysIndexMax ) {
    keysIndex++;
    }
    
    for ( int i = 0; i < keysIndex; i++) {
      int index = int(random(keys.size()));
      resultList.append(keys.get(index));
    }
  }
}
