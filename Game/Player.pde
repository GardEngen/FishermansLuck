
public class Player {

  private Control control;
  private int boatPosition = 215;
  private int boatSpeed = 4;

  public Player() {
    control = new Control();
    control.setSpeedX(boatSpeed);
    control.setPositionX(boatPosition);
  }

  //Manages the boatMovement
  public void boat() {
    int xPos = control.horizontalMove();
    int rod = control.rodInteraction();
    //hook image
    PImage hook = loadImage("Bilder.Grafikk/hook.png");

    stroke(0);
    rect(xPos, 178, 50, 30);

    //Fishingrod kan deles opp i to funskjoner
    line(xPos+90, 147, xPos+40, 178);
    line(xPos+90, 147, xPos+50, 178);
    //Fishingline
    line(xPos+90, 147, xPos+90, 155 +rod);
    //draw hook
    image(hook, xPos+71, 150+rod);
    //draw hitbox
    int hitBoxYPos= 154+rod;
    stroke(255, 0, 0);
    noFill();
    rect(getHitboxXPosition(), hitBoxYPos, 16, 29);
    //println("sluuuuuuuk " + hitBoxXPos);
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
}