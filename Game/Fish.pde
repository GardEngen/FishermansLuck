public class Fish {
  private float x = 200;
  private float y = 300;
  private float xDelta;
  private float yDelta;
  private PImage [] animation;
  private PImage fish;

  private int speedX; // fart x retning
  public Fish() {
    xDelta = random(-10, 10);
    yDelta = random(-10, 10);
  }
  public void drawFish() {
    fish = loadImage("Bilder.Grafikk/fishtest.png");
    animation = new PImage[3];
    for (int i=0; i < 3; i++) {

      animation[i] = fish.get(20*i, 0, 20, 15);
      image(animation[i], x, y);
    }

    x = x+xDelta;
    y = y + yDelta;
    if ((x > width - 40) || (x < 10)) {
      xDelta = xDelta *(-1);
    }
    if ((y > height - 40) || (y < 170 +40)) {
     yDelta = yDelta *(-1);
    }
  }

// Moves at different speed and start at differnt position
  public void randomPosition() {
    xDelta = 0;
    yDelta = int(random(height));
    speedX = int(random(1, 5));
    
    point(xDelta,yDelta);
    drawFish();
  }
  
  // brukes til å teste fiskene
  // funker ikke enda
  void draw(){
    if(mousePressed) {
    drawFish();
    }
  }

}