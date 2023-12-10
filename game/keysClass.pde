class KeysClass {
  int keysIndex, left, right, up, down, tileSize, marginX, marginY, spacer;

  KeysClass(int keysLength ) {
    // array of accepted keys. Can be appended and removed
    keys = new IntList();
    resultList = new IntList();

    keys.append(LEFT);
    keys.append(RIGHT);
    keys.append(UP);
    keys.append(DOWN);
    left = keys.get(0);
    right = keys.get(1);
    up = keys.get(2);
    down = keys.get(3);

    // total number in array
    keysIndex = keys.size();
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
  }

  void createLists () {
    // grabbing the number of elements in the list
    for (int i = 0; i < keysIndex; i++) {
      int index = int(random(keys.size()));

      // storing the random numbers from keys
      resultList.append(keys.get(index));
    }

    for (int i = 0; i < keysIndex; i++) {
      // shuffles order inside the keys
      keys.shuffle();
      int result = keys.get(i);
      textSize(tileSize);
      println(i);
      println(result);

      for ( int slot = 0; slot < keysIndex; slot++) {
        // right now this counts down for each slot in every slot
        fill(200, 0, 200);

        if ( slot == i ) {
          println("slot", slot);
          // rn it's exactly at the edge so that needs to be fixed
          rect(marginX*slot, marginY, tileSize, tileSize);

          if (result == left ) {
            // replace text with graphics
            text("<", marginX*slot, marginY);
          } else if ( result == right ) {
            text(">", marginX*slot, marginY);
          } else if ( result == up ) {
            text("^", marginX*slot, marginY);
          } else if ( result == down ) {
            text("v", marginX*slot, marginY);
          }
        }
      }
    }
  }

  void shuffleList() {
  }

  void checkKeys() {
    if (keyPressed) {
      if ( keyCode == left ) {
        rect(20, 20, 30, 30);
      } else if ( keyCode == right ) {
        rect(30, 40, 30, 30);
      } else if ( keyCode == up) {
        rect(50, 60, 30, 30);
      } else if ( keyCode == down ) {
        rect(60, 70, 30, 30);
      }
    }
  }
}
