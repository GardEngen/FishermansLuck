private Control control;
private int boatPosition = 215;
private int boatSpeed = 4;
public class Player {

  public Player() {
    control = new Control();
    control.setSpeedX(boatSpeed);
    control.setPositionX(boatPosition);
  }
  
  public void boat() {

    rect(control.horizontalMove(),178,50,30);
  }
}