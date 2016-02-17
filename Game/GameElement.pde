public class GameElement {

  private float xPosition; //the X position of the object
  private float yPosition; //the Y position of the object
  private int startPosition; //Is used to deside is the object starts from left or right
  private PImage [] animation;
  private PImage fishP;
  private boolean startLeft;
  
  //Variables below is used to cut the elemente image in the right places to create a movement
  private float imageDelay;
  private int imageXCut;
  private int imageYCut;
  private int numberOfImages;
  private float AnimationDelay;

  public GameElement() {
    yPosition = random(300, (height - 80));
    startPosition = int (random(-1, 2));
    //println(startPosition);
    // startPosition = 0;
    startLeft = setStartPosition();
  }

  //Sets the start position, left or right
  private boolean setStartPosition() {
    if (startPosition == 0) {
      xPosition = -40;
      startLeft = true;
    } else if (startPosition == 1) {
      xPosition = width + 40;
      startLeft = false;
    }
    return startLeft;
  }

  //Changes the speed, and moves the object
  public void elementMovement(float speed, PImage image, PImage imageRevers) {

    if ((startLeft == false)&&(xPosition > -20))
    {
      xPosition = xPosition - speed;
      drawElement(imageRevers);
    } else if ((startLeft == true)&&(xPosition < width + 40)) {
      xPosition = xPosition + speed;
      drawElement(image);
    }
  }
  
  //Desides the size og the element object, and how many par the picture has.
  //It also sets the speed of thmfloatovement.
  public void imageDivider(int numberOfpictures, int xCut, int yCut, float delay)
  {
    imageXCut = xCut;
    imageYCut = yCut;
    numberOfImages = numberOfpictures;
    imageDelay = delay;
  }
  
  public float getCenterXHit() {
    float pos;
    if (startLeft == true) { 
      pos = xPosition + (imageXCut/2);
    }
    else {
      pos = xPosition + (imageYCut/2);
    }
    return pos;
  }
  
  public float getCenterYHit() {
    float pos = yPosition + (imageYCut/2);
    return pos;
  }
  
  //Returns the width of the objects
  public int getXCut() {
   return imageXCut;
  }
  
  //Returns the height of the object
  public int getYCut() {
  return imageYCut;
  }

  //Draws the object, sets the position and animates the images
  public void drawElement(PImage picture) {
    int currentFrameNr;
    fishP = picture;
    animation = new PImage[numberOfImages];
    AnimationDelay = (AnimationDelay + imageDelay) % numberOfImages;
    currentFrameNr =  int(AnimationDelay);
    animation[currentFrameNr] = fishP.get(imageXCut*currentFrameNr, 0, imageXCut, imageYCut);
    image(animation[currentFrameNr], xPosition, yPosition);
  }
}