public class PauseButton {
  private float xPosition = 920;
  private float yPosition = 107;
  private PImage pause;
  private PImage play;
  
  public PauseButton() {
    pause = loadImage("Knapp/pause.png");
    play = loadImage("Knapp/play.png");
  }
  
  public void displayPause() {
    image(pause, xPosition, yPosition);
  }
  public void displayPlay() {
    image(play, xPosition, yPosition);
  }
  public float getXPos() {
    return xPosition;
  }
  public float getYPos() {
    return yPosition;
  }
  public PImage getImage() {
    return pause;
  }
}