public  class Catch extends GameElement {

    // Fish-type specific values
  private String fishName;
  private float speed;
  private int xCut;
  private int yCut;
  private int numberOfpictures;
  private float delay;
  private boolean dangerous;
  private int sharkProb;
  
  public final String[] FISH_NAMES = new String[]{ "Harald", "Guri", "Bert", "Karin", "Siri", "Anna", "Shark" };
  public final int[] XCUTS =                     { 100, 90, 100, 100, 100, 100, 240 };
  public final int[] NUM_PICTURES =              { 8, 8, 8, 8, 8, 8, 6};
  public final float[] DELAYS =                  { 0.8, 0.8, 0.5, 0.5, 0.5, 0.5, 0.3 };
  public final boolean[] DANGEROUS =             { false, false, false, false, false, false, true };
  // These numbers represent relative probability for each fish. 
  // They do not have to sum up to 100, only their relative proportion matters
  public int [] PROBABILITIES =                   {40, 70, 40, 60, 40, 40, 100};// LEGG INN PASSENDE SANNSYNLIGHET  sharkProb

  // Constants common for all fish types
  private final String IMAGE_DIR = "animation/";
  private final int MIN_SPEED = 1;
  private final int MAX_SPEED = 6;

  // Fish type
  private int fishType;

  // Images
  private PImage fishImage;
  private PImage fishImageRevers;
  private PImage fishImageCaught;

  public Catch(int sharkProb) {
    this.sharkProb = sharkProb;
    speed = random(MIN_SPEED, MAX_SPEED);
    // Comment: type of fish is decided when the fish is created
    fishType = getRandomFishType();
    fishName = FISH_NAMES[fishType];
    //setSharkProbability(sharkProb);
    //load all fish images     
    fishImage = loadImage(IMAGE_DIR + fishName + "Animation.png");
    fishImageRevers = loadImage(IMAGE_DIR + fishName + "AnimationRevers.png");
    fishImageCaught = loadImage(IMAGE_DIR + fishName + "Fanget.png");

    // Initialize fish-specific constants
    xCut = XCUTS[fishType];
    yCut = fishImage.height;
    numberOfpictures = NUM_PICTURES[fishType];
    delay = DELAYS[fishType];
    dangerous = DANGEROUS[fishType];
  }

  

  // the origional drawAllFish methode
  public void drawFish() {
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, fishImage, fishImageRevers, fishImageCaught, dangerous);
  }

  // Decide random fish type based on required probability proportions
  private int getRandomFishType() {
    // First find out the probability range: sum of all probabilities
    int max_prob = 0;
    for (int p : PROBABILITIES) {
      max_prob += p;
    }
    if (max_prob < 1) {
      // If all probabilities are 0, take any at random 
      return (int) random(PROBABILITIES.length);
    }

    // Now generate a random number in the allowed range and find out which fish type it is
    int r = (int) random(1, max_prob);
    for (int i = 0; i < PROBABILITIES.length; ++i) {
      r -= PROBABILITIES[i];
      if (r <= 0) {
        return i;
      }
    }

    // This should never happen - that r is out of range. 
    // Just in case we just take first fish type
    return 0;
  }

  public String getFishName() {
    return fishName;
  }

  public GameElement isCaught() {
    return this;
  }
  
  public boolean isDangerous() {
    return dangerous;
  }
  
  //public void setSharkProbability(int prob) {
  // PROBABILITIES[6] = prob;
  //}
}