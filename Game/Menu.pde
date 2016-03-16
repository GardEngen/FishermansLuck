class Menu {
  private Button s;
  private Button p;
  private Button play;
  private Button n;
  private Button n2;
  private Button r;
  private Button t;
  private Button h;
  private Button m;
  private Button l1;
  private Button l2;
  private Button hard;
  private Button hm;
  private Button hm2;
  private Button hm3;
  private Button hm4;
  private Button next;
  private Button back;
  private Button q;
  private Button q2;
  private Button q3;
  private Button q4;
  private Button q5;

  private HashMap<String, Button> mainMenuButtonsHash;
  private HashMap<String, Button> inGameButtonsHash;
  private HashMap<String, Button> gameOverButtonsHash;
  private HashMap<String, Button> pauseMenuButtonsHash;
  private HashMap<String, Button> levelMenuButtonsHash;
  private HashMap<String, Button> tutorialMenuButtonsHash;
  private HashMap<String, Button> helpMenuButtonsHash;
  //private PFont font;
  private PFont font2;


  Menu() {
    mainMenuButtonsHash = new HashMap<String, Button>();
    inGameButtonsHash = new HashMap<String, Button>();
    gameOverButtonsHash = new HashMap<String, Button>();
    pauseMenuButtonsHash = new HashMap<String, Button>();
    levelMenuButtonsHash = new HashMap<String, Button>();
    tutorialMenuButtonsHash = new HashMap<String, Button>();
    helpMenuButtonsHash = new HashMap<String, Button>();

    createMainMenu();
    createInGameMenu();
    createPauseMenu();
    createGameOverMenu();
    createLevelMenu();
    createTutorialMenu();
    createHelpMenu();

    //font = createFont("Arial", 16, true);
    font2 = createFont("Fantasy", 40, true);
  }

  public void createInGameMenu() {
    s = (Button) new SoundButton(935, 20); 
    p = (Button) new PauseButton(935, 80);
    play = (Button) new PlayButton(935, 80);

    inGameButtonsHash.put("sound", s);
    inGameButtonsHash.put("pause", p);
  }

  public void createMainMenu() {
    r = (Button) new ResumeButton(400, 270);
    n = (Button) new NewGameButton(400, 330);
    t = (Button) new TutorialButton(400, 390);
    h = (Button) new HelpButton(400, 450);
    q = (Button) new QuitButton(400, 510);

    mainMenuButtonsHash.put("continue", r);
    mainMenuButtonsHash.put("new", n);
    mainMenuButtonsHash.put("tutorial", t);
    mainMenuButtonsHash.put("help", h);
    mainMenuButtonsHash.put("quit", q);
  }

  public void createLevelMenu()
  {
    l1 = (Button) new Level1Button(400, 270);
    l2 = (Button) new Level2Button(400, 330);
    m = (Button) new MaratonButton(400, 390);
    hard = (Button) new HardcoreModeButton(400, 450);
    hm3 = (Button) new HovedmenyButton(400, 510);
    
    levelMenuButtonsHash.put("1", l1);
    levelMenuButtonsHash.put("2", l2);
    levelMenuButtonsHash.put("3", m); 
    levelMenuButtonsHash.put("4", hard);
    levelMenuButtonsHash.put("menu", hm3);
  }

  public void createPauseMenu() {
    hm4 = (Button) new HovedmenyButton(400, 330);
    pauseMenuButtonsHash.put("DU SKAL IKKE GJØRE EN DRITT MEN BARE SE PEN UT, TAKK!", play); 
    pauseMenuButtonsHash.put("resume", r);
    pauseMenuButtonsHash.put("menu", hm4);
  }

  public void createGameOverMenu() {
    n2 = (Button) new NewGameButton(400, 270);
    q4 = (Button) new QuitButton(400, 330);
    gameOverButtonsHash.put("new", n2);
    gameOverButtonsHash.put("quit", q4);
  }
  
  public void createTutorialMenu()
  {
    hm = (Button) new HovedmenyButton(400, 620);
    next = (Button) new NextButton(590, 615);
    back = (Button) new BackButton(340, 615);
    tutorialMenuButtonsHash.put("menu",hm);
    tutorialMenuButtonsHash.put("next",next);
    tutorialMenuButtonsHash.put("back",back);
  }
  
  public void createHelpMenu()
  { 
    hm2 = (Button) new HovedmenyButton(400, 640);
    helpMenuButtonsHash.put("menu",hm2);
  }

  public void drawInGameButton() {  
    Set<String> keys = inGameButtonsHash.keySet();
    for (String hashKey : keys) {
      inGameButtonsHash.get(hashKey).drawButton();
    }
  }

  public void drawMenuButton() {
    Set<String> keys = mainMenuButtonsHash.keySet();
    for (String hashKey : keys) {
      mainMenuButtonsHash.get(hashKey).drawButton();
    }
  }

  public void drawLevelButton() {
    Set<String> keys = levelMenuButtonsHash.keySet();
    for (String hashKey : keys) {
      levelMenuButtonsHash.get(hashKey).drawButton();
    }
  }

  public void drawPauseMenu() {
    Set<String> keys = pauseMenuButtonsHash.keySet();
    for (String hashKey : keys) {
      pauseMenuButtonsHash.get(hashKey).drawButton();
    }
  }
  
   public void drawTutorialMenu() {
    Set<String> keys = tutorialMenuButtonsHash.keySet();
    for (String hashKey : keys) {
      tutorialMenuButtonsHash.get(hashKey).drawButton();
    }
  }
   public void drawHelpMenu() {
    Set<String> keys = helpMenuButtonsHash.keySet();
    for (String hashKey : keys) {
      helpMenuButtonsHash.get(hashKey).drawButton();
    }
  }

  public void drawGameOverMenu() {
    Set<String> keys = gameOverButtonsHash.keySet();
    for (String hashKey : keys) {
      gameOverButtonsHash.get(hashKey).drawButton();
    }
    //int hei = 1;
    textFont(font2, 50);
    fill(255);

    text("Game Over", 350, 200);
  }

  //Takes the parameter of a HashMap<String,Button>, and chesk if any of the buttons are pressed.
  //If a button is pressed the button object's key is returned.
  //If none of the buttons are pressed, it returns the String "none". 
  public String isButtonPressed(HashMap<String, Button> hash) {
    String result = "none";

    Set<String> keys = hash.keySet();
    for (String hashKey : keys) {
      if (hash.get(hashKey).buttonPressed() == true) {
        result = hashKey;
      }
    }
    return result;
  }


  public HashMap getMainMenuHash() {
    return mainMenuButtonsHash;
  }

  public HashMap getPauseMenuHash() {
    return pauseMenuButtonsHash;
  }

  public HashMap getInGameMenuHash() {
    return inGameButtonsHash;
  }

  public HashMap getGameOverMenuHash() {
    return gameOverButtonsHash;
  }
  public HashMap getLevelMenuButtonsHash() {
    return levelMenuButtonsHash;
  }
  
  public HashMap getTutorialMenuButtonsHash(){
    return tutorialMenuButtonsHash;
  }
  
  public HashMap getHelpMenuButtonsHash(){
    return helpMenuButtonsHash;
  }

  public boolean getSoundOnOffSwitch() {
    return s.onOffSwitch();
  }

  //public void scoreBoard(int score) {
  //  textFont(font, 16);
  //  fill(0);
  //  text("Score " + score, 30, 30);
  //}

  //public void showTimer(String time) {
  //  textFont(font, 16);
  //  fill(0);
  //  text("Time left " + time, 30, 50);
  //}
}