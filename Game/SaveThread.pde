//class SaveThread extends Thread {
//  Saving save;
//  Game game;


//  public SaveThread(Saving save, Game game) {
//    this.save = save;
//    this.game = game;
//  }

//  // ha med load sin getScore.
//  @Override
//    public void run() {

//    while (true) {

//      if (game.needSaving()) { 
//        save.saveGameState( player, fish, score);
//      }
//      try {
//        savingThread.sleep(5000); // saves every 5 second.
//      }
//      catch (Exception e)
//      {
//        e.printStackTrace();
//      }
//    }
//  }
//}