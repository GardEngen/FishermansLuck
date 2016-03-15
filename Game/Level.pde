
class Level {

  //private int level;
  private int LEVEL;
  private int score;
  private int targetScore;
  private int spawner;
  private Timer timer;
  private Player player;
  private boolean levelComplete;
  private ArrayList <Catch> fish;
  private PFont font;
  private boolean oneFishType;
  private boolean hardcoreModefail;
  private String fishToCatch;

  private Catch c;

  Level(Player player) {
    this.player = player;
    hardcoreModefail = false;
    //this.targetScore = targetScore;
    fish = new ArrayList <Catch>();
    timer = new Timer(4); // in minutes
    spawner = 300; //How often fish are spawning. The lower the number, the ofter fish are spawn
    score = 0;
    font = createFont("Arial", 16, true);
    fishToCatch = "";
    
    c = new Catch();
  }

  //Desides which level the player is in
  public void levelState() {
    boolean timesUp = false;

    switch(LEVEL) {

    case 1:
      oneFishType = false;
      targetScore = 20;
      timesUp = timer.time();
      level.catching();
      scoreBoard();
      if ((score == targetScore)&& (!timesUp)) {
        STATE = STATE_LEVEL;
      }
      if (timesUp) {
        STATE = STATE_GAME_OVER;
      }
      break;

    case 2:
      oneFishType = true;
      targetScore = 10;
      fishToCatch = "Guri";
      timesUp = timer.time();
      level.catching();
      scoreBoard();
      if ((score == targetScore)&& (!timesUp)) {
        STATE = STATE_LEVEL;
      }
      if (timesUp) {
        STATE = STATE_GAME_OVER;
      }
      break;

    case 3:
      oneFishType = false;
      level.catching();
      scoreBoardFree();
      
      break;

    case 4:
      oneFishType = false;
      level.catching();
      scoreBoardFree();
      player.setHookSpeed(10);
      if (hardcoreModefail)
      {
        STATE = STATE_GAME_OVER;
      }
      break;

    default:
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
        hardcoreModefail = true;
      }
    }

    if ( (player.gotCatch() == true) && (player.checkIfDangerous() == true) ) {
      STATE = STATE_GAME_OVER;
    }

    if ( (player.gotCatch() == true) && (player.fishOnBoard() == true) ) {
      if (!oneFishType) {
        score = score + 1;
      }
      for (int i = 0; i < fish.size(); i++) {
        if (fish.get(i).equals(player.getCatch())) {
          if ((oneFishType == true) && (fish.get(i).getFishName()).equals(fishToCatch)) {
            score = score + 1;
          }
          fish.remove(i);
        }
      }
    }

    if (player.gotCatch() == false) {
      catchSomething();
    }
    spawner = spawner + int(random(1, 10));
  }


  //Creats a fish and adds it to the arraylist
  public void spawn() {
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
    text("Score " + score + "/" + targetScore, 30, 30);
  }

  public void scoreBoardFree() {
    textFont(font, 16);
    fill(0);
    text("Score " + score, 30, 30);
  }

  public boolean levelCompleted() {
    if ((targetScore == score) && (!timer.checkIfTimesUp())) {
      levelComplete = true;
    }
    return levelComplete;
  }

  public void startTimer() {
    timer.startTimer();
  }

  public void pauseTimer() {
    timer.pauseTimer() ;
  }

  public void resetTimer() {
    timer.resetTimer();
  }
} 