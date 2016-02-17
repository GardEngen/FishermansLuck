class Button {
  private PImage SoundOn;
  private PImage SoundOff;
  private PImage image;
  private float xPosition = 920;
  private float yPosition = 7;
  Button()
  {
    SoundOn = loadImage("Knapp/ButtonOntest.png");
    SoundOff = loadImage("Knapp/ButtonOfftest.png");
  }
  public void drawButton()
  {
    SoundOff();
    //SoundOn();
  }
  public void SoundOn()
  {
    image = SoundOn;
    image(image, xPosition, yPosition);
  }
  public void SoundOff()
  { 
    image = SoundOff;
    image(image, xPosition, yPosition);
  }
  
  public float getXButton()
  {
    return xPosition;
  }
    public float getYButton()
  {
    return yPosition;
  }
}