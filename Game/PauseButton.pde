public class PauseButton extends Button {
  private float xPosition = 920;
  private float yPosition = 107;
  private PImage pause;
  private PImage play;
  
  public PauseButton() {
    pause = loadImage("Knapp/pause.png");
    play = loadImage("Knapp/play.png");
    buttonInfo(xPosition, yPosition, play, pause);
  }

}