class SaveThread extends Thread {
private Saving save;
private Game game;
private Player player;
private Level level;

public SaveThread(Saving save, Game game, Player player, Level level) {
  this.save = save;
  this.game = game;
  this.player = player;
  this.level = level;
}

// ha med load sin getScore.
@Override
  public void run() {

  while (true) {

    if (game.needSaving()) { 
      save.saveGameState( player, level.getArray(), level.getScore());
    }
    try {
      savingThread.sleep(5000); // saves every 5 second.
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
}
}