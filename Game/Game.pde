import ddf.minim.*;

private AudioPlayer audioPlayer;
private Minim minim;
private Player player;
private Graphic graphic;
private ArrayList <Catch> fish;
private int numberOfFish = 2;

void setup ()
{
  size(1000, 700);
  frameRate(60);
  player = new Player();
  graphic = new Graphic();

  fish = new ArrayList <Catch>();
  createfish();
  //Music
  minim = new Minim(this); //audio context
  backgroundMusic();
  
}

void draw ()
{
  graphic.drawBackground();
  player.boat();
  for (int i = 0; i < numberOfFish; i++) {
    fish.get(i).drawAllFish();
  }
  caughtSomething();
}


private void createfish()
{
  for (int i=0; i<numberOfFish; i++) {
    fish.add(new Catch());
  }
}

private void backgroundMusic()
{
  audioPlayer = minim.loadFile("Lyd/Fishing.mp3", 2048);
 // audioPlayer.play();
}

private void caughtSomething() {
  float catchX;
  float catchY;
  float catchHeight;
  
  float rodX = player.getHitboxCenterXPos(); //centered
  float rodY = player.getHitboxCenterYPos(); //centerd
  
  for (Catch temp : fish) {
    catchHeight = temp.getYCut();
    catchY = temp.getCenterYHit(); //centered
    catchX = temp.getCenterXHit(); //centered
    println("fisk x " + catchX + "rod x " + rodX);
    println("fisk y " + catchY + "rod y " + rodY);

    if( dist(rodX, rodY, catchX, catchY) <= catchHeight/2 ) {
    temp.isCaught(); 
    }
  }
} 