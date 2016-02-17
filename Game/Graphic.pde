

public class Graphic {

  private PImage background;

  public Graphic() {
    background = loadImage("Bilder.Grafikk/background2tilpasset.png");
  }
  public void drawBackground()
  {

    image(background, 0, 0, 1000, 700);
  }
}