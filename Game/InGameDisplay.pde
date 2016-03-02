class InGameDisplay {
  private Button button;
  private SoundButton s;
  private PauseButton p;
  private NewGameButton n;
  private ResumeButton r;
  private TutorialButton t;
  private HelpButton h;
  private QuitButton q;
  InGameDisplay()
  {
    s = new SoundButton();   
    p = new PauseButton();
    n = new NewGameButton();
    r = new ResumeButton();
    t = new TutorialButton();
    h = new HelpButton();
    q = new QuitButton();
  }

  public void drawInGameButton()
  {  
    s.drawButton();  
    p.drawButton();
  }
  public void drawMenuButton()
  {
    n.drawButton();
    s.drawButton();
    r.drawButton();
    t.drawButton();
    h.drawButton();
    q.drawButton();
  }

  //functions for SoundButton
  public boolean soundButtonPressed() {
    return s.buttonPressed();
  }
  public boolean getSoundOnOffSwitch()
  {
    return s.onOffSwitch();
  }
  //functions for PauseButton
  public boolean pauseButtonPressed() {
    return p.buttonPressed();
  }
  public boolean getPauseOnOffSwitch()
  {
    return p.onOffSwitch();
  }
  //function for NewGameButton
  public boolean newGameButtonPressed() {
    return n.buttonPressed();
  }
  //function for ResumeButton
  public boolean resumeButtonPressed() {
    return r.buttonPressed();
  }
  //function for TutorialButton
  public boolean tutorialButtonPressed() {
    return t.buttonPressed();
  }
    //function for HelpButton
  public boolean helpButtonPressed() {
    return h.buttonPressed();
  }
  //function for QuitButton
  public boolean quitButtonPressed() {
    return q.buttonPressed();
  }
}