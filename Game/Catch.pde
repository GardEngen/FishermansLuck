
public class Catch extends GameElement {
  private float speed;
  private int xCut;
  private int yCut;
  private int numberOfpictures;
  private float delay;

  public Catch() {
    speed = random(1, 6);
  }

  public void drawAllFish() {
    //haraldFish();
    guriFish();
  }

  public void haraldFish() {
    PImage image = loadImage("Bilder.Grafikk/Harald1update3.png");
    PImage imageRevers = loadImage("Bilder.Grafikk/Harald1update3Revers.png");
    xCut = 100;
    yCut = 55;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, image, imageRevers);

    hitboxAction();
  }

  //Not it use yet.
  public void guriFish() {
    PImage image = loadImage("Bilder.Grafikk/GuriAnimation.png"); 
    PImage imageRevers = loadImage("Bilder.Grafikk/GuriAnimationRevers.png");
    xCut = 120;
    yCut = 89;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, image, imageRevers);
  }
}