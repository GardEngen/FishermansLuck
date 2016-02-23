class InGameDisplay {
  private Button button;
  private SoundButton s;
  InGameDisplay()
  {
    s = new SoundButton();
    button = new Button();
    
  }

  public void drawButton()
  {  
    s.drawButton();
    button.drawButton();
   
  }

  public void buttonPressed() {
    button.buttonPressed();
  }
  public boolean buttonState() { 
    return button.getButtonState();
  }

  public boolean getBeenPressed()
  {
    return button.getBeenPressed();
  }
}