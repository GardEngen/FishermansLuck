private Control control;
private int boatPosition = 215;
public class Player {

  public Player() {
    control = new Control();
  }
  
  public void boat() {
    if(keyPressed && (key == CODED)) {
      if(keyCode == LEFT) {
        boatPosition = boatPosition -4;
      }
      else if(keyCode == RIGHT) {
        boatPosition = boatPosition +4;
      }
    }
    rect(boatPosition,178,50,30);
  }
}