//************* New Class ******************
public class NewGameButton extends Button{
  private PImage newGameButton;
  
  public NewGameButton(float xPos, float yPos){ 
    super(xPos, yPos);
    newGameButton = loadImage("knapper/NyttSpill.png");
    buttonInfo(newGameButton, newGameButton);
  }
}

//************* New Class ******************
public class ResumeButton extends Button{
  private PImage resumeButton;
  
  public ResumeButton(float xPos, float yPos) {
    super(xPos, yPos);
    resumeButton = loadImage("knapper/Forsett.png");
    buttonInfo(resumeButton, resumeButton);
  }
}

//************* New Class ******************
public class TutorialButton extends Button{
  private PImage tutorialButton;
  
  public TutorialButton(float xPos, float yPos) {
    super(xPos, yPos);
    tutorialButton = loadImage("knapper/Tutorial.png");
    buttonInfo(tutorialButton, tutorialButton);
  }
}

//************* New Class ******************
public class HelpButton extends Button{
  private PImage helpButton;
  
  public HelpButton(float xPos, float yPos) {
    super(xPos, yPos);
    helpButton = loadImage("knapper/Help.png");
    buttonInfo(helpButton, helpButton);
  }
}

//************* New Class ******************
public class QuitButton extends Button{
  private PImage quitButton;
  
  public QuitButton(float xPos, float yPos) {
    super(xPos, yPos);
    quitButton = loadImage("knapper/AvsluttSpill.png");
    buttonInfo(quitButton, quitButton);
  }
}