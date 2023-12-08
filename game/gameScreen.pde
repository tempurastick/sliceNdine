
IntList keys;
IntList resultList;

void gameScreen() {
  // array of accepted keys. Can be appended and removed
  keys = new IntList();
  resultList = new IntList();

  keys.append(LEFT);
  keys.append(RIGHT);
  keys.append(UP);
  keys.append(DOWN);

  // mapping keys array
  int left = keys.get(0);
  int right = keys.get(1);
  int up = keys.get(2);
  int down = keys.get(3);

  // total number in array
  int keysIndex = keys.size();
  
  // I thought I could use this to only shuffle the array once but alas. Might need to move everything to setup
  boolean SHUFFLE = true;

  if ( SHUFFLE == true ) {
    for (int i = 0; i < keysIndex; i++) {
      int index = int(random(keys.size()));

      // storing the random numbers from keys
      resultList.append(keys.get(index));
    }

    println(resultList);

    SHUFFLE = false;
  }

  for (int i = 0; i < keysIndex; i++) {
    // shuffles order inside the keys
    keys.shuffle();
    int result = keys.get(i);
    textSize(50);
    //println(i);
    //println(result);

    // this part should probably be refactored into a function or loop
    /*
    // first slot
     while ( i == 0 ) {
     fill(200, 0, 200);
     rect(15, 75, 40, 40);
     if (result == left ) {
     text("<", 20, 90);
     } else if ( result == right ) {
     text(">", 20, 90);
     } else if ( result == up ) {
     text("^", 20, 90);
     } else {
     text("v", 20, 90);
     }
     i++;
     }
     // first slot end
     
     // second slot
     while ( i == 1 ) {
     fill(200, 0, 0);
     rect(15, 120, 40, 40);
     if (result == left ) {
     text("<", 20, 90);
     } else if ( result == right ) {
     text(">", 20, 90);
     } else if ( result == up ) {
     text("^", 20, 90);
     } else {
     text("v", 20, 90);
     }
     i++;
     }
     // second slot end
     // third slot
     while ( i == 2 ) {
     fill(0, 200, 0);
     rect(15, 170, 40, 40);
     if (result == left ) {
     text("<", 20, 90);
     } else if ( result == right ) {
     text(">", 20, 90);
     } else if ( result == up ) {
     text("^", 20, 90);
     } else {
     text("v", 20, 90);
     }
     i++;
     }
     // third slot end
     // fourth slot
     while ( i == 3 ) {
     fill(0, 0, 200);
     rect(15, 170, 40, 40);
     if (result == left ) {
     text("<", 20, 90);
     } else if ( result == right ) {
     text(">", 20, 90);
     } else if ( result == up ) {
     text("^", 20, 90);
     } else {
     text("v", 20, 90);
     }
     i++;
     }
     // fourth slot end
     */

    // while i == 0, get first slot
    // while i == 1 get second slot
    // while i == 2 get third slot
    // while i == 3 get fourth slot

    //println(result);
  }

  // LEVEL 1: Four slots
  level(5);

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
