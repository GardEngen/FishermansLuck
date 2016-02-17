import ddf.minim.*;

private AudioPlayer audioPlayer;
private Minim minim;
private Player player;
private Graphic graphic;
private ArrayList <Catch> fish;
private int numberOfFish = 8;

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
  audioPlayer.play();
}