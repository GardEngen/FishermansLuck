public class Fish {
  private float x = 200;
  private float y = 300;
  private float xDelta;
  private float yDelta;
  private PImage [] animation;
  private PImage fish;
  private boolean inMotion = true;
  private int speedX; // fart x retning
  
  public Fish() {
    xDelta = random(-10, 10);
    yDelta = random(-10, 10);
  }
 
  public void drawFish() {
    fish = loadImage("Bilder.Grafikk/fishtest.png");
    animation = new PImage[4];
    for (int i=0; i < 4; i++) {

      animation[i] = fish.get(20*i, 0, 20, 15);
    }
    x = x+xDelta;

    if ((x > width - 40) || (x < 10)) {
      xDelta = xDelta *(-1);
    }
   
    //virker ikke
    while (inMotion == true)
    {
      int i=1;
  
      i = (i + 1) % 4;
      image(animation[i], x, y);
        break;
      
    }
  }
  
  public float getFishXpos()
    {
        return x;
    }

  // Moves at different speed and start at differnt position
  public void randomPosition() {
    xDelta = 0;
    yDelta = int(random(height));
    speedX = int(random(1, 5));

    point(xDelta, yDelta);
    drawFish();
  }

  // brukes til å teste fiskene
  // funker ikke enda
  void draw() {
    if (mousePressed) {
      drawFish();
    }
  }
}