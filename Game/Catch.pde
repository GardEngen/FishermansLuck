
public class Catch extends GameElement {
 private float speed;
  
  public Catch() {
    speed = random(1,6);
  }
  
    public void drawAllFish() {
    clownFish();
  }
  
  public void clownFish() {
    PImage image = loadImage("Bilder.Grafikk/Harald1update.png");
    elementMovement(speed, image);
   //kanskje ikke den lureste plassen å legge den #diskuteres
    hitboxAction();
  }
  
}