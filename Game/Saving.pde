class Saving {
  Player player;
    
  JSONObject json;
  Saving() {
  }
  public void playerSave(Player player, int score) {      
    json = new JSONObject();
    
    //get positin to boat
    int playerXpos = player.gethorizontalMove();   
    
    json.setInt("xPos", playerXpos);
    json.setInt("Score", score);
    //saveJSONObject(json, "Game.app/data/data.json");
     saveJSONObject(json, "data/data.json");
     
     
    println("Saved xPos: " + playerXpos);
    println("Saved score: " + score);
  }
 
}