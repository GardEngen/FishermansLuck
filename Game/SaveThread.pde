class SaveThread extends Thread {
  Saving save;
  Game game;
  int score;
 // ArrayList<Catch> fish;

  public SaveThread(Saving save, Game game, int score) {
    this.save = save;
    this.game = game;
    this.score = score;
  }

  @Override
    public void run() {

    while (true) {

      if (game.needSaving()) {
        //save.playerSave(player, score); //,fish);
        save.saveGameState( player, score, fish);
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