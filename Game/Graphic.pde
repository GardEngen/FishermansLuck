

public class Graphic {

  private PImage background;
  private PImage logo;
  private int PICTURE;

  public Graphic() {
    background = loadImage("grafikk/background2tilpasset.png");
    logo = loadImage("grafikk/tempLogo.png");
  }
  public void drawBackground()
  {
    image(background, 0, 0, 1000, 700);
  }

  public void gameBlackBackground() {
    fill(0, 0, 0, 10);
    rect(0, 0, 1000, 700);
  }

  public void tutorialPic(int picNr)
  {  
    PICTURE = picNr;
    switch(PICTURE)
    {
    case 1:
  
      fill(0, 255, 0);
      rect(0, 0, 1000, 550);
     // PICTURE = 0;
      
      break;
      
    case 2:
      fill(255, 0, 0);
      rect(0, 0, 1000, 550);
    // PICTURE = 0;
      break; 
      
      default:
      break;
    }
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