public class SoundButton {
  private float xPosition = 920;
  private float yPosition = 7;
  private PImage SoundOn;
  private PImage SoundOff;
  
  public SoundButton() {
    SoundOn = loadImage("Knapp/ButtonOntest.png");
    SoundOff = loadImage("Knapp/ButtonOfftest.png");
  }

  public void displaySoundOn() {
    image(SoundOn, xPosition, yPosition);
  }
  public void displaySoundOff() {
    image(SoundOff, xPosition, yPosition);
  }
  public float getXPos() {
    return xPosition;
  }
  public float getYPos() {
    return yPosition;
  }
  public PImage getImage() {
    return SoundOn;
  }
}