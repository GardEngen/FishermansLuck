
class Level {

  //private int level;
  private int LEVEL;
  private int score;
  private int spawner;
  private int startTime;
  private int timeLeft;
  private int time;
  private ArrayList <Catch> fish;
  private PFont font;



  Level() {
    fish = new ArrayList <Catch>();
    spawner = 300; //How often fish are spawning. The lower the number, the ofter fish are spawn
    score = 0;
    font = createFont("Arial", 16, true);
    startTimer();
  }

//Desides which level the player is in
  public void levelState() {

    switch(LEVEL) {

    case 1:
      setStartTime(5000);
      time();
      scoreBoard();
      level.catching();
      break;

    case 2:
      setStartTime(5000);
      time();
      scoreBoard();
      level.catching();
      break;
    }
  }

  public void setLevel(int newLevel) {
    LEVEL = newLevel;
  }

  public void catching() {
    //Checks if its time to spawn new fish
    if (spawner >= 300) {
      spawn();
      spawner = 0;
    }

    for (int i = 0; i < fish.size(); i++) {
      fish.get(i).drawFish();
    }
    //There is two for-loops to prevent a bug in the fish animation
    for (int i = 0; i < fish.size(); i++) {
      if (fish.get(i).isInMotion() == false) {
        fish.remove(i);
      }
    }

    if ( (player.gotCatch() == true) && (player.checkIfDangerous() == true) ) {
      STATE = STATE_GAME_OVER;
    }

    if ( (player.gotCatch() == true) && (player.fishOnBoard() == true) ) {
      score = score + 1;
      for (int i = 0; i < fish.size(); i++) {
        if (fish.get(i).equals(player.getCatch())) {
          fish.remove(i);
        }
      }
      // må bli satt til false igjen
    }

    if (player.gotCatch() == false) {
      catchSomething();
    }

    spawner = spawner + int(random(1, 10));
  }

  //Creats a fish and adds it to the arraylist
  private void spawn() {
    fish.add(new Catch());
  }

  //Hitbox detection for catching fish
  public void catchSomething() {
    float catchX;
    float catchY;
    float catchHeight;
    float rodX = player.getHitboxCenterXPos(); //centered
    float rodY = player.getHitboxCenterYPos(); //centered

    for (Catch temp : fish) {
      catchHeight = temp.getYCut();
      catchY = temp.getCenterYHit(); //centered
      catchX = temp.getCenterXHit(); //centered

      if ( dist(rodX, rodY, catchX, catchY) <= catchHeight/2 ) {
        player.myCatch(temp.isCaught());
      }
    }
  }

  public ArrayList getArray() {
    return fish;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int newScore) {
    score = newScore;
  }

  public void scoreBoard() {
    textFont(font, 16);
    fill(0);
    text("Score " + score, 30, 30);
  }

  public boolean time() {
    boolean timesUp = false;
    if ((time <= startTime) && (!timesUp)) {
      timeLeft = timeLeft - time;

      long second = (timeLeft / 1000) % 60;
      long minute = (timeLeft / (1000 * 60)) % 60;
      String timeDisplay = minute + ":" + second;
      showTimer(timeDisplay);
    }
    return timesUp;
  }

  //The time is set in millis (1 minute = 1000 millis.
  public void setStartTime(int time) {
    startTime = time;
  }

  public void startTimer() {
    time = millis();
  }

  public void showTimer(String time) {
    textFont(font, 16);
    fill(0);
    text("Time left " + time, 30, 50);
  }
} 