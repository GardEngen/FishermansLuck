private Player player;
private Graphic graphic;
private Fish fish;
void setup ()
{
  size(1000, 700);
  frameRate(60);
  player = new Player();
  graphic = new Graphic();
  fish = new Fish();
}
void draw ()
{
  graphic.drawBackground();
  player.boat();
  fish.drawFish();
}