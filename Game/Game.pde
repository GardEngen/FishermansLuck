private Player player;
private Graphic graphic;
private ArrayList <Fish> fish;
private int numberOfFish = 6;

void setup ()
{
  size(1000, 700);
  frameRate(60);
  player = new Player();
  graphic = new Graphic();
  fish = new ArrayList <Fish>();
  cratefish();

}
void draw ()
{
  graphic.drawBackground();
  player.boat();
  for (int i =0; i < numberOfFish; i++)
  {
    fish.get(i).drawFish();

  }
  
  
}


public void cratefish()
{
  for (int i=0; i<numberOfFish; i++)
  {
    fish.add(new Fish());
  }
}