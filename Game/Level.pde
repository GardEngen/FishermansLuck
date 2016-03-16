
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
  private boolean win;
  private boolean gameOver;
  private int sharkProb;
  private boolean timesUp;

  Level(Player player) {
    this.player = player;
    hardcoreModefail = false;
    //this.targetScore = targetScore;
    fish = new ArrayList <Catch>();
    timer = new Timer(4); // in minutes
    spawner = 300; //How often fish are spawning. The lower the number, the ofter fish are spawn
    score = 0;
    font = createFont("Fantasy", 16, true);
    fishToCatch = "";
    win = false;
    gameOver = false;
    sharkProb = 0; //default
   // startTimer();
   timesUp = false;
  }

  //Desides which level the player is in
  public void levelState() {

    switch(LEVEL) {

    case 1:
      sharkProb = 50;
      oneFishType = false;
      levelComplete = false;
      targetScore = 20;
      timesUp = timer.time();
     if (timesUp) {
        gameOver = true;
        //STATE = STATE_GAME_OVER;
      }
      else if ((score == targetScore)&& (!timesUp)) {
        win = true;
      } 
      else {
 
      level.catching();
      scoreBoard();
      }

      break;

    case 2:
     sharkProb = 40;
      oneFishType = true;
      levelComplete = false;
      targetScore = 10;
      fishToCatch = "Guri";
      timesUp = timer.time();
      
     if (timesUp) {
        gameOver = true;
        resetTimer();
      }
       else if ((score == targetScore)&& (!timesUp)) {
        win = true;
      }
      else {
      timesUp = timer.time();
      level.catching();
      scoreBoard();
      }
      break;

    case 3:
      sharkProb = 60;
      oneFishType = false;
      levelComplete = false;
      level.catching();
      scoreBoardFree();
      
      break;

    case 4:
      sharkProb = 0;
      oneFishType = false;
      player.setHookSpeed(10);
      scoreBoardFree();
      if (hardcoreModefail) {
        gameOver = true;
      }
      else {
       level.catching();
       
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
        if(!fish.get(i).isDangerous()) {
        hardcoreModefail = true;
        fish.remove(i);
        }
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
    fish.add(new Catch(sharkProb));
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
    textFont(font, 20);
    fill(0);
    text("Score " + score + "/" + targetScore, 30, 30);
  }

  public void scoreBoardFree() {
    textFont(font, 20);
    fill(0);
    text("Score " + score, 30, 30);
  }
  
    public void winBoard() {
    textFont(font, 50);
    fill(255);
    text("Level Fullført", 340, 200);
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
    timesUp = false;
    timer.resetTimer();
  }
  
  public boolean getWinStatus() {
    return win;
  }
  
  public void resetAfterWin() {
    win = false;
    score = 0;
    resetTimer();
    player.resetPlayer();
    player.setHookSpeed(6);
  }
  
  public boolean getGameOverStatus() {
    return gameOver;
  }
  
    public int getLevel() {
    return LEVEL;
  }
  
    // set the win status
  public void setWinStatus(boolean newWin) {
    win = newWin;
  }
  
    // set if the level is completed.
  public void setLevelCompleted(boolean newLevelComplete) {
    levelComplete = newLevelComplete;
  }
} 