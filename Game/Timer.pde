
public class Timer {

  private int startTime;
  private long minute;
  private long second;
  private long savedMin;
  private long savedSec;
  private long oldSecond;
  private boolean saved;
  private boolean timesUp;
  private String time;
   private PFont font;
  
  Timer(int countDown) {
    setStartTime(countDown);
    oldSecond = 0;
    timesUp = false;
    saved = false;
    font = createFont("Fantasy", 16, true);
  }

  public boolean time() {
    long newSecond = second();

    if ((second == 0) && (minute == 0)) {
      timesUp = true;
    }
    if (newSecond != oldSecond) {
      oldSecond = newSecond;
      second = second - 1;
    }
    if (second == 0) {
      second = 59;
      minute = minute - 1;
    }

    if (second < 10) {
      String timeDisplay = minute + ":0" + second;
      showTimer(timeDisplay);
      //time = timeDisplay;
    } else {
      String timeDisplay = minute + ":" + second;
      showTimer(timeDisplay);
     // time = timeDisplay;
    }
    return timesUp;
  }

  //The time is set in second
  public void setStartTime(int min) {
    startTime = min - 1;
    minute = startTime - 1;
    second = 59;
  }

  public void resetTimer() {
    minute = startTime;
    second = 59;
  }

  public long getMinute() {
    return minute;
  }

  public long getSecond() {
    return second;
  }

  public void pauseTimer() {
    if (!saved) {
      savedMin = minute;
      savedSec = second;
      saved = true;
    }
  }

  public void startTimer() {
    if (saved) {
      minute = savedMin;
      second = savedSec;
      saved = false;
    }
  }
  
  public String getTime() {
    return time;
  }
  
  public boolean checkIfTimesUp() {
    return timesUp;
  }
  
 public void showTimer(String time) {
   textFont(font, 16);
   fill(0);
   text("" + time, 30, 50);
 }
}