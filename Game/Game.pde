// the real G
import ddf.minim.*;
private AudioPlayer audioPlayer;
private Minim minim;
private Player player;
private Graphic graphic;
private Saving saving;
private Load load;
private ArrayList <Catch> fish;
//private int numberOfFish = 6;
private InGameDisplay IGDisplay;
private boolean sound = true;
private boolean inGame = false;
private boolean inPauseMenu;
private boolean gameOver;
private int score;
private int spawner;

private final int STATE_MENU = 1;
private final int STATE_PLAYING = 2;
private final int STATE_QUIT = 3;     
private final int STATE_HELP = 4;
private final int STATE_CONTINUE = 5;
private final int STATE_TUTUROIAL = 6;
private final int STATE_GAME_OVER = 7;
private int STATE = STATE_MENU;



void setup ()
{
  size(1000, 700);
  frameRate(60);
  player = new Player();
  graphic = new Graphic();
  IGDisplay = new InGameDisplay();
  fish = new ArrayList <Catch>();
  saving = new Saving();
  load = new Load();
  //Music if sound == true play background music
  playBackgroundMusic(sound);
  gameOver = false;
  spawner = 300;
}


void draw () {
  run();
  //play();
}

//Runs the game
public void run() {
  switch(STATE) {
  case STATE_MENU: 
    graphic.drawBackground();
    graphic.drawLogo();
    IGDisplay.drawMenuButton();
    break;

  case STATE_CONTINUE: 
    load.playerLoad();
    score = load.getScore();
    STATE = STATE_PLAYING;
    break;

  case STATE_PLAYING: 
    play();
    break;

  case STATE_TUTUROIAL: 
    // tutorial skal inn her
    text("oi, her er det ingenting", 350, 300);

    break;

  case STATE_HELP:
    println("Din score er: " + score);
    println("LagraScore:" + load.getScore());
    break;

  case STATE_QUIT:
    exit();
    break;

  case STATE_GAME_OVER:
    gameOver = true;
    graphic.gameOverBackground();
    IGDisplay.drawGameOVerMenu();
   
    break;   

  default:
    // do nothing
    break;
  }
}

//Starts the game 
public void play() {
  inGame = true;
   gameOver = false;
  graphic.drawBackground();
  IGDisplay.scoreBoard(score);
  player.boat();

  IGDisplay.drawInGameButton();
  //Checks if its time to spawn new fish
  if (spawner >= 300) {
    spawn();
    spawner = 0;
  }

  for (int i = 0; i < fish.size(); i++) {
    fish.get(i).drawAllFish();
    //There is two for-loops to prevent a bug in the fish animation
  }

  for (int i = 0; i < fish.size(); i++) {
    if (fish.get(i).isInMotion() == false) {
      fish.remove(i);
    }
  }

  if ( (player.gotCatch() == true) && (player.checkIfDangerous() == true) ) {
    STATE = STATE_GAME_OVER;
  }

  if ( (player.gotCatch() == true) && (player.fishOnBoard() == true) ) {
    score = score + 1;
    for (int i = 0; i < fish.size(); i++) {
      if (fish.get(i).equals(player.getCatch())) {
        fish.remove(i);
      }
    }
  }

  if (player.gotCatch() == false) {
    catchSomething();
  }

  spawner = spawner + int(random(1, 10));
}

//Creats a fish and adds it to the arraylist
private void spawn() {
  fish.add(new Catch());
}

//background music function.
private void playBackgroundMusic(boolean sound) 
{
  if (sound) {
    minim = new Minim(this);
    audioPlayer = minim.loadFile("lyd/Fishing2.mp3");
    //audioPlayer.play();
  }
  if (sound == false)
  {
    audioPlayer.close();
    minim.stop();
  }
}
public void pauseGame()
{
  noLoop(); 
  saving.playerSave(player, score);
  inPauseMenu = true;
  IGDisplay.drawPauseMenu();
}

public void mousePressed() {
  // Checks if the use are pressing a button
  //Sound button in Game + menu  
  boolean mouseOnSound = IGDisplay.soundButtonPressed();
  if (mouseOnSound) {  
    playBackgroundMusic( IGDisplay.getSoundOnOffSwitch());
  }
  //Run PauseMenu in Game
  boolean mouseOnPause = IGDisplay.pauseButtonPressed(); 
  if (mouseOnPause) {
    pauseGame();
  } 

  if (inGame==false)
  {
    //New Game button in menu 
    boolean mouseOnNewGame = IGDisplay.newGameButtonPressed();
    if (mouseOnNewGame) {
      STATE = STATE_PLAYING;
    }
    //Resume Game button in menu 
    boolean mouseOnResume = IGDisplay.resumeButtonPressed();
    if (mouseOnResume) {
      STATE = STATE_CONTINUE;
    }
    //Tutorial button in menu 
    boolean mouseOnTutorial = IGDisplay.tutorialButtonPressed();
    if (mouseOnTutorial) {
      STATE = STATE_TUTUROIAL;
    }
    //Help button in menu 
    boolean mouseOnHelp = IGDisplay.helpButtonPressed();
    if (mouseOnHelp) {
      STATE = STATE_HELP;
    }
    //Quit button in menu 
    boolean mouseOnQuit = IGDisplay.quitButtonPressed();
    if (mouseOnQuit) {
      STATE = STATE_QUIT;
    }
  }
  //buttons for in Pause Menu
  if (inPauseMenu) {
    //resume game
    boolean mouseOnResume = IGDisplay.resumeButtonPressed();
    if (mouseOnResume) { 
      gameOver = false;
      loop();
    }
    //go back to menu
    boolean mouseOnQuit = IGDisplay.quitButtonPressed();
    if (mouseOnQuit) {
      STATE = STATE_MENU;
      inGame = false;
      
      loop();
    }
  }
  if (gameOver) {
    //New Game button in menu 
    boolean mouseOnNewGame = IGDisplay.newGameButtonPressed();
    if (mouseOnNewGame) {
      STATE = STATE_PLAYING;
    }
    //Quit button in menu 
    boolean mouseOnQuit = IGDisplay.quitButtonPressed();
    if (mouseOnQuit) {
      STATE = STATE_MENU;
    }
  }
}

//Hitbox detection for catching fish
private void catchSomething() {
  float catchX;
  float catchY;
  float catchHeight;
  float rodX = player.getHitboxCenterXPos(); //centered
  float rodY = player.getHitboxCenterYPos(); //centered

  for (Catch temp : fish) {
    catchHeight = temp.getYCut();
    catchY = temp.getCenterYHit(); //centered
    catchX = temp.getCenterXHit(); //centered

    if ( dist(rodX, rodY, catchX, catchY) <= catchHeight/2 ) {
      player.myCatch(temp.isCaught());
    }
  }
}