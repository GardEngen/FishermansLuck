public class GameElement {

  private float xPosition;
  private float yPosition;
  private int startPosition;
  private PImage [] animation;
  private PImage fishP;
  private boolean startLeft;
  private int currentFrame;
  private float delay;

  private Player player;

  public GameElement() {
    yPosition = random(300, (height - 20));
    startPosition = int (random(-1, 2));
    //println(startPosition);
    // startPosition = 0;
    startLeft = setStartPosition();

    player = new Player();
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
    //println(startLeft);
    return startLeft;
  }

  //Changes the speed, and moves the object
  public void elementMovement(float speed, PImage image, PImage imageRevers) {

    //if (startLeft == true)
    ////&& (xPosition < width + 40))
    //{
    //    xPosition = xPosition + speed;
    //    drawElement(image);
    //  }
    if ((startLeft == false)&&(xPosition > -20))
    {
      xPosition = xPosition - speed;
      drawElement(imageRevers);
    } else if ((startLeft == true)&&(xPosition < width + 40)) {
      xPosition = xPosition + speed;
      drawElement(image);
    }
  }
  //hitbox under utvikling
  public void hitboxAction()
  {
    float xPositionFish = xPosition;
    float yPositionFish = yPosition;
    float xPosHitbox = player.getHitboxXPosition();
    float yPosHitbox = player.getHitboxYPosition();
    //println("hitboxposiXX: " +xPosHitbox);
    //println("hitboxposY: " +yPosHitbox);
    //println("fiskX: " +xPositionFish);
    //println("fiskY: " +yPositionFish);
    if (startLeft)
    {
      if (xPositionFish >= xPosHitbox-10 &&
      ((yPositionFish >= yPosHitbox -10) || (yPositionFish <= yPosHitbox +10)))
      {
        //println("FUCK YEAH");
      }
    }
  }


  //Draws the object, sets the position and animates the images
  //Gard skal fikse sånn at denne endres utifra størrelse på fisk. 
  //Gard skal fikse bere kodestil
  public void drawElement(PImage picture) {
    fishP = picture;
    animation = new PImage[8];
    delay = (delay + 0.80) % 8;
    currentFrame =  int(delay);
    animation[currentFrame] = fishP.get(100*currentFrame, 0, 100, 55);
    image(animation[currentFrame], xPosition, yPosition);
  }
}