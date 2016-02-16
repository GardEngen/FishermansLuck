

public class Graphic {

  private PImage background;
  
  public Graphic() {
  }
  public void drawBackground()
  {
    background = loadImage("Bilder.Grafikk/background2.png");
    image(background, 0, 0, 1000, 700);
  }
}