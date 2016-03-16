class Load {
  private JSONObject json;
  private int score;
 
  Load() {
  }

  public void playerLoad() {
    json = loadJSONObject("data/data.json");
    
    int xPos = json.getInt("xPos");    // load the players boat position
    player.setPlayerPosition(xPos);   

    int yPos = json.getInt("yPos"); // load the players road position
    player.setHookPosition(yPos);

    score = json.getInt("Score");   // load the score
    level.setScore(score);

    boolean yRod = json.getBoolean("RoodInWater"); // get if the rood is in the water or not
    player.setPositionOfHook(yRod);

    boolean setCatch = json.getBoolean("gotCatch"); // get if it is a fish on the hook.
    player.setCatch(setCatch);
    
    int setLevel = json.getInt("level"); // load the current level
    level.setLevel(setLevel);
    
    boolean setStatus = json.getBoolean("Win_status");
    level.setWinStatus(setStatus);
    
    boolean levelCompleted = json.getBoolean("Completed_level");
    level.setLevelCompleted(levelCompleted);

    // null pointer 
    //float FishX = json.getFloat("FishX");
    //fish.setFishPosX(FishX);

    // null pointer
    //float FishY = json.getFloat("FishY");
    //fish.setFishPosY(FishY);
  }

  public int getScore() {
    return score;
  }
}