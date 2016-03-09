public class PauseButton extends Button {
  private float xPosition = 935;
  private float yPosition = 80;
  private PImage pause;
  
  public PauseButton() {
    pause = loadImage("Knapp/Pause.png");
    buttonInfo(xPosition, yPosition, pause, pause);
  }
}
public class PlayButton extends Button {
  private float xPosition = 935;
  private float yPosition = 80;
  private PImage play;
  
  public PlayButton() {
    play = loadImage("Knapp/Play.png");
    buttonInfo(xPosition, yPosition, play, play);
  }
}




public class SoundButton extends Button{
  private float xPosition = 930;
  private float yPosition = 5;
  private PImage soundOn;
  private PImage soundOff;
  
  public SoundButton() {
    soundOn = loadImage("Knapp/ButtonOntest.png");
    soundOff = loadImage("Knapp/ButtonOfftest.png");
    buttonInfo(xPosition, yPosition, soundOn, soundOff);
  }
  
}