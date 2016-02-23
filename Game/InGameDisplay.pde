class InGameDisplay {
  private Button button;

  InGameDisplay()
  {
    button = new Button();
  }

  public void drawButton()
  {  
    button.drawButton();
  }

  public void buttonPressed() {
    button.buttonPressed();
  }
  public boolean buttonState() { 
    return button.getButtonState();
  }

  public boolean getHasPressed()
  {
    return button.getHasPressed();
  }
}