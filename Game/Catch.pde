//public abstract class Catch extends GameElement {
public  class Catch extends GameElement {
  protected float speed;
  protected int xCut;
  protected int yCut;
  protected int numberOfpictures;
  protected float delay;
  protected boolean dangerous;
  //all fish images
  protected PImage haraldImage;
  protected PImage haraldImageRevers;
  protected PImage haraldCaught;
  protected PImage guriImage;
  protected PImage guriImageRevers;
  protected PImage guriCaught;
  protected PImage bertImage;
  protected PImage bertImageRevers;
  protected PImage bertCaught;
  protected PImage karinImage;
  protected PImage karinImageRevers;
  protected PImage karinCaught;
  protected PImage sharkImage;
  protected PImage sharkImageRevers;
  protected PImage sharkCaught;
  protected PImage siriImage; // siri fisk
  protected PImage siriImageRevers;
  protected PImage siriCaught;
  protected PImage annaImage; // anna fisk
  protected PImage annaImageRevers;
  protected PImage annaCaught;
  protected int fishType;
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

    //double fishProbability = Math.random(); // "Returns a double value with a positive sign, greater than or equal to 0.0 and less than 1.0."
  }

  public void createRandomFish() {
    int random = (int) (Math.random()* 100); //generate a random number between 0 and 99
    //Catch fish;
    
     if (random < 20) { // in the range 0-19
      //fish = new Shark();
    } else if (random < 30) { // range 20 - 29
      bertFish();
    } else if (random < 40) { // range 30 - 39
      annaFish();
    } else if (random < 50) { // range 40 - 49
      haraldFish();
    } else if (random < 60) { // range 50 - 59
      guriFish();
    } else if (random < 70) { // range 60-69
      karinFish();
    } else if (random < 80) { // range 70 - 89
      shark();
    }
    //return fish;
  }

  public void drawFishes() {
  }

  //draw all creatures in the deep
  public void drawAllFish() {
    if ((fishType == 0))
    {
      haraldFish();
    }
    if ((fishType == 1))
    {
      guriFish();
    }
    if ( fishType == 2)
    {
      bertFish();
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

  public GameElement isCaught() {
    //caught = true;
    return this;
  }

  // this should be true for bad fishes
  //public abstract boolean isBad(); 

  // This can be used to save/load from Json
 // public abstract String getType();
}