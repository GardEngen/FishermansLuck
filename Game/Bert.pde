public class Bert extends Catch {

  public Bert() {
  }

  public void bertFish() {
    xCut= 100;
    yCut = bertImage.height;
    numberOfpictures = 6;
    delay = 0.5;
    dangerous = false;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, bertImage, bertImageRevers, bertCaught, dangerous);
  }

  //@Override
  //  public String getType() {
  //  return "Bert";
  //}

  //@Override
  //  public boolean isBad() {
  //  return false; // this is a good fish
  //}
}
//
public class Shark extends Catch {

  public Shark() {
  }

  public void shark() {
    xCut = 139;
    yCut = sharkImage.height;
    numberOfpictures = 1;
    delay = 1.0;
    dangerous = true;
    imageDivider(numberOfpictures, xCut, yCut, delay);
    elementMovement(speed, sharkImageRevers, sharkImage, sharkCaught, dangerous);
  }
  
  //  @Override
  //    public String getType() {
  //    return "Shark";
  //  }
  
  //  @Override
  //    public boolean isBad() {
  //    return true; // this is a bad fish
  //  }
}