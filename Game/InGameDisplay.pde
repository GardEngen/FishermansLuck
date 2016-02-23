class InGameDisplay {
  private Button button;
  private SoundButton s;
  InGameDisplay()
  {
    s = new SoundButton();
    //button = new Button();
    
  }

  public void drawButton()
  {  
    s.drawButton();
    //button.drawButton();
   
  }

  public void buttonPressed() {
    s.buttonPressed();
  }
  public boolean buttonState() { 
    return s.getButtonState();
  }

  public boolean getBeenPressed()
  {
    return s.getBeenPressed();
  }
}