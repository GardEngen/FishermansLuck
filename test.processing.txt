PImage sun;

void setup()
{
size(800,800);
frameRate(60);
}
void draw()
{
staticBackground();
  
}

void staticBackground()
{
 background(104,123,245);
 sun = loadImage("../Bilder.Grafikk/Sol.png");
 image(sun, 0, height/11, sun.width/3, sun.height/2);
}