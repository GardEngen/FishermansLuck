
public class Player {

  private Control control;
  private int boatPosition = 215;
  private int boatSpeed = 4;
  private PImage [] fisherAnimation;
  private int currentFrameOfFisher;
  private float fisherAnimationDelay;

  public Player() {
    control = new Control();
    control.setSpeedX(boatSpeed);
    control.setPositionX(boatPosition);
  }

  //Manages the boatMovement
  public void boat() {
    int xPos = control.horizontalMove();
    int rod = control.rodInteraction();
    drawFisher(); 
    //hook image
    PImage hook = loadImage("Bilder.Grafikk/hook.png");
    //Fishingline
    line(xPos+300, 50, xPos+300, 63 +rod);
    //draw hook
    image(hook, xPos+281, 57+rod);
    //draw hitbox
    int hitBoxYPos= 154+rod;
    //stroke(255, 0, 0);
    //noFill();
    //rect(getHitboxXPosition(), hitBoxYPos, 16, 29);
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
  public float getHitboxXPosition()
  {
    float hitBoxXPos = control.horizontalMove() + 77;
    return hitBoxXPos;
  }
  //Returns Hitbox y position
  public float getHitboxYPosition()
  {
    float hitBoxYPos = control.rodInteraction() + 155 ;
    return hitBoxYPos;
  }

  //Draws the Fisher, animates the images
  public void drawFisher() {
    //Fisher image
    PImage fisher = loadImage("Bilder.Grafikk/fisker.png");
    int xPosFisher = control.horizontalMove();
    fisherAnimation = new PImage[5];
    fisherAnimationDelay = (fisherAnimationDelay + 0.15) % 5;
    currentFrameOfFisher =  int(fisherAnimationDelay);
    fisherAnimation[currentFrameOfFisher] = fisher.get(300*currentFrameOfFisher, 0, 300, 220);
    image(fisherAnimation[currentFrameOfFisher], xPosFisher, 30);
  }
}