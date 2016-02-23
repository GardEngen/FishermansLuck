import ddf.minim.*;

private AudioPlayer audioPlayer;
private Minim minim;
private Player player;
private Graphic graphic;
private Control control;
private Menu menu;
private ArrayList <Catch> fish;
private int numberOfFish = 5;
private InGameDisplay IGDisplay;
private boolean sound=true;

private final int STATE_MENU = 1;
private final int STATE_PLAYING = 2;
private final int STATE_QUIT = 3;     
private final int STATE_HELP = 4;
private final int STATE_CONTINUE = 5;
private final int STATE_TUTUROIAL = 6;
private int STATE = STATE_MENU;


void setup ()
{
  size(1000, 700);
  frameRate(60);
  player = new Player();
  graphic = new Graphic();
  menu = new Menu();
  control = new Control(); 
  IGDisplay = new InGameDisplay();
  fish = new ArrayList <Catch>();
  createfish();
  //Music if sound == true play background music
  playBackgroundMusic(sound);
}

void draw () {
  //run();
  play();
}

//Runs the game
public void run() {
  switch(STATE) {
  case STATE_MENU: 
    graphic.drawBackground();
    menu.showMenu();
    control.keysForMenu();
    break;

  case STATE_CONTINUE: 
    // fortsett spill skal inn her
    text("oi, her er det ingenting", 350, 300);
    control.keysForMenu();
    text("her skal du kunne fortsette spillet", 350, 310);
    control.keysForMenu();
    break;

  case STATE_PLAYING: 
    play();
    break;

  case STATE_TUTUROIAL: 
    // tutorial skal inn her
    text("oi, her er det ingenting", 350, 300);
    control.keysForMenu();
    break;

  case STATE_HELP:
    menu.showHelp();
    control.keysForMenu();
    break;

  case STATE_QUIT:
    exit();
    break;

  default:
    // do nothing
    break;
  }
}

//Starts the game 
public void play() { 
  graphic.drawBackground();
  player.boat();
  IGDisplay.drawButton();
  for (int i = 0; i < numberOfFish; i++) {
    fish.get(i).drawAllFish();
  }
  
  if(player.gotCatch() == false) {
  catchSomething();
  }
  
}

//Creats fish, an add the to an arraylist
private void createfish() {
  for (int i=0; i<numberOfFish; i++) {
    fish.add(new Catch());
  }
}

//background music function.
private void playBackgroundMusic(boolean sound) 
{
  if (sound) {
    minim = new Minim(this);
    audioPlayer = minim.loadFile("Lyd/Fishing2.mp3");
    audioPlayer.play();
  }
  if (sound == false)
  {
    audioPlayer.close();
    minim.stop();
  }
}
public void pauseGame(boolean pause)
{
  if(pause == false)
  {
      noLoop(); 
      play();
  }
  else
  {
    loop();
  }
}

public void mousePressed() {
  // Checks if the use are pressing a button
  boolean mouseOnSound = IGDisplay.soundButtonPressed();
  if (mouseOnSound)
  {  
    playBackgroundMusic( IGDisplay.getSoundOnOffSwitch());
  }
  boolean mouseOnPause = IGDisplay.pauseButtonPressed(); 
  if(mouseOnPause)
  {
    pauseGame(IGDisplay.getPauseOnOffSwitch());
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