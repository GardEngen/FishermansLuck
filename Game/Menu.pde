
public class Menu {

  public Menu() {
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
    text("Fisherman's luck", 350, 350);
    text("- A fishilishes game", 350, 370);
    textSize(14);
    text("Press 1 for å fortsette spillet", 600, 250);
    text("Press 2 for å starte nytt spill", 600, 270);
    text("Press 3 for å starte tutorial", 600, 290);
    text("Press H for hjelp", 600, 310);
    text("Press Q for å avslutte spillet", 600, 330);
  }
}