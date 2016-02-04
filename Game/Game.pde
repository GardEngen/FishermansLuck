private Player player;
private Graphic graphic;
//hei gard
void setup ()
{
  size(1000, 700);
  player = new Player();
  graphic = new Graphic();
}
void draw ()
{
  graphic.drawBackground();
  player.boat();
}