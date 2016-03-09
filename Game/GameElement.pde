public class GameElement {

  private float xPosition; //the X position of the object
  private float yPosition; //the Y position of the object
  private int startPosition; //Is used to deside is the object starts from left or right
  private PImage [] animation;
  private PImage fishP;
  private boolean startLeft;
  private boolean caught;
  private boolean dangerous;
  //Variables below is used to cut the elemente image in the right places to create a movement
  private float imageDelay;
  private int imageXCut;
  private int imageYCut;
  private int numberOfImages;
  private float AnimationDelay;
  private boolean inMotion;
  
  public GameElement() {
    yPosition = random(300, (height - 60));
    startPosition = (int (random(0,10))%2); //Mod is used to optimize the random() function
    startLeft = setStartPosition();
    caught = false;
    inMotion = true;
  }

  //Sets the start position, left or right
  public boolean setStartPosition() {
    if (startPosition == 0) {
      xPosition = -70;
      startLeft = true;
    } else if (startPosition == 1) {
      xPosition = width + 40;
      startLeft = false;
    }
    return startLeft;
  }

  // set the position of the fish
  public void setFishPosX(float yPos) { 
    this.xPosition = yPos;
  }

  // get the X posisjon of the fish PROBLEMER
  public float getFishPositionX() { 
    return xPosition;
  }

  // set the Y position of the fish
  public void setFishPosY(float yPos) {
    yPosition = yPos;
  }

  // get the Y position of the fish PROBLEMER
  public float getFishPositionY() {
    return yPosition;
  }

  //Changes the speed, and moves the object
  public void elementMovement(float speed, PImage image, PImage imageRevers, PImage taken, boolean dangerous) {
    
    if(dangerous == true) {
      this.dangerous = dangerous;
    }
    if(caught == true) {
      drawElement(taken);
    }

    else if ((startLeft == false)&&(xPosition > -60)&&(caught == false))
    {
      xPosition = xPosition - speed;
      drawElement(imageRevers);
      
    } else if ((startLeft == true)&&(xPosition < width + 40)&&(caught == false)) {
      xPosition = xPosition + speed;
      drawElement(image);
    }
    
    else {
      inMotion = false;
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
    } else {
      pos = xPosition + (imageYCut/2);
    }
    return pos;
  }

  public float getCenterYHit() {
    float pos = yPosition + (imageYCut/2);
    return pos;
  }

  //Returns the height of the object
  public int getYCut() {
    return imageYCut;
  }

  //Draws the object, sets the position and animates the images
  public void drawElement(PImage picture) {
    fishP = picture;
    if(caught == true) {
       image(fishP, xPosition, yPosition);
      
    } else { 
        int currentFrameNr;
        animation = new PImage[numberOfImages];
        AnimationDelay = (AnimationDelay + imageDelay) % numberOfImages;
        currentFrameNr =  int(AnimationDelay);
        animation[currentFrameNr] = fishP.get(imageXCut*currentFrameNr, 0, imageXCut, imageYCut);
    
      image(animation[currentFrameNr], xPosition, yPosition);
    }
  }
  
  public void onTheHook(float x, float y) {
    caught = true;
    xPosition = x;
    yPosition = y;
  }
  
  // Returns a value of whether or not the object is in motion.
  public boolean isInMotion() {
    return inMotion;
  }
  
  //Returns a boolean. True if the object is dangerous, and false if not.
  public boolean getDangerState() {
    return dangerous;
  }
}