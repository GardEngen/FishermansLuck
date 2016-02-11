

public class Control {
private int startPositionX;
private int speedX;
//private PImage [] animation;
  
  Control() {
  }

  //Returns an X position value, that changes if arrow keys are pressed 
  public int horizontalMove() {
    if (keyPressed && (key == CODED)) {
      if (keyCode == LEFT && (startPositionX > 4))  {
        startPositionX = startPositionX -speedX;
      }
      else if (keyCode == RIGHT && (startPositionX < width-56)) {
        startPositionX = startPositionX +speedX;
      }
    }
    return startPositionX;
  }

  //Sets X value start position 
  public void setPositionX(int xPotition) {
    startPositionX = xPotition;
  }

  //Sets the moving speed
  public void setSpeedX(int speed) {
    speedX = speed;
  }
}