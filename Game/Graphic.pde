

public class Graphic {

  private PImage background;
  private PImage logo;
 //ß private int hei;

  public Graphic() {
    background = loadImage("grafikk/background2tilpasset.png");
    logo = loadImage("grafikk/tempLogo.png");
    //hei = 0;
  }
  public void drawBackground()
  {
    image(background, 0, 0, 1000, 700);
  }

  public void gameBlackBackground() {
    fill(0, 0, 0, 10);
    rect(0, 0, 1000, 700);

  }
  
  //public void winBackground() {
  //   fill(0, 0, 0, 10);
  //  rect(0, 0, 1000, 700);
  //}

  public void drawLogo()
  {
    image(logo, 0, 0);
  }
}