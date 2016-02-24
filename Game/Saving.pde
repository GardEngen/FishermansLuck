public class Saving {
  private DocumentBuilderFactory docFactor;
  private TransformerFactory transFactor;
  private Transformer trans;
  private DOMSource source;
  private StreamResult result;
  private DocumentBuilder docBuilder;
  private Document doc; // represent the entire xml document 
  private Element rootElement;
 // private Element tempEl;
  private Attr attr; // the attribut of the element
 // private Player player;

  // referense: http://www.tutorialspoint.com/java_xml/java_dom_create_document.html

  // Build XML to save files
  public Saving() {

    try {
      //File inputFile = new File("data.xml");
      docFactor = DocumentBuilderFactory.newInstance();
      docBuilder = docFactor.newDocumentBuilder();
      // create an instance of the document
      doc = docBuilder.newDocument();
      // make the rootElement
      rootElement = doc.createElement("game");
      doc.appendChild(rootElement);
    } // catch error if it occurs
    catch(ParserConfigurationException pce ) {
      System.out.println("Something went wrong with building the doc");
    }
  }
  void savePlayer(Player player) {
   
    // player element
    Element character = doc.createElement("player");
    rootElement.appendChild(character);
    //highscore lagre posisjon på båten
    // set the attribut for the element
    attr = doc.createAttribute("name");
    attr.setValue("" + player.getName());
    character.setAttributeNode(attr);

    attr = doc.createAttribute("life");
    attr.setValue("" + player.getLife());
    character.setAttributeNode(attr);

    try {// try to write the content into xml file 
      transFactor = TransformerFactory.newInstance();
      trans = transFactor.newTransformer();
      source = new DOMSource(doc);
      result = new StreamResult(new File("data.xml"));

      trans.transform(source, result);
      System.out.println("File saved");
    } // error message if the file could not be saved.
    catch(TransformerException tfe) {
      System.out.println("Something went wrong");
    }
  }
}