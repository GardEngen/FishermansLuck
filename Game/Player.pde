public class Player {

  private Control control;
  private int boatPosition = 215;
  //  private final int DEFAULT_BOAT_POSITION = 215;
  private int boatSpeed = 4;
  private PImage [] fisherAnimation;
  private int currentFrameOfFisher;
  private float fisherAnimationDelay;
  private PImage fisher;
  private PImage hookM;
  private PImage hookU;
  private GameElement newCatch;
  private boolean caught;
  private PImage hook;
  private int life;
  private boolean onBoard;
  private boolean danger;

  public Player() {
    control = new Control();
    control.setSpeedX(boatSpeed);
    control.setPositionX(boatPosition);
    //  control.setPositionX(DEFAULT_BOAT_POSITION);
    hookM = loadImage("animation/hook1copy.png");
    hookU = loadImage("animation/hookUtencopy.png");
    fisher = loadImage("animation/fisker.png");
    caught = false;
    onBoard = false;
  }

  //Manages the boatMovement
  public void boat() {
    int xPos = control.horizontalMove();
    int rod = control.rodInteraction();
    drawFisher(); 
    //Fishingline
    line(xPos+299, 57, xPos+300, 63+rod);
    //draw hook
    if (caught == true) {

      image(hookU, xPos+292, 57+rod);
      catchPosition(xPos+245, 50+rod);
      if (rod <= control.minLenght) {
        onBoard = true;
      } 
      else {
        onBoard = false;
      }
      
    } else {
      image(hookM, xPos+285, 57+rod);
    }
  }

  //Sets new boat speed
  public void setBoatSpeed(int newSpeed) {
    boatSpeed = newSpeed;
    control.setSpeedX(boatSpeed);
  }

  // Sets player position. used in saving
  public void setPlayerPosition(int newPositionX) {
    //boatPosition = newPositionX;
    control.setPositionX(newPositionX);
  }

  ////Sets new start x position
  //public void setStartPosition(int newPositionX) {
  //  boatPosition = newPositionX;
  //  control.setPositionX(boatPosition);
  //}

  // get position of the player. used in saving
  public int getPlayerPosition() {
    return control.horizontalMove();
  }

  // get position of the hook. used in saving
  public int getHookPosition() {
    return control.rodInteraction();
  }

  // set the position of the hook. used in saving
  public void setHookPosition(int newPositonY) {
    control.setRoodY(newPositonY);
  }

  //Returns Hitbox x position
  public int getHitboxCenterXPos() {
    int pos = 270 + control.horizontalMove() + (hookM.width/2);
    return pos;
  }

  //Returns Hitbox y position
  public int getHitboxCenterYPos() {
    int hitBoxYPos = 65+control.rodInteraction() + (hookM.height/2);
    return hitBoxYPos;
  }

  public int getHitboxHeight() {
    return hook.height;
  }

  public int getHitboxWidth() {
    return hook.width;
  }

  //Draws the Fisher, animates the images
  public void drawFisher() {
    int xPosFisher = control.horizontalMove();
    fisherAnimation = new PImage[5];
    fisherAnimationDelay = (fisherAnimationDelay + 0.15) % 5;
    currentFrameOfFisher =  int(fisherAnimationDelay);
    fisherAnimation[currentFrameOfFisher] = fisher.get(300*currentFrameOfFisher, 0, 300, 220);
    image(fisherAnimation[currentFrameOfFisher], xPosFisher, 30);
  }

  public void myCatch(GameElement newCatch) {
    this.newCatch = newCatch;
    danger = this.newCatch.getDangerState();
    caught = true;
  }

  public GameElement getCatch() {
    return newCatch;
  }

  public boolean checkIfDangerous() {
    return danger;
  }

  public void catchPosition(int x, int y) {
    int xPos = x;
    int rod = y;
    newCatch.onTheHook(xPos, rod);
  }

  public boolean gotCatch() {
    return caught;
  }

  public boolean fishOnBoard() {
    boolean x = false;
    if ((caught == true) && (onBoard == true) ) {
      x = true;
      caught = false;
      onBoard = false;
      control.takeOutHook();
    }
    return x;
  }
  //Må se på
  public int gethorizontalMove()
  {
    return control.horizontalMove();
  }

  // get the life of the player
  public int getLife() {
    return life;
  }

  // set the life of the player
  public int setLife(int life) {
    return life;
}
}