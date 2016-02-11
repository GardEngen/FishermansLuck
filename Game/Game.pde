private Player player;
private Graphic graphic;
private ArrayList <Catch> fish;
private int numberOfFish = 6;

void setup ()
{
  size(1000, 700);
  frameRate(60);
  player = new Player();
  graphic = new Graphic();
  fish = new ArrayList <Catch>();
  createfish();
}

void draw ()
{
  graphic.drawBackground();
  player.boat();
  for (int i = 0; i < numberOfFish; i++) {
    fish.get(i).drawAllFish() ;
  }
}


public void createfish()
{
  for (int i=0; i<numberOfFish; i++) {
    fish.add(new Catch());
  }
}