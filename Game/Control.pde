

public class Control {
  private int startPositionX;
  private int speedX;
  private int fishingLine; 
  private boolean hookInWater;
  private int minLenght;
  private int maxLenght;
  //private PImage [] animation;

  Control() {
    minLenght = 50;
    maxLenght = 550;
    hookInWater = false;
    fishingLine = minLenght;
  }

  //Returns an X position value, that changes if arrow keys are pressed 
  public int horizontalMove() {

    if (keyPressed && (key == CODED)) {
      if (keyCode == LEFT && (startPositionX > 4)) {
        startPositionX = startPositionX -speedX;
      } else if (keyCode == RIGHT && (startPositionX < width-56)) {
        startPositionX = startPositionX +speedX;
      }
    }
    return startPositionX;
  }

  //Returns fishingLine bla bla #kan sikkert kodes bedre :D:D
  public int rodInteraction() {
    char spaceKey =' ';

    if (keyPressed) {
      if ((key == spaceKey) && (hookInWater == false))
      {
        fishingLine = 200;
        hookInWater = true;
      }
    }
    //if the hook is in the water, the player can move it
    if (keyPressed && (key == CODED))
    {
      if (keyCode == DOWN && (hookInWater) && fishingLine < maxLenght)
      { 
        fishingLine = fishingLine + 5;
      }
      if (keyCode == UP && (hookInWater) && fishingLine > minLenght)
      {
        fishingLine = fishingLine - 5;
      }
    }
    return fishingLine;
  }

  public int getMinLineLenght() {
    return minLenght;
  }

  //Sets X value start position 
  public void setPositionX(int xPotition) {
    startPositionX = xPotition;
  }

  //Sets the moving speed
  public void setSpeedX(int speed) {
    speedX = speed;
  }

  public void takeOutHook() {
    hookInWater = false;
  }

  // set the Y value of the rood.
  public void setRoodY(int yPosition) {
    fishingLine = yPosition;
  }

  // set the hook in the water. used in saving
  public void setHookInWater(boolean hook) {
    hookInWater = hook;
  }

  // get the hook used in saving
  public boolean checkHookInWater() {
    return hookInWater;
  }
}