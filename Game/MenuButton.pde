public class NewGameButton extends Button{
  private float xPosition = 400;
  private float yPosition = 330;
  private PImage newGameButton;
  
  public NewGameButton(){ 
    newGameButton = loadImage("knapper/NyttSpill.png");
    buttonInfo(xPosition, yPosition, newGameButton, newGameButton);
  }
}

public class ResumeButton extends Button{
  private float xPosition = 400;
  private float yPosition = 270;
  private PImage resumeButton;
  
  public ResumeButton() {
    resumeButton = loadImage("knapper/Forsett.png");
    buttonInfo(xPosition, yPosition, resumeButton, resumeButton);
  }
}

public class TutorialButton extends Button{
  private float xPosition = 400;
  private float yPosition = 390;
  private PImage tutorialButton;
  
  public TutorialButton() {
    tutorialButton = loadImage("knapper/Tutorial.png");
    buttonInfo(xPosition, yPosition, tutorialButton, tutorialButton);
  }
}

public class HelpButton extends Button{
  private float xPosition = 400;
  private float yPosition = 450;
  private PImage helpButton;
  
  public HelpButton() {
    helpButton = loadImage("knapper/Help.png");
    buttonInfo(xPosition, yPosition, helpButton, helpButton);
  }
}

public class QuitButton extends Button{
  private float xPosition = 400;
  private float yPosition = 510;
  private PImage quitButton;
  
  public QuitButton() {
    quitButton = loadImage("knapper/AvsluttSpill.png");
    buttonInfo(xPosition, yPosition, quitButton, quitButton);
  }
}