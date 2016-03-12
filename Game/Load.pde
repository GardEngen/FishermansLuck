class Load {
  private JSONObject json;
  private int score;
  private int newScore;
  Load()
  {
    json = loadJSONObject("data.json");
  }
  public void playerLoad() {

    int xPos = json.getInt("xPos");    // load the players boat position
    player.setPlayerPosition(xPos);   
    println("båt pos: " + xPos);

    int yPos = json.getInt("yPos"); // load the players road position
    player.setHookPosition(yPos);

    score = json.getInt("Score");   // load the score
    println("Din lagra score er : " + score);

    boolean yRod = json.getBoolean("RoodInWater"); // get if the rood is in the water or not
    player.setPositionOfHook(yRod);
    //println("the rood is in the water: " + yRod);

    boolean setCatch = json.getBoolean("gotCatch"); // get if it is a fish on the hook.
    player.setCatch(setCatch);
    println("Fish on the hook " + setCatch);

    // null pointer 
    //float FishX = json.getFloat("FishX");
    //fish.setFishPosX(FishX);

    // null pointer
    //float FishY = json.getFloat("FishY");
    //fish.setFishPosY(FishY);
  }
  public int getScore()
  {
    newScore = newScore + score;
    return newScore;
  }
  
}