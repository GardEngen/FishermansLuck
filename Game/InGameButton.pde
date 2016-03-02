public class PauseButton extends Button {
  private float xPosition = 920;
  private float yPosition = 107;
  private PImage pause;
  private PImage play;
  
  public PauseButton() {
    pause = loadImage("Knapp/Pause.png");
    play = loadImage("Knapp/Play.png");
    buttonInfo(xPosition, yPosition, pause, play);
  }

}
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