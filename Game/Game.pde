  
  // the real G
  import ddf.minim.*;
  import java.util.*;
  import java.lang.Math;
  import java.time.Duration;
  //import com.dhchoi.*;
  
  private AudioPlayer audioPlayer;
  private Minim minim;
  private Player player;
  private Graphic graphic;
  private Saving saving;
  private Load load;
  private Level level;
  private SaveThread savingThread; 
  private Menu menu;
  //private ArrayList <Catch> fish;
  //private int numberOfFish = 6;
  private boolean sound;
  private boolean inGame;
  private boolean inPauseMenu;
  private boolean gameOver;
  private boolean inLevelMenu;
  //CountdownTimer time;
  //private int score;
  //private int spawner;
  
  private final String STATE_MENU = "menu";
  private final String STATE_NEW = "new";
  private final String STATE_PLAYING = "play";
  private final String STATE_LEVEL = "level";
  private final String STATE_QUIT = "quit";     
  private final String STATE_HELP = "help";
  private final String STATE_CONTINUE = "continue";
  private final String STATE_TUTUROIAL = "tutorial";
  private final String STATE_GAME_OVER = "game over";
  private final String STATE_PAUSE = "pause";
  private final String STATE_RESUME = "resume";
  private String STATE = STATE_MENU;
  
  void setup () {
    size(1000, 700);
    frameRate(60);
    player = new Player();
    graphic = new Graphic();
    menu = new Menu();
    saving = new Saving();
    load = new Load();
    //time = CountdownTimerService.getNewCountdownTimer(this);
    level = new Level();
    level.setLevel(1);
    sound = true;
    //Music if sound == true play background music
    playBackgroundMusic(sound);
    gameOver = false;
    inGame = false;
    inPauseMenu = false;
    //spawner = 300; //How often fish are spawning. The lower the number, the ofter fish are spawn
    saving.saveGameState( player, level.getArray(), level.getScore());
    this.savingThread = new SaveThread(saving, this, player);
    this.savingThread.start();
    
    
  }
  
  void draw () {
    run();
    //play();
  }
  
  //Runs the game
  public void run() {
    switch(STATE) {
    case STATE_MENU: 
      inGame = false;
      gameOver = false;
      inPauseMenu = false;
      inLevelMenu = false;
      graphic.drawBackground();
      graphic.drawLogo();
      menu.drawMenuButton();
      break;
  
    case STATE_PAUSE:
      inLevelMenu = false;
      gameOver = false;
      inGame = false;
      inPauseMenu = true;
      pauseGame();
      break;
  
  
    case STATE_CONTINUE:  // check with the got catch
      gameOver = false;
      inLevelMenu = false;
      inGame = true;
      inPauseMenu = false;
      load.playerLoad();
      level.setScore(load.getScore());
      level.startTimer();
      STATE = STATE_PLAYING;
      break;
  
    case STATE_RESUME:
      gameOver = false;
      inLevelMenu = false;
      inGame = true;
      inPauseMenu = false;
      level.startTimer();
      STATE = STATE_PLAYING;
      break;
  
    case STATE_NEW:
      setup();
      STATE = STATE_PLAYING;
      level.resetTimer();
      break;
  
    case STATE_PLAYING: 
      //inGame = true;
      gameOver = false;
      inPauseMenu = false;
      //play();
      STATE = STATE_LEVEL;
      break;
      
    case STATE_LEVEL:
      inGame = false;
      inLevelMenu = true;
      gameOver = false;
      inPauseMenu = false;
      graphic.drawBackground();
      graphic.drawLogo();
      menu.drawLevelButton();
      
      
    break;
  
    case STATE_TUTUROIAL: 
      // tutorial skal inn her
      text("oi, her er det ingenting", 350, 300);
      break;
  
    case STATE_HELP:
      println("Din score er: " + level.getScore());
      println("LagraScore:" + load.getScore());
      break;
  
    case STATE_QUIT:
      gameOver = false;
      inGame = false;
      inPauseMenu = false;
      exit();
      break;
  
    case STATE_GAME_OVER:
      gameOver = true;
      inGame = false;
      inPauseMenu = false;
      graphic.gameOverBackground();
      menu.drawGameOverMenu();
      break;   
  
    default:
      // do nothing
      break;
    }
  }
  
  //Starts the game 
  public void play() {
    graphic.drawBackground();
    //level.scoreBoard();
    player.boat();
  
    menu.drawInGameButton();
    level.levelState();
  }
  
  //background music function.
  private void playBackgroundMusic(boolean sound) 
  {
    if (sound) {
      minim = new Minim(this);
      audioPlayer = minim.loadFile("lyd/Fishing2.mp3");
      //audioPlayer.play();
    }
    if (sound == false) {
      audioPlayer.close();
      minim.stop();
    }
  }
  
  public void pauseGame() {
    saving.saveGameState( player, level.getArray(), level.getScore());
    level.pauseTimer();
    menu.drawPauseMenu();
  }
  
  // Checks if the use are pressing a button
  public void mousePressed() {
  
    String result2 = menu.isButtonPressed(menu.getInGameMenuHash()) ;
      if (result2.equals("sound")) {
        playBackgroundMusic( menu.getSoundOnOffSwitch());
      }
  
      if (result2.equals("pause")) {
        STATE = STATE_PAUSE;
      }
    
    if (inGame==false)
    {
      String result = menu.isButtonPressed(menu.getMainMenuHash()) ;
      if (!result.equals("none")) {
        STATE = result;
      }
    }
    //  //buttons in Pause Menu
    if (inPauseMenu) {
  
      String result = menu.isButtonPressed(menu.getPauseMenuHash()) ;
      if (!result.equals("none")) {
        STATE = result;
      }
    }
    if (gameOver) {
      String result = menu.isButtonPressed(menu.getGameOverMenuHash()) ;
      if (!result.equals("none")) {
        STATE = result;
      }
    }
  }
  
  // If the game is true and not in the menu then the game need to be saved.
  public boolean needSaving() {
    return (inGame && (!inPauseMenu));
  }