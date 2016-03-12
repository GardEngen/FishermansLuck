class Saving {
  Player player;
  GameElement GameFish;

  JSONObject json;
  Saving() {
  }

  // create the JSON document
  public void createJSON() {
    json = new JSONObject();
  }

  // save the JSON document
  public void saveJSON() {
    //saveJSONObject(json, "Game.app/data/data.json");
    saveJSONObject(json, "data/data.json");
  }
  public void saveGameState(Player player, ArrayList<Catch> fish,int score) {
    createJSON();
    playerSave(player, score);
    for ( Catch f : fish) {
      saveFish(f);
    }
    saveJSON();
  }

  public void playerSave(Player player, int score) {      
    //get positin to boat
    int playerXpos = player.gethorizontalMove(); // get the players(boat) x position
    int roodYpos = player.getHookPosition(); // get the y-position of the rood

    boolean roodInWaterOrNot = player.checkPositionOfHook();
    boolean gotCatch = player.gotCatch();

    json.setInt("xPos", playerXpos); 
    json.setInt("Score", score); 
    json.setInt("yPos", roodYpos); 

    json.setBoolean("RoodInWater", roodInWaterOrNot); // check if the hook is in the hook or not.
    json.setBoolean("gotCatch", gotCatch); // got fish on the hook

    println("Saved boat Pos: " + playerXpos);
    println("Saved score: " + score);
    println("fish on hook: " + gotCatch);
    println("");
  }

  // save the information about the fish
  public void saveFish(GameElement fish) {

    float fishYpos = fish.getFishPositionY();
    float fishXPos = fish.getFishPositionX();
    json.setFloat("FishY", fishYpos);
    json.setFloat("FishX", fishXPos);
  }
}