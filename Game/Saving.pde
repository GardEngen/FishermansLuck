class Saving {
  Player player;

  JSONObject json;
  Saving() {
  }
  public void playerSave(Player player, int score) {      
    json = new JSONObject();

    //get positin to boat
    int playerXpos = player.gethorizontalMove();
    int roodYpos = player.getHookPosition();

    json.setInt("xPos", playerXpos); // get the players x position
    json.setInt("Score", score); // get the score
    json.setInt("yPos", roodYpos); // get the y-position of the rood
    //saveJSONObject(json, "Game.app/data/data.json");
    saveJSONObject(json, "data/data.json");


    println("Saved xPos: " + playerXpos);
    println("Saved score: " + score);
    println("Saved xPos: " + roodYpos);
  }
}