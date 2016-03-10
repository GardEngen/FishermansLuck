class Load {
  private JSONObject json;
  private GameElement fish;
  private int score;
  private int newScore;
  Load()
  {
    json = loadJSONObject("data.json");
  }
  public void playerLoad() {
 
    int xPos = json.getInt("xPos");    // load the players boat position
    player.setPlayerPosition(xPos);   
    
    int yPos = json.getInt("yPos"); // load the players road position
    player.setHookPosition(yPos);
   
   boolean yRod = json.getBoolean("yRod");
   player.setPositionOfHook(yRod);
   println("the rood is in the water: " + yRod);
    
     score = json.getInt("Score");   // load the score
    println("Din lagra score er : " + score);
    
    // null pointer
    //float FishX = json.getFloat("FishX");
    //fish.setFishPosX(FishX);
    
    //float FishY = json.getFloat("FishY");
    //fish.setFishPosY(FishY);
    
  }
  public int getScore()
  {
    newScore = newScore + score;
    return newScore;
  }
}