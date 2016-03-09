
public class Catch extends GameElement {
  private float speed;
  private int xCut;
  private int yCut;
  private int numberOfpictures;
  private float delay;
  private boolean dangerous;
  //all fish images
  private PImage haraldImage;
  private PImage haraldImageRevers;
  private PImage haraldCaught;
  private PImage guriImage;
  private PImage guriImageRevers;
  private PImage guriCaught;
  private PImage bertImage;
  private PImage bertImageRevers;
  private PImage bertCaught;
  private PImage karinImage;
  private PImage karinImageRevers;
  private PImage karinCaught;
  private PImage sharkImage;
  private PImage sharkImageRevers;
  private PImage sharkCaught;
  private int fishType;
  // private boolean caught;

  public Catch() {
    speed = random(1, 5);
    //fishType = 4;
    fishType = int(random(-1, 5));
    // caught = false;
    //load all fish images    
    haraldImage = loadImage("Bilder.Grafikk/Harald1update3.png");
    haraldImageRevers = loadImage("Bilder.Grafikk/Harald1update3Revers.png");
    haraldCaught = loadImage("Bilder.Fisk/Harald/HaraldFanget.png");
    // guri
    guriImage = loadImage("Bilder.Grafikk/GuriAnimation.png"); 
    guriImageRevers = loadImage("Bilder.Grafikk/GuriAnimationRevers.png");
    guriCaught = loadImage("Bilder.Fisk/Guri/GuriFanget.png");
    // bert
    bertImage = loadImage("Bilder.Grafikk/BertAnimation.png");
    bertImageRevers = loadImage("Bilder.Grafikk/BertAnimationRevers.png");
    bertCaught = loadImage("Bilder.Fisk/Bert/BertFanget.png");
    // karin
    karinImage = loadImage("Bilder.Grafikk/KarinAnimation.png");
    karinImageRevers = loadImage("Bilder.Grafikk/KarinAnimationRevers.png");
    karinCaught = loadImage("Bilder.Fisk/Karin/KarinFanget.png");
    // Shark
    sharkImage = loadImage("Bilder.Grafikk/shark.png");
    sharkImageRevers  = loadImage("Bilder.Grafikk/sharkRevers.png");
    sharkCaught = loadImage("Bilder.Grafikk/sharkCaught.png");
  }

  //draw all creatures in the deep
  public void drawAllFish() {
    if (fishType == 0)
    {
      haraldFish();
      // img = haraldImage;
    }
    if (fishType == 1)
    {
      guriFish();
      // // img = guriImage;
    }
    if ( fishType == 2)
    {
      bertFish();
      // // img = bertImage;
    }
    if ( fishType == 3) 
    {
      karinFish();
    }
    if(fishType == 4) {
      shark();
    }
  }

  //Creats a HaraldFishe
  public void haraldFish() {

    xCut = 100;
    yCut = haraldImage.height;
    numberOfpictures = 8;
    delay = 0.80;
    dangerous = false;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, haraldImage, haraldImageRevers, haraldCaught, dangerous);
  }

  //Creats a GuriFish
  public void guriFish() {
    xCut = 90;
    yCut = guriImage.height;
    numberOfpictures = 8;
    delay = 0.80;
    dangerous = false;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, guriImage, guriImageRevers, guriCaught, dangerous);
  }

  // creates a Bert fish
  public void bertFish() {
    xCut= 100;
    yCut = bertImage.height;
    numberOfpictures = 6;
    delay = 0.5;
    dangerous = false;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, bertImage, bertImageRevers, bertCaught, dangerous);
  }

  // creates a Karin fish
  public void karinFish() {
    xCut= 100;
    yCut = karinImage.height;
    numberOfpictures = 6;
    delay = 0.5;
    dangerous = false;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, karinImage, karinImageRevers, karinCaught, dangerous);
  }
  
  public void shark() {
    xCut = 139;
    yCut = sharkImage.height;
    numberOfpictures = 1;
    delay = 1.0;
    dangerous = true;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, sharkImageRevers, sharkImage, sharkCaught, dangerous);
  }

  //public void isCaught() {
  //  speed = 0;
  //  caught = true;
  //}

  public GameElement isCaught() {
    //caught = true;
    return this;
  }
}