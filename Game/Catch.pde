
public class Catch extends GameElement {
 private float speed;
  
  public Catch() {
    speed = random(1,6);
  }
  
    public void drawAllFish() {
    haraldFish();
  }
  
  public void haraldFish() {
    PImage image = loadImage("Bilder.Grafikk/Harald1update3.png");
    PImage imageRevers = loadImage("Bilder.Grafikk/Harald1update3Revers.png");
    elementMovement(speed, image, imageRevers);
    hitboxAction();   
  }
  
}