

public class Graphic {

  private PImage background;
  
  public Graphic() {
  }
  public void drawBackground()
  {
    background = loadImage("Bilder.Grafikk/background.png");
    image(background, 0, 0);
  }
}