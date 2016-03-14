

public class Graphic {

  private PImage background;
  private PImage logo;
  private int hei;

  public Graphic() {
    background = loadImage("grafikk/background2tilpasset.png");
    logo = loadImage("grafikk/tempLogo.png");
    hei = 30;
  }
  public void drawBackground()
  {
    image(background, 0, 0, 1000, 700);
  }
  
  public void gameOverBackground() {
    
    background(hei,0,0);
    hei = hei+1;
    if (hei == 255 )
    {
      noLoop();
    }
    
  }
  
  public void drawLogo()
  {
    image(logo, 0, 0);
  }
}