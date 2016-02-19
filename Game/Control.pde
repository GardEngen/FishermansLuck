

public class Control {
  private int startPositionX;
  private int speedX;
  private int fishingLine; 
  private boolean hookInWater = false;
  //private PImage [] animation;

  Control() {
  }

  // Keys for the menu
  public void keysForMenu() {
    if (keyPressed && (key == '1')) {
      STATE = STATE_CONTINUE;
    } else if (keyPressed && (key == '2')) {
      STATE = STATE_PLAYING;
    } else if (keyPressed && (key == '3')) {
      STATE = STATE_TUTUROIAL;
    } else if (keyPressed && ((key == 'q') || (key == 'Q'))) {
      STATE = STATE_QUIT;
    } else if (keyPressed && ((key == 'h') || (key == 'H'))) {
      STATE = STATE_HELP;
    }
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
      if (key == spaceKey)
      {
        fishingLine = 150;
        hookInWater = true;
      }
    }
    //if the hook is in the water, the player can move it
    if (keyPressed && (key == CODED))
    {
      if (keyCode == DOWN && (hookInWater) && fishingLine < 550)
      { 
        fishingLine = fishingLine + 5;
      }
      if (keyCode == UP && (hookInWater) && fishingLine > 100)
      {
        fishingLine = fishingLine - 5;
      }
    }
    return fishingLine;
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