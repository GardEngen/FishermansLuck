
public class Catch extends GameElement {
  private float speed;
  private int xCut;
  private int yCut;
  private int numberOfpictures;
  private float delay;
  //all fish images
  private PImage haraldImage;
  private PImage haraldImageRevers;
  private PImage guriImage;
  private PImage guriImageRevers;

  public Catch() {
    speed = random(2, 6);
    //load all fish images    
    haraldImage = loadImage("Bilder.Grafikk/Harald1update3.png");
    haraldImageRevers = loadImage("Bilder.Grafikk/Harald1update3Revers.png");
    guriImage = loadImage("Bilder.Grafikk/GuriAnimation.png"); 
    guriImageRevers = loadImage("Bilder.Grafikk/GuriAnimationRevers.png");
  }
  //draw all creatures in the deep
  public void drawAllFish() {
    //haraldFish();
    guriFish();
  }
  
  //Creats a HaraldFish
  public void haraldFish() {

    xCut = 100;
    yCut = haraldImage.height;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, haraldImage, haraldImageRevers);
  }

  //Creats a GuriFish
  public void guriFish() {
    xCut = 120;
    yCut = guriImage.height;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, guriImage, guriImageRevers);
  }
  
  public void isCaught() {
    speed = 0;
  }
}