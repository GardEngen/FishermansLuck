// referense: http://www.tutorialspoint.com/java_xml/java_dom_create_document.html
public class Saving {
  private DocumentBuilderFactory docFactor;
  private TransformerFactory transFactor;
  private Transformer trans;
  private DOMSource source;
  private StreamResult result;
  private DocumentBuilder docBuilder;
  private Document doc; // represent the entire xml document 
  private Element rootElement;
  private Attr attr; // the attribut of the element
  // private List<Catch> fish;

  GameElement gameElement;
  //Catch fish;

  // Build XML to save files
  public Saving() {

    try {
      //File inputFile = new File("data.xml");
      docFactor = DocumentBuilderFactory.newInstance();
      docBuilder = docFactor.newDocumentBuilder();
    } // catch error if it occurs
    catch(ParserConfigurationException pce ) {
      System.out.println("Something went wrong with building the doc");
    }
  }

  // start the XML document
  private void startNewXML() {
    // create an instance of the document
    doc = docBuilder.newDocument();
    // make the rootElement
    rootElement = doc.createElement("game");
    doc.appendChild(rootElement);
  }

  // save the XML file.
  private void saveXMLFile() {
    try {// try to write the content into xml file 
      transFactor = TransformerFactory.newInstance();
      trans = transFactor.newTransformer();
      source = new DOMSource(doc);
      result = new StreamResult(new File("fishPlayerData.xml")); // lagres i "hus", men med en gang spillet blir eksportert blir det rett lagret.

      trans.transform(source, result);
      System.out.println("File saved");
    } // error message if the file could not be saved.
    catch(TransformerException tfe) {
      System.out.println("Something went wrong");
    }
  }

  // save the state of the player
  private void saveState(Player player, List<Catch> fish) {
    startNewXML();
    savePlayer(player);
    //SaveFish(fish);
    for (Catch f : fish) {
      saveFish(f);
    }
    saveXMLFile();
  }

  // save the fish
  private void saveFish(GameElement f) {
    // fish element
    Element fish = doc.createElement("fish");
    rootElement.appendChild(fish);

    attr = doc.createAttribute("fishX"); // 
    attr.setValue("" + f.getFishPositionX()); // The fish x position
    fish.setAttributeNode(attr);
    //println(attr);

    attr = doc.createAttribute("fishY");
    attr.setValue("" + f.getFishPositionY()); // The fish y position
    fish.setAttributeNode(attr);
    //println(attr);
  }

  // save the player
  private void savePlayer(Player player) {
    // player element
    Element character = doc.createElement("player");
    rootElement.appendChild(character);
    //highscore, fisk på kroken skal med.

    // set the attribut for the element
    attr = doc.createAttribute("name");
    attr.setValue("" + player.getName());
    character.setAttributeNode(attr);

    attr = doc.createAttribute("life");
    attr.setValue("" + player.getLife());
    character.setAttributeNode(attr);

    attr = doc.createAttribute("startPosition"); // position of the boat
    attr.setValue("" + player.getPlayerPosition());
    character.setAttributeNode(attr);

    attr = doc.createAttribute("hookPosition"); // position of the hook.
    attr.setValue("" + player.getHookPosition());
    character.setAttributeNode(attr);
  }
}