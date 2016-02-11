public class GameElement {

  private float xPosition;
  private float yPosition;
  private int startPosition;
  private PImage [] animation;
  private PImage fishP;
  private boolean startLeft;
  private int currentFrame;
  private float delay;

  public GameElement() {
    yPosition = random(300, (height - 20));
    startPosition = int (random(-1, 2));
    println(startPosition);
    // startPosition = 0;
    startLeft = setStartPosition();
  }

  //Sets the start position, left or right
  public boolean setStartPosition() {
    if (startPosition == 0) {
      xPosition = -40;
      startLeft = true;
    } else if (startPosition == 1) {
      xPosition = width + 40;
      startLeft = false;
    }
    println(startLeft);
    return startLeft;
  }

  //Changes the speed, and moves the object
  public void elementMovement(float speed, PImage image) {

    //if (startLeft == true)
    ////&& (xPosition < width + 40))
    //{
    //    xPosition = xPosition + speed;
    //    drawElement(image);
    //  }
    if ((startLeft == false)&&(xPosition > -20))
    {
      xPosition = xPosition - speed;
      drawElement(image);
    } else if ((startLeft == true)&&(xPosition < width + 40)) {
      xPosition = xPosition + speed;
      drawElement(image);
    }
  }


  //Draws the object, sets the position and animates the images
  public void drawElement(PImage picture) {
    fishP = picture;
    animation = new PImage[4];
    delay = (delay + 0.05) % 4;
    currentFrame =  int(delay);
    animation[currentFrame] = fishP.get(20*currentFrame, 0, 20, 15);
    image(animation[currentFrame], xPosition, yPosition);
  }
}