
public class Player {

  private Control control;
  private int boatPosition = 215;
  private int boatSpeed = 4;
  private PImage [] fisherAnimation;
  private int currentFrameOfFisher;
  private float fisherAnimationDelay;
  private PImage fisher;
  private PImage hook;

  public Player() {
    control = new Control();
    control.setSpeedX(boatSpeed);
    control.setPositionX(boatPosition);
    hook = loadImage("Bilder.Grafikk/hook.png");
    fisher = loadImage("Bilder.Grafikk/fisker.png");
  }

  //Manages the boatMovement
  public void boat() {
    int xPos = control.horizontalMove();
    int rod = control.rodInteraction();
    drawFisher(); 
    //Fishingline
    line(xPos+300, 50, xPos+300, 63 +rod);
    //draw hook
    image(hook, xPos+281, 57+rod);
  }

  //Sets new boat speed
  public void setBoatSpeed(int newSpeed) {
    boatSpeed = newSpeed;
    control.setSpeedX(boatSpeed);
  }

  //Sets new start x position
  public void setStartPosition(int newPositionX) {
    boatPosition = newPositionX;
    control.setPositionX(boatPosition);
  }

  //Returns Hitbox x position
  public int getHitboxCenterXPos()
  {
    int pos = 270 + control.horizontalMove() + (hook.width/2);
    return pos;
  }
  
  //Returns Hitbox y position
  public int getHitboxCenterYPos()
  {
    int hitBoxYPos = 65+control.rodInteraction() + (hook.height/2);
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
}