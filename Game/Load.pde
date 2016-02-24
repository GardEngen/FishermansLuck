public class Load {
  // loads area form xml files
  XML xml;
  Player player;
  public Load(Player player) {
    this.player = player;
    try {
      xml = loadXML("data.xml");
      fillPlayerInfo();
    }
    catch(NullPointerException e) {
    }
  }

  // get the saved object into the area
  public void fillPlayerInfo() {

    XML [] children = xml.getChildren("player");

    for (int i = 0; i < children.length; i++) {
      String name = children[i].getString("name");
      int life = children[i].getInt("life");
      // float level = children[i].getFloat("level");
      //  float boat = children[i].getFloat("boat");
      //float fish = children[i].getFloat("fish");
      // does not exist yet
      player.setPlayer(name, life);
    }
  }
}