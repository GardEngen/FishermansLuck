class InGameDisplay {
  private SoundButton s;
  private PauseButton p;
  private PlayButton play;
  private NewGameButton n;
  private ResumeButton r;
  private TutorialButton t;
  private HelpButton h;
  private QuitButton q;
  private PFont font;
  
  InGameDisplay()
  {
    s = new SoundButton();   
    p = new PauseButton();
    play = new PlayButton();
    n = new NewGameButton();
    r = new ResumeButton();
    t = new TutorialButton();
    h = new HelpButton();
    q = new QuitButton();
    font = createFont("Arial", 16, true);
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
  
  public void drawPauseMenu()
  {
    r.drawButton();
    q.drawButton();
    play.drawButton();
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
  //public boolean getPauseOnOffSwitch()
  //{
  // return p.onOffSwitch();
  //}
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
  
   private void scoreBoard(int score){
      textFont(font, 16);
      fill(0);
      text("Score " + score, 30, 30);
  }
}