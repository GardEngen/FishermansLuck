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

  //public void displaySoundOn() {
  //  displayImage(soundOn,xPosition,yPosition);
  //  image(soundOn, xPosition, yPosition);
  //}
  //public void displaySoundOff() {
  //  displayImage(soundOff,xPosition,yPosition);
  //  image(soundOff, xPosition, yPosition);
  //}
  
  
  //public void dButton(){
  //  buttonInfo(xPosition, yPosition, soundOn, soundOff);
  
  //}
  
  //public float getXPos() {
  //  return xPosition;
  //}
  //public float getYPos() {
  //  return yPosition;
  //}
  //public PImage getImage() {
  //  return soundOff;
  //}
}