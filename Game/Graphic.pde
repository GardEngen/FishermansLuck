

public class Graphic {

  private PImage background;
  private PImage logo;
  private PImage helpbackground;
  private PImage bunn;
  private PImage tutorial1;
  private PImage tutorial2;
  private PImage tutorial3;
  private PImage tutorial4;
  private PImage tutorial5;
  private PImage tutorial6;
  private PImage tutorial7;
  private PImage tutorial8;
  private PImage tutorial9;
  private PImage tutorial10;

  private int PICTURE;

  public Graphic() {
    background = loadImage("grafikk/background2tilpasset.png");
    logo = loadImage("grafikk/tempLogo.png");
    helpbackground = loadImage("grafikk/helpbackground.png");
  
    bunn =      loadImage("grafikk/tutorial-bunn.png");
    tutorial1 = loadImage("grafikk/tutorial1.png");
    tutorial2 = loadImage("grafikk/tutorial2.png");
    tutorial3 = loadImage("grafikk/tutorial3.png");
    tutorial4 = loadImage("grafikk/tutorial4.png");
    tutorial5 = loadImage("grafikk/tutorial5.png");
    tutorial6 = loadImage("grafikk/tutorial6.png");
    tutorial7 = loadImage("grafikk/tutorial7.png");
    tutorial8 = loadImage("grafikk/tutorial8.png");
    tutorial9 = loadImage("grafikk/tutorial9.png");
    tutorial10 = loadImage("grafikk/tutorial10.png");
  }
  public void drawBackground()
  {
    image(background, 0, 0, 1000, 700);
  }
  
  public void drawTutorialButtonBackground()
  {
    image(bunn, 0, 0, 1000, 700);
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
      image(tutorial1, 0, 0, 1000, 700);

      break;
    case 2:

      image(tutorial2, 0, 0, 1000, 700);

      break;
    case 3:

      image(tutorial3, 0, 0, 1000, 700);

      break;
    case 4:

      image(tutorial4, 0, 0, 1000, 700);

      break;
    case 5:

      image(tutorial5, 0, 0, 1000, 700);

      break;
    case 6:

      image(tutorial6, 0, 0, 1000, 700);

      break;
    case 7:

      image(tutorial7, 0, 0, 1000, 700);

      break;
    case 8:

      image(tutorial8, 0, 0, 1000, 700);

      break;
    case 9:

      image(tutorial9, 0, 0, 1000, 700);

      break;
    case 10:

      image(tutorial10, 0, 0, 1000, 700);

      break;

    default:
      break;
    }
  }

  public void help()
  {
    image(background, 0, 0, 1000, 700);
    image(helpbackground, 210, 145, 570, 345);
    //fill(55, 0, 255);
    //rect(0, 0, 1000, 550);
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