private int startPositionX;
private int speedX;

public class Control {

  Control() {
  }
  

  public int horizontalMove() {
    if(keyPressed && (key == CODED)) {
      if(keyCode == LEFT) {
        startPositionX = startPositionX -speedX;
      }
      else if(keyCode == RIGHT) {
        startPositionX = startPositionX +speedX;
      }
    }
    return startPositionX;
  }
  
  public void setPositionX(int xPotition) {
    startPositionX = xPotition;
  }
  
  public void setSpeedX(int speed) {
    speedX = speed;
  }
}