
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
    speed =random(5, 10);

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
  private void haraldFish() {

    xCut = 100;
    yCut = 55;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, haraldImage, haraldImageRevers);

    hitboxAction();
  }

  //Creats a GuriFish
  private void guriFish() {
    xCut = 120;
    yCut = 89;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, guriImage, guriImageRevers);
  }
}