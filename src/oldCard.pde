//class oldCard {
//  private boolean chest;
//  private int type;
//  private String right, left, name;
//  public boolean peaceful;
//  public int[] eStats;
//  BufferedReader read;
//  PrintWriter write;

//  Card() {
//  }
//  Card(String name, boolean chest, int cardType, String cardRight, String cardLeft, boolean peaceful) {
//    this.chest = chest;
//    this.type = cardType;
//    this.right = cardRight;
//    this.left = cardLeft;
//    this.peaceful = peaceful;
//    this.name = name;
//  }

//  //Makes new card type. If card type is 0 it will create a random card, otherwise it will create a card of choice
//  public void pickCardType(int type) {
//    switch (type) {
//    case 0:
//      //Make random card
//      pickCardType(int(random(1, 4)));
//      break;
//    case 1:
//      //Enemy
//      break;
//    case 2:
//      //Room
//      break;
//    case 3:
//      //Chest
//      break;
//    default:
//      System.out.println("Error");
//      break;
//    }
//  }
//  public int[] enemyDetailer(int type) {
//    eStats = new int[] { 0, 0, 0, 0, 0, 0 };
//    switch (type) {
//    case 0: // Skeleton
//      eStats = new int[] { 30, 10, 5, 10, 0, 5 };
//      break;
//    case 1: // Zombie
//      eStats = new int[] { 25, 10, 0, 7, 5, 11 };
//      break;
//    case 2: // Slime
//      eStats = new int[] { 40, 5, 0, 0, 11, 16 };
//      break;
//    case 3: // Rats
//      eStats = new int[] { 40, 5, 0, 10, 16, 21 };
//      break;
//    case 4: // Giant
//      eStats = new int[] { 55, 15, 5, 3, 21, 26 };
//      break;
//    case 5: // Spider
//      eStats = new int[] { 30, 10, 0, 20, 26, 30 };
//      break;
//    }
//    pickName(eStats[4], eStats[5]);
//    left = "Attack";
//    right = "Defend";
//    return eStats;
//  }
//  public void roomDetailer(boolean chest) {
//    if (chest) {
//      chest();
//    } else {
//      type = int(random(3));
//      switch (type) {
//      case 0:
//        // Hallway
//        name = "Hallway";
//        left = "Foward";
//        right = "Backward";
//        break;
//      case 1:
//        name = "Door";
//        left = "Open";
//        right = "Leave";
//        break;
//      case 2:
//        name = "fork";
//        left = "Left";
//        right = "Right";
//        break;
//      }
//    }
//  }
//  public void chest() {
//    type = int(random(4));
//    switch (type) {
//    case 0:
//      name = "Bag of Gold";
//      break;
//    case 1:
//      name = "Small Chest";
//      break;
//    case 2:
//      name = "Large Chest";
//      break;
//    case 3:
//      name = "Splendid Chest";
//      break;
//    default:
//      System.out.println("Error creating chest card");
//    }
//    left = "Open";
//    right = "Leave";
//  }
//  // Takes an upper and lower bound for a random integer. That integer corresponds
//  // to which name is picked.
//  public void pickName(int up, int down) {
//    read = createReader("EnemyNames.txt");
//    String line = null;
//    try{
//      line = read.readLine();
//    } catch (IOException e) {
//      e.printStackTrace();
//    }
//    String[] names = split(line, ',');
//    int pick = int(random(down, up));
//    name = names[pick];
//  }
//  public void saveCard(){
//    Arraylist<String> info = new Arraylist<>(chest, type, right, left, name, peaceful);
//    if (!peaceful){
//      info.add(eStats[0]);
//    }
//    write = createWriter("CurrentCard.txt");
//    read = createReader("CurrentCard.txt");
//    write.print(chest+","+type+","+);
//  }
//}
