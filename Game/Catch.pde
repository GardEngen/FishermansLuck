
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
  private PImage siriImage; // siri fisk
  private PImage siriImageRevers;
  private PImage siriCaught;
  private PImage annaImage; // anna fisk
  private PImage annaImageRevers;
  private PImage annaCaught;
  private int fishType;
  // private boolean caught;

  public Catch() {
    speed = random(1, 5);
    //fishType = 4;
    fishType = int(random(-1, 7));
    // caught = false;
    //load all fish images     
    haraldImage = loadImage("animation/Harald1update3.png");
    haraldImageRevers = loadImage("animation/Harald1update3Revers.png");
    haraldCaught = loadImage("animation/HaraldFanget.png");
    // guri
    guriImage = loadImage("animation/GuriAnimation.png"); 
    guriImageRevers = loadImage("animation/GuriAnimationRevers.png");
    guriCaught = loadImage("animation/GuriFanget.png");
    // bert
    bertImage = loadImage("animation/BertAnimation.png");
    bertImageRevers = loadImage("animation/BertAnimationRevers.png");
    bertCaught = loadImage("animation/BertFanget.png");
    // karin
    karinImage = loadImage("animation/KarinAnimation.png");
    karinImageRevers = loadImage("animation/KarinAnimationRevers.png");
    karinCaught = loadImage("animation/KarinFanget.png");
    // siri
    siriImage = loadImage("animation/SiriAnimation.png");
    siriImageRevers = loadImage("animation/SiriAnimationRevers.png");
    siriCaught = loadImage("animation/SiriFanget.png");
    // anna
    annaImage = loadImage("animation/AnnaAnimation.png");
    annaImageRevers = loadImage("animation/AnnaAnimationRevers.png");
    annaCaught = loadImage("animation/AnnaFanget.png");
    // Shark
    sharkImage = loadImage("animation/shark.png");
    sharkImageRevers  = loadImage("animation/sharkRevers.png");
    sharkCaught = loadImage("animation/sharkCaught.png");
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
    if (fishType == 4) {
      shark();
    }
    if (fishType == 5) {
      annaFish();
    }
    if (fishType == 6) {
      siriFish();
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

  // creates a siri fish
  public void siriFish() {
    xCut= 100;
    yCut = siriImage.height;
    numberOfpictures = 8;
    delay = 0.5;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, siriImage, siriImageRevers, siriCaught, dangerous);
  }

  // creates a anna fish
  public void annaFish() {
    xCut= 100;
    yCut = annaImage.height;
    numberOfpictures = 8;
    delay = 0.5;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, annaImage, annaImageRevers, annaCaught, dangerous);
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