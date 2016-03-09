class Load {
  private JSONObject json;
  private int score;
  private int newScore;
  Load()
  {
    json = loadJSONObject("data.json");
  }
  public void playerLoad() {
 
    int xPos = json.getInt("xPos");   
    player.setPlayerPosition(xPos);
    
    int yPos = json.getInt("yPos");
    player.setHookPosition(yPos);
    
     score = json.getInt("Score");
    println("Din lagra score er : " + score);
  }
  public int getScore()
  {
    newScore = newScore + score;
    return newScore;
  }
}