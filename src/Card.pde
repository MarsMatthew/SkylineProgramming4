public class Card {
  //Type, Name, Chest, left, right, peaceful
  private ArrayList<String> info = new ArrayList<>();
  Card() {
  }
  Card(Integer type) {
    info.add(String.valueOf(type));
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
    info.add(null);
  }
  public void newCard(Integer type) {
    switch(type) {
    case 0:
      newCard(int(random(4)));
      break;
    case 1:
      //Enemy
      int eType = int(random(6));
      switch(eType) {
      case 0:
        //Skeleton
        info.set(0, String.valueOf(eType));
        info.set(1, pickName());
        info.set(3, "a sharpened bone");
        info.set(4, "a dull bone");
        info.set(6, String.valueOf(30));
        info.set(7, String.valueOf(10));
        info.set(8, String.valueOf(5));
        info.set(9, String.valueOf(10));
        info.set(10, String.valueOf(0));
        info.set(11, String.valueOf(5));
        break;
      case 1:
        //Zombie
        info.set(0, String.valueOf(eType));
        info.set(1, pickName());
        info.set(3, "a rotten hand");
        info.set(4, "a rotten leg");
        info.set(6, String.valueOf(25));
        info.set(7, String.valueOf(10));
        info.set(8, String.valueOf(0));
        info.set(9, String.valueOf(7));
        info.set(10, String.valueOf(5));
        info.set(11, String.valueOf(11));
        break;
      case 2:
        //Slime
        info.set(0, String.valueOf(eType));
        info.set(1, pickName());
        info.set(3, "a slime ball");
        info.set(4, "a slime ball");
        info.set(6, String.valueOf(40));
        info.set(7, String.valueOf(5));
        info.set(8, String.valueOf(0));
        info.set(9, String.valueOf(0));
        info.set(10, String.valueOf(5));
        info.set(11, String.valueOf(11));
        break;
      case 3:
        //Rat
        info.set(0, String.valueOf(eType));
        info.set(1, pickName());
        info.set(3, "a scratch");
        info.set(4, "a bite");
        info.set(6, String.valueOf(40));
        info.set(7, String.valueOf(5));
        info.set(8, String.valueOf(0));
        info.set(9, String.valueOf(10));
        info.set(10, String.valueOf(16));
        info.set(11, String.valueOf(21));
        break;
      case 4:
        //Stone Giant
        info.set(0, String.valueOf(eType));
        info.set(1, pickName());
        info.set(3, "a rock");
        info.set(4, "a fist");
        info.set(6, String.valueOf(55));
        info.set(7, String.valueOf(15));
        info.set(8, String.valueOf(5));
        info.set(9, String.valueOf(3));
        info.set(10, String.valueOf(21));
        info.set(11, String.valueOf(26));
        break;
      case 5:
        //Spider
        info.set(0, String.valueOf(eType));
        info.set(1, pickName());
        info.set(3, "a bite");
        info.set(4, "a bite");
        info.set(6, String.valueOf(30));
        info.set(7, String.valueOf(10));
        info.set(8, String.valueOf(0));
        info.set(9, String.valueOf(20));
        info.set(10, String.valueOf(26));
        info.set(11, String.valueOf(30));
        break;
      }
      info.set(2, String.valueOf(false));
      info.set(5, String.valueOf(false));
      break;
    case 2:
      /*
    Room type card
       */
      int rType = int(random(3));
      switch(rType) {
      case 0:
        //Hallway
        info.set(0, String.valueOf(rType));
        info.set(1, "Hallway");
        info.set(3, "Foward");
        info.set(4, "Back");
        break;
      case 1:
        //Door
        info.set(0, String.valueOf(rType));
        info.set(1, "Door");
        info.set(3, "Open");
        info.set(4, "Leave");
        break;
      case 2:
        //Fork
        info.set(0, String.valueOf(rType));
        info.set(1, "Fork");

        info.set(3, "Left");
        info.set(4, "Right");
        break;
      }
      info.set(2, String.valueOf(false));
      info.set(5, String.valueOf(true));
      info.set(6, String.valueOf(0));
      info.set(7, String.valueOf(0));
      info.set(8, String.valueOf(0));
      info.set(9, String.valueOf(0));
      info.set(10, String.valueOf(0));
      info.set(11, String.valueOf(0));
      break;
    case 3:
      //Chest
      int cType = int(random(4));
      switch(cType) {
      case 0:
        info.set(0, String.valueOf(cType));
        info.set(1, "Bag of Gold");
        break;
      case 1:
        info.set(0, String.valueOf(cType));
        info.set(1, "Small Chest");
        break;
      case 2:
        info.set(0, String.valueOf(cType));
        info.set(1, "Large Chest");
        break;
      case 3:
        info.set(0, String.valueOf(cType));
        info.set(1, "Splendid chest");
        break;
      }
      info.set(2, String.valueOf(true));
      info.set(3, "Open");
      info.set(4, "Open");
      info.set(5, String.valueOf(true));
      info.set(6, String.valueOf(0));
      info.set(7, String.valueOf(0));
      info.set(8, String.valueOf(0));
      info.set(9, String.valueOf(0));
      info.set(10, String.valueOf(0));
      info.set(11, String.valueOf(0));
      break;

    default:
      stop();
      break;
    }
  }
  public String pickName() {
    BufferedReader read;
    int low = Integer.valueOf(info.get(4));
    int high = Integer.valueOf(info.get(5));
    read = createReader("EnemyNames.txt");
    String line = null;
    try {
      line = read.readLine();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    String[] names = split(line, ',');
    int pick = int(random(low, high));
    return  names[pick];
  }
  public void saveCard() {
    PrintWriter output;
    BufferedReader read;
    //Save previous card
    output = createWriter("prevCard.txt");
    read = createReader("currentCard.txt");
    try {
      output.println(read.readLine());
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    //Save current card
    for (String str : info) {
      output.print(str+",");
    }
    output.flush();
    output.close();
  }
  public void loadCurrCard() {
    BufferedReader read;
    read = createReader("currentCard.txt");

    try {
      String[] lines = split(read.readLine(), ",");
      ArrayList<String> test = new ArrayList<String>(12);
      for (String line : lines) {
        test.add(line);
      }
      info = test;
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }
}
