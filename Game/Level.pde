
class Level {

  //private int level;
  private int LEVEL;
  private int score;
  private int targetScore;
  private int spawner;
  private int startTime;
  private long minute;
  private long second;
  private long savedMin;
  private long savedSec;
  private long oldSecond;
  private boolean timesUp;
  private boolean saved;
  //private CountdownTimer time;
  private ArrayList <Catch> fish;
  private PFont font;



  Level() {
    //this.time = time;
    fish = new ArrayList <Catch>();
    spawner = 300; //How often fish are spawning. The lower the number, the ofter fish are spawn
    score = 0;
    font = createFont("Arial", 16, true);
    setStartTime(5);
    oldSecond = 0;
    timesUp = false;
    saved = false;
  }

  //Desides which level the player is in
  public void levelState() {

    switch(LEVEL) {

    case 1:
      targetScore = 10;
      timer();
      scoreBoard();
      level.catching();
      break;

    case 2:

      timer();
      scoreBoard();
      level.catching();
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
    text("Score " + score + " / " + targetScore, 30, 30);
  }


  public boolean timer() {
    long newSecond = second();

    if ((second == 0) && (minute == 0)) {
      timesUp = true;
    }
    if (newSecond != oldSecond) {
      oldSecond = newSecond;
      second = second - 1;
    }
    if (second == 0) {
      second = 59;
      minute = minute - 1;
    }

    if (second < 10) {
      String timeDisplay = minute + ":0" + second;
      showTimer(timeDisplay);
    } else {
      String timeDisplay = minute + ":" + second;
      showTimer(timeDisplay);
    }
    return timesUp;
  }

  //The time is set in second
  public void setStartTime(int min) {
    startTime = min - 1;
    minute = startTime - 1;
    second = 59;
  }

  public void resetTimer() {
    minute = startTime;
    second = 59;
  }

  public long getMinute() {
    return minute;
  }

  public long getSecond() {
    return second;
  }

  public void pauseTimer() {
    if (!saved) {
      savedMin = minute;
      savedSec = second;
      saved = true;
    }
  }

  public void startTimer() {
    if (saved) {
      minute = savedMin;
      second = savedSec;
      saved = false;
    }
  }

  public void showTimer(String time) {
    textFont(font, 16);
    fill(0);
    text("Time left " + time, 30, 50);
  }
} 