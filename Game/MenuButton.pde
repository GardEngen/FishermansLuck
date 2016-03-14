//************* New Class ******************
public class NewGameButton extends Button {
  private PImage newGameButton;

  public NewGameButton(float xPos, float yPos) { 
    super(xPos, yPos);
    newGameButton = loadImage("knapper/NyttSpill.png");
    buttonInfo(newGameButton, newGameButton);
  }
}

//************* New Class ******************
public class ResumeButton extends Button {
  private PImage resumeButton;

  public ResumeButton(float xPos, float yPos) {
    super(xPos, yPos);
    resumeButton = loadImage("knapper/Forsett.png");
    buttonInfo(resumeButton, resumeButton);
  }
}

//************* New Class ******************
public class TutorialButton extends Button {
  private PImage tutorialButton;

  public TutorialButton(float xPos, float yPos) {
    super(xPos, yPos);
    tutorialButton = loadImage("knapper/Tutorial.png");
    buttonInfo(tutorialButton, tutorialButton);
  }
}

//************* New Class ******************
public class HelpButton extends Button {
  private PImage helpButton;

  public HelpButton(float xPos, float yPos) {
    super(xPos, yPos);
    helpButton = loadImage("knapper/Help.png");
    buttonInfo(helpButton, helpButton);
  }
}

//************* New Class ******************
public class QuitButton extends Button {
  private PImage quitButton;

  public QuitButton(float xPos, float yPos) {
    super(xPos, yPos);
    quitButton = loadImage("knapper/AvsluttSpill.png");
    buttonInfo(quitButton, quitButton);
  }
}

//************* New Class ******************
public class Level1Button extends Button {
  private PImage level1Button;

  public Level1Button(float xPos, float yPos) {
    super(xPos, yPos);
    level1Button = loadImage("knapper/level1.png");
    buttonInfo(level1Button, level1Button);
  }
}

//************* New Class ******************
public class Level2Button extends Button {
  private PImage level2Button;

  public Level2Button(float xPos, float yPos) {
    super(xPos, yPos);
    level2Button = loadImage("knapper/level2.png");
    buttonInfo(level2Button, level2Button);
  }
}

//************* New Class ******************
public class Level2LButton extends Button {
  private PImage level2LButton;

  public Level2LButton(float xPos, float yPos) {
    super(xPos, yPos);
    level2LButton = loadImage("knapper/level2lock.png");
    buttonInfo(level2LButton, level2LButton);
  }
}