
public class Catch extends GameElement {
  private float speed;
  private int xCut;
  private int yCut;
  private int numberOfpictures;
  private float delay;
  //all fish images
  private PImage haraldImage;
  private PImage haraldImageRevers;
  //private PImage guriImage;
  //private PImage guriImageRevers;
  //private PImage bertImage;
  //private PImage bertImageRevers;
  private PImage haraldCaught;
  private int fishType;
 // private boolean caught;

  public Catch() {
    speed = random(2, 6);
    fishType = 0;
   // fishType = int(random(-1, 3));
   // caught = false;
    //load all fish images    
    haraldImage = loadImage("Bilder.Grafikk/Harald1update3.png");
    haraldImageRevers = loadImage("Bilder.Grafikk/Harald1update3Revers.png");
    haraldCaught = loadImage("Bilder.Fisk/Harald/HaraldFanget.png");
    //guriImage = loadImage("Bilder.Grafikk/GuriAnimation.png"); 
    //guriImageRevers = loadImage("Bilder.Grafikk/GuriAnimationRevers.png");
    //bertImage = loadImage("Bilder.Grafikk/BertAnimation.png");
    //bertImageRevers = loadImage("Bilder.Grafikk/BertAnimationRevers.png");
  }

  //draw all creatures in the deep
  public void drawAllFish() {
    if (fishType == 0)
    {
      haraldFish();
     // img = haraldImage;
    }
    //if (fishType == 1)
    //{
    //  guriFish();
    // // img = guriImage;
    //}
    //if ( fishType == 2)
    //{
    //  bertFish();
    // // img = bertImage;
    //}
 
  }

  //Creats a HaraldFishe
  public void haraldFish() {

    xCut = 100;
    yCut = haraldImage.height;
    numberOfpictures = 8;
    delay = 0.80;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, haraldImage, haraldImageRevers, haraldCaught);
  }

  ////Creats a GuriFish
  //public void guriFish() {
  //  xCut = 120;
  //  yCut = guriImage.height;
  //  numberOfpictures = 8;
  //  delay = 0.80;
  //  imageDivider(numberOfpictures, xCut, yCut, delay);
  //  elementMovement(speed, guriImage, guriImageRevers);
  //}

  //// creates a Bert fish
  //public void bertFish() {
  //  xCut= 69;
  //  yCut = bertImage.height;
  //  numberOfpictures = 2;
  //  delay = 1.9;
  //  imageDivider(numberOfpictures, xCut, yCut, delay);
  //  elementMovement(speed, bertImage, bertImageRevers);
  //}

  //public void isCaught() {
  //  speed = 0;
  //  caught = true;
  //}
  
   public GameElement isCaught() {
    //caught = true;
    return this;
  }
}