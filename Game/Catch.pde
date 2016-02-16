
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
    haraldFish();
  }

  public void haraldFish() {
    PImage image = loadImage("Bilder.Grafikk/Harald1update3.png");
    PImage imageRevers = loadImage("Bilder.Grafikk/Harald1update3Revers.png");
     xCut = 100;
     yCut = 55;
     numberOfpictures = 8;
     delay = 0.80;
    elementMovement(speed, image, imageRevers);
    imageDivider(numberOfpictures, xCut, yCut, delay);
    hitboxAction();
  }
  
  //Not it use yet.
  public void guriFish() {
    PImage image = loadImage("Bilder.Grafikk/GuriAnimationRevers.png"); 
    PImage imageRevers = loadImage("Bilder.Grafikk/GuriAnimationRevers.png");
    elementMovement(speed, image, imageRevers);
  }
}