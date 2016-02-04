private PImage background;
public class Graphic {

  public Graphic() {
  }
  public void drawBackground()
  {
    background = loadImage("Bilder.Grafikk/background.png");
    image(background, 0, 0);
  }
}