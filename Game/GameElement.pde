public class GameElement {

  private float xPosition;
  private float yPosition;
  private int startPosition;
  private PImage [] animation;
  private PImage fishP;
  private boolean startLeft;
  private int currentFrame;
  private float imageDelay;
  private int imageXCut;
  private int imageYCut;
  private int numberOfImages;
  private float AnimationDelay;

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
      rect(xPosition, yPosition, 100, 55);
      drawElement(imageRevers);
    } else if ((startLeft == true)&&(xPosition < width + 40)) {
      xPosition = xPosition + speed;
      rect(xPosition, yPosition, 100, 55);
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

    boolean hit;
    //println("hitboxposiXX: " +xPosHitbox);
    //println("hitboxposY: " +yPosHitbox);
    //println("fiskX: " +xPositionFish);
    //println("fiskY: " +yPositionFish);
    if (startLeft)
    {
      if (xPositionFish >= xPosHitbox)
      {
        hit = true;
        //println(hit);
      } else
      {
        hit = false;
        //println(hit);
      }
    }
  }
  
  public void imageDivider(int numberOfpictures, int xCut, int yCut, float delay)
  {
    imageXCut = xCut;
    imageYCut = yCut;
    numberOfImages = numberOfpictures;
    imageDelay = delay;
  }


  //Draws the object, sets the position and animates the images
  public void drawElement(PImage picture) {
    fishP = picture;
    //i is not in use yet, some problem with animation = new PImage[i]
    int i = numberOfImages; 
    animation = new PImage[8];
    AnimationDelay = (AnimationDelay + imageDelay) % i;
    currentFrame =  int(AnimationDelay);
    animation[currentFrame] = fishP.get(imageXCut*currentFrame, 0, imageXCut, imageYCut);
    image(animation[currentFrame], xPosition, yPosition);
  }
}