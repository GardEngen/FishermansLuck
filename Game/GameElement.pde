public class GameElement {

  private float xPosition;
  private float yPosition;
  private float startPosition;
  private PImage [] animation;
  private PImage fishP;

  public GameElement() {
    yPosition = random(300, height);
    //startPosition = random(0, 2)%2;
    startPosition = 0;
  }

//Sets the start position, left or right
  public boolean setStartPosition() {
    boolean startLeft = false;
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
  public void elementMovement(float speed, PImage image) {
    boolean startLeft = setStartPosition();
    if ((startLeft == true) && (xPosition < width + 40)) {
        xPosition = xPosition - speed;
        drawElement(image);
      }
     else {
      if ((startLeft == false)&&(xPosition > -20)) {
        xPosition = xPosition + speed;
        drawElement(image);
      }
    }
  }

//Draws the object, sets the position
    public void drawElement(PImage picture) {
      fishP = picture;
      animation = new PImage[4];
      for (int i=0; i < 4; i++) {
       animation[i] = fishP.get(20*i, 0, 20, 15);
       image(animation[i], xPosition, yPosition);
      }
    }
  }