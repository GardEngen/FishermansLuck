class Button {
  private PImage buttonImage;
  private boolean currentState;
  private float xPosition;
  private float yPosition;
  private boolean hasPressed;
  private SoundButton s;

  Button()
  {
    s = new SoundButton();
    xPosition = s.getXPos();
    yPosition = s.getYPos();
    buttonImage = s.getImage(); 
    currentState = true;
  }

  public void drawButton()
  {
    if (currentState == true) {
      s.displaySoundOn();
    }
    if (currentState == false) {
      s.displaySoundOff();
    }
  }


  public void buttonPressed()
  {
    
    if ( (mouseX>xPosition) && (mouseX < (xPosition + buttonImage.width)) && 
      (mouseY>yPosition) && (mouseY < (yPosition + buttonImage.height)) ) {
      //println("!currentState = " + !currentState);
      boolean newState;
      newState = !currentState;
      currentState = newState;
      //has pressed the button
      hasPressed = true;
    }
    // if the user is not pressing the button
    if ( !((mouseX>xPosition) && (mouseX < (xPosition + buttonImage.width)) && 
      (mouseY>yPosition) && (mouseY < (yPosition + buttonImage.height))) )
      {
        hasPressed=false;
      
      }
    
  }
  public boolean getButtonState()
  {
    return currentState;    
  }
  public boolean getHasPressed()
  {
    return hasPressed;
  }
}