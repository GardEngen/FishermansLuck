public class SoundButton extends Button{
  private float xPosition = 920;
  private float yPosition = 7;
  private PImage soundOn;
  private PImage soundOff;
  
  public SoundButton() {
    soundOn = loadImage("Knapp/ButtonOntest.png");
    soundOff = loadImage("Knapp/ButtonOfftest.png");
    buttonInfo(xPosition, yPosition, soundOn, soundOff);
  }
}