import ddf.minim.*;
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import java.util.Timer; 
import java.util.List;
import org.w3c.dom.*; //  attr, document and element is used from this


private AudioPlayer audioPlayer;
private Minim minim;
private Player player;
private Graphic graphic;
private ArrayList <Catch> fish;
private int numberOfFish = 5;
private InGameDisplay IGDisplay;
private boolean sound = true;
private boolean inGame = false;
private int score;
private Load loader;
private Saving save;

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
  save = new Saving();
  loader = new Load(player);
  graphic = new Graphic();
  IGDisplay = new InGameDisplay();
  fish = new ArrayList <Catch>();
  createfish();
  //Music if sound == true play background music
  playBackgroundMusic(sound);
  score = 0;
 // resumeGame(); 
}

void draw () {
  run();
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
    // fortsett spill skal inn her
    text("oi, her er det ingenting", 350, 300);
    text("her skal du kunne fortsette spillet", 350, 310);
    break;

  case STATE_PLAYING: 
    play();
    break;

  case STATE_TUTUROIAL: 
    // tutorial skal inn her
    text("oi, her er det ingenting", 350, 300);;
    break;

  case STATE_HELP:
    text("Hvis du trenger hjelp i spillet må du gjøre dette...", 200, 350); //nr. 3
    text("Dine kommandoer er:", 200, 270);     // ut print skal væer i meny 
    text("q for avslutte spillet", 200, 290);
    text("space for å slippe ned kroken", 200, 310);
    text("Piltastene for å styre båten og fiskestangen", 200, 320);
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
  inGame = true;
  graphic.drawBackground();
  IGDisplay.scoreBoard(score);
  player.boat();
  IGDisplay.drawInGameButton();
  for (int i = 0; i < fish.size(); i++) {
    fish.get(i).drawAllFish();
  }
   if( (player.gotCatch() == true) && (player.fishOnBoard() == true) ){
      score = score + 1;
      for (int i = 0; i < fish.size(); i++) {
        if(fish.get(i).equals(player.getCatch())) {
          fish.remove(i);
          
        }
      }
      
  }
  else {
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
    //audioPlayer.play();
  }
  if (sound == false)
  {
    audioPlayer.close();
    minim.stop();
  }
}
public void pauseGame(boolean pause)
{
  if (pause == false)
  {
    noLoop(); 
    save.saveState(player, fish);
    play();
  } else
  {
    loop();
  }
}

public void mousePressed() {
  // Checks if the use are pressing a button
  //Sound button in Game + menu  
  boolean mouseOnSound = IGDisplay.soundButtonPressed();
  if (mouseOnSound){  
    playBackgroundMusic( IGDisplay.getSoundOnOffSwitch());
  }
  //Pause button in Game
  boolean mouseOnPause = IGDisplay.pauseButtonPressed(); 
  if (mouseOnPause){
    pauseGame(IGDisplay.getPauseOnOffSwitch());
  } 
  
  if(inGame==false)
  {
  //New Game button in menu 
  boolean mouseOnNewGame = IGDisplay.newGameButtonPressed();
  if (mouseOnNewGame){
    STATE = STATE_PLAYING;
  }
  //Resume Game button in menu 
  boolean mouseOnResume = IGDisplay.resumeButtonPressed();
  if (mouseOnResume){
    STATE = STATE_CONTINUE;
  }
  //Tutorial button in menu 
  boolean mouseOnTutorial = IGDisplay.tutorialButtonPressed();
  if (mouseOnTutorial){
    STATE = STATE_TUTUROIAL;
  }
  //Help button in menu 
  boolean mouseOnHelp = IGDisplay.helpButtonPressed();
  if (mouseOnHelp){
    STATE = STATE_HELP;
  }
  //Quit button in menu 
  boolean mouseOnQuit = IGDisplay.quitButtonPressed();
  if (mouseOnQuit){
    STATE = STATE_QUIT;
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

// resume the player from the last game.
public void resumeGame() { 
  play();
  loader.fillPlayerInfo();
  //loader.fillFishInfo();
}