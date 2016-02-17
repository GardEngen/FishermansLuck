class InGameDisplay {
  private Button button;
  private PImage buttonimage;
  private float buttonXPosition;
  private float buttonYPosition;

  InGameDisplay()
  {
    button = new Button();
  }


  public void getButton(PImage image, float xPosition, float yPosition)
  {
    this.buttonimage = image;
    this.buttonXPosition = xPosition;
    this.buttonYPosition = yPosition;
  }

  public void drawButton()
  {  
    button.drawButton();
  }
}