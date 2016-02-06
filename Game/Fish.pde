public class Fish {
  private float xPosition;
  private float yPosition;
  private float xDelta;
  private PImage [] animation;
  private PImage fish;
  private boolean inMotion = true;
  private int speedX; // fart x retning
  
  public Fish() {
    xDelta = random(-10, 10);
    xPosition = 50;
    yPosition = random(250, 600);
  }
 
  public void drawFish() {
    fish = loadImage("Bilder.Grafikk/fishtest.png");
    animation = new PImage[4];
    for (int i=0; i < 4; i++) {

      animation[i] = fish.get(20*i, 0, 20, 15);
    }
    xPosition = xPosition+xDelta;

    if ((xPosition > width - 40) || (xPosition < -1)) {
      xDelta = xDelta *(-1);
    }
   
    //virker ikke
    while (inMotion == true)
    {
      int i=1;
  
      i = (i + 1) % 4;
      image(animation[i], xPosition, yPosition);
        break;
      
    }
  }
  
  public float getFishXpos()
    {
        return xPosition;
    }

  // Moves at different speed and start at differnt position
  public void randomPosition() {
    xDelta = 0;
   
  

    //point(xDelta);
    drawFish();
  }

}