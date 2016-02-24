
public class Menu {
   private PImage forsettSpill;
   private PImage nyttSpill;
   private PImage tutorial;
  public Menu() {
     forsettSpill = loadImage("Knapp/Forsett.png");
     nyttSpill = loadImage("Knapp/NyttSpill.png");
     tutorial = loadImage("Knapp/Tutorial.png");
  }

  // Show the help for the game
  public void showHelp() {
    text("Hvis du trenger hjelp i spillet må du gjøre dette...", 200, 350); //nr. 3
    text("Dine kommandoer er:", 200, 270);     // ut print skal væer i meny 
    text("q for avslutte spillet", 200, 290);
    text("space for å slippe ned kroken", 200, 310);
    text("Piltastene for å styre båten og fiskestangen", 200, 320);
  }

  // Display the name of the game
  public void showMenu() {
    //textSize(14);
    image(forsettSpill, 381, 281);
    image(nyttSpill, 392, 358);
    image(tutorial, 400, 434);
    //text("Press H for hjelp", 600, 310);
    //text("Press Q for å avslutte spillet", 600, 330);
  }
}