class Button {
  private PImage buttonImage;
  private PImage buttonImage2;
  private boolean currentState;
  private float xPosition;
  private float yPosition;
  private boolean beenPressed;
  Button()
  {
    currentState = true;
  }

  public void buttonInfo(float xPos, float yPos, PImage bImage1, PImage bImage2)
  {
    xPosition = xPos;
    yPosition = yPos;
    buttonImage = bImage1;
    buttonImage2 = bImage2;
  }

  public void drawButton()
  {
    if (currentState == true) {
      image(buttonImage, xPosition, yPosition);
    }
    if (currentState == false) {
      image(buttonImage2, xPosition, yPosition);
    }
  }

  public boolean buttonPressed()
  {
    if ( (mouseX>xPosition) && (mouseX < (xPosition + buttonImage.width)) && 
      (mouseY>yPosition) && (mouseY < (yPosition + buttonImage.height)) ) {
      //println("!currentState = " + !currentState);
      boolean newState;
      newState = !currentState;
      currentState = newState;
      //has pressed the button
      beenPressed = true;
    }
    // if the user is not pressing the button
    if ( !((mouseX>xPosition) && (mouseX < (xPosition + buttonImage.width)) && 
      (mouseY>yPosition) && (mouseY < (yPosition + buttonImage.height))) )
    {
      beenPressed=false;
    }
    return beenPressed;
  }
  //return the state of the button
  public boolean onOffSwitch() {
    return currentState;
  }
}