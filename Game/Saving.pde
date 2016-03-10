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
  public void saveGameState(Player player, int score, ArrayList<Catch> fish) {
    createJSON();
    playerSave(player, score);
    for ( Catch f : fish) {
      saveFish(f);
    }
    saveJSON();
  }
  public void playerSave(Player player, int score) {      
    //json = new JSONObject();
    //get positin to boat
    int playerXpos = player.gethorizontalMove(); // get the players(boat) x position
    int roodYpos = player.getHookPosition(); // get the y-position of the rood

    boolean roodInWaterOrNot = player.getPositionOfHook();

    json.setInt("xPos", playerXpos); 
    json.setInt("Score", score); 
    json.setInt("yPos", roodYpos); 
    json.setBoolean("yRod", roodInWaterOrNot);

    //saveJSON();
    //saveJSONObject(json, "Game.app/data/data.json");
    //saveJSONObject(json, "data/data.json");

    // println("Saved boat Pos: " + playerXpos);
    println("Saved score: " + score);
    //println("Saved rood Pos: " + roodYpos);
    println("The hook is in the water: " + roodInWaterOrNot);
  }

  public void saveFish(GameElement fish) {
    float fishYpos = fish.getFishPositionY();
    float fishXPos = fish.getFishPositionX();
    json.setFloat("FishY", fishYpos);
    json.setFloat("FishX", fishXPos);
  }
}