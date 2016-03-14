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
  private Button l2Lock;  
  private Button q;
  private Button q2;

  private HashMap<String, Button> mainMenuButtonsHash;
  private HashMap<String, Button> inGameButtonsHash;
  private HashMap<String, Button> gameOverButtonsHash;
  private HashMap<String, Button> pauseMenuButtonsHash;
  private HashMap<String, Button> levelMenuButtonsHash;

  //private PFont font;
  private PFont font2;


  Menu() {
    mainMenuButtonsHash = new HashMap<String, Button>();
    inGameButtonsHash = new HashMap<String, Button>();
    gameOverButtonsHash = new HashMap<String, Button>();
    pauseMenuButtonsHash = new HashMap<String, Button>();
    levelMenuButtonsHash = new HashMap<String, Button>();

    createMainMenu();
    createInGameMenu();
    createPauseMenu();
    createGameOverMenu();
    createLevelMenu();

    //font = createFont("Arial", 16, true);
    font2 = createFont("Arial", 30, true);
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
    //Button l2Lock = (Button) new Level2LButton(400, 330);

    levelMenuButtonsHash.put("gjørikkenoeee", l1);
    levelMenuButtonsHash.put("gjørikkeno", l2);
    levelMenuButtonsHash.put("freeplay", m);
  }

  public void createPauseMenu() {
    q2 = (Button) new QuitButton(400, 330);
    pauseMenuButtonsHash.put("DU SKAL IKKE GJØRE EN DRITT MEN BARE SE PEN UT, TAKK!", play);
    pauseMenuButtonsHash.put("resume", r);
    pauseMenuButtonsHash.put("menu", q2);
  }

  public void createGameOverMenu() {
    n2 = (Button) new NewGameButton(400, 270);

    gameOverButtonsHash.put("new", n2);
    gameOverButtonsHash.put("quit", q2);
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

  public void drawGameOverMenu() {
    Set<String> keys = gameOverButtonsHash.keySet();
    for (String hashKey : keys) {
      gameOverButtonsHash.get(hashKey).drawButton();
    }
    textFont(font2, 30);
    fill(255);
    text("Game Over", 410, 200);
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