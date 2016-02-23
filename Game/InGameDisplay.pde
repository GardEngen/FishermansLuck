class InGameDisplay {
  private Button button;
  private SoundButton s;
  private PauseButton p;
  InGameDisplay()
  {
    s = new SoundButton();   
    p = new PauseButton();
  }

  public void drawButton()
  {  
    s.drawButton();  
    p.drawButton();
  }

  public boolean soundButtonPressed() {
    return s.buttonPressed();
  }
  public boolean pauseButtonPressed() {
    return p.buttonPressed();
  }
  public boolean getSoundOnOffSwitch()
  {
    return s.onOffSwitch();
  }
  public boolean getPauseOnOffSwitch()
  {
    return p.onOffSwitch();
  }
}