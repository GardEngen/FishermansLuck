
//************* New Class ******************
public class PauseButton extends Button {
  private PImage pause;
  
  public PauseButton(float xPos, float yPos) {
    super(xPos, yPos);
    pause = loadImage("knapper/Pause.png");
    buttonInfo(pause, pause);
  }
}

//************* New Class ******************
public class PlayButton extends Button {
  private PImage play;
  
  public PlayButton(float xPos, float yPos) {
    super(xPos, yPos);
    play = loadImage("knapper/Play.png");
    buttonInfo(play, play);
  }
}

//************* New Class ******************
public class SoundButton extends Button{
  private PImage soundOn;
  private PImage soundOff;
  
  public SoundButton(float xPos, float yPos) {
    super(xPos, yPos);
    soundOn = loadImage("knapper/soundon.png");
    soundOff = loadImage("knapper/soundoff.png");
    buttonInfo(soundOn, soundOff);
  }
  
}