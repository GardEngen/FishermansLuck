// the read file
public class Load {
  // loads area form xml files
  XML xml;
  Player player;
  GameElement gameElement;
  Catch fish;
  // referanse: https://processing.org/reference/XML.html

  public Load(Player player) {
    this.player = player;

    try {
      xml = loadXML("fishPlayerData.xml");
      fillPlayerInfo();
      fillFishInfo();
    }
    catch(NullPointerException e) {
    }
  }

  // get the information about the player
  public void fillPlayerInfo() {

    // gets every player object that is in the xml file. we have only one.
    XML [] children = xml.getChildren("player"); 

    // load the data from the XML
    // get the information from each and saves them in local variabels.
    String name = children[0].getString("name"); 
    int life = children[0].getInt("life"); // how many life the player has 
    int hookPosition = children[0].getInt("hookPosition"); // where the hook is
    int startPos = children[0].getInt("startPosition"); // where the boat is

    player.setName(name);
    player.setLife(life);
    player.setPlayerPosition(startPos);
    player.setHookPosition(hookPosition);
  }

// get the information about the fish
  public void fillFishInfo() {
    XML [] child = xml.getChildren("fish");
    for ( int i = 0; i < child.length; i++) {
      float fishPosX = child[i].getFloat("fishX"); // Fish x position
      float fishPosY = child[i].getFloat("fishY"); // Fish y position

      gameElement.setFishPosX(fishPosX);
      gameElement.setFishPosY(fishPosY);
    }
  }
}