import java.util.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

interface EnemyInterface {
	int[] enemyDetailer(int cardType);

	void pickName(int up, int down);
}

interface RoomInterface {
	void roomDetailer(boolean a);

	void chest();
}

public class Card implements EnemyInterface, RoomInterface {
	// Make rand
	protected static Random rand = new Random();

	// Create variables
	public boolean chest = false;
	private int cardType = 0;
	public String cardRight = null, cardLeft = null;
	public String cardName = null;
	public boolean peaceful = true;
	public int[] eStats;

	// Initialize Interface variables

	// Empty Constructor
	public Card() {
	}

	// Full Constructor
	public Card(String name, int type) {
		this.cardName = name;
		this.cardType = type;
	}

	// Randomly picks the next card
	public void pickCardType(int cardType) {
		switch (cardType) {
		case 0:
			// make random card
			pickCardType(rand.nextInt(1, 4));
			break;
		case 1:
			// make enemy card
			peaceful = false;
			cardType = rand.nextInt(6);
			enemyDetailer(cardType);
			break;
		case 2:
			// make room card
			chest = false;
			peaceful = true;
			roomDetailer(chest);
			break;
		case 3:
			// make chest card
			chest = true;
			peaceful = true;
			roomDetailer(chest);
			break;
		default:
			break;
		}
	}

	/*
	 * Assigns stats to an enemy Order is HP, ATK, MGC, SPD The final two items are
	 * the UPPER and LOWER bounds for picking the card name.
	 */
	public int[] enemyDetailer(int type) {
		eStats = new int[] { 0, 0, 0, 0, 0, 0 };
		cardType = type;
		switch (type) {
		case 0: // Skeleton
			eStats = new int[] { 30, 10, 5, 10, 0, 5 };
			break;
		case 1: // Zombie
			eStats = new int[] { 25, 10, 0, 7, 5, 11 };
			break;
		case 2: // Slime
			eStats = new int[] { 40, 5, 0, 0, 11, 16 };
			break;
		case 3: // Rats
			eStats = new int[] { 40, 5, 0, 10, 16, 21 };
			break;
		case 4: // Giant
			eStats = new int[] { 55, 15, 5, 3, 21, 26 };
			break;
		case 5: // Spider
			eStats = new int[] { 30, 10, 0, 20, 26, 30 };
			break;
		}
		pickName(eStats[4], eStats[5]);
		cardLeft = "Attack";
		cardRight = "Defend";
		return eStats;
	}

	public void roomDetailer(boolean chest) {
		if (chest) {
			chest();
		} else {
			cardType = rand.nextInt(3);
			switch (cardType) {
			case 0:
				// Hallway
				cardName = "Hallway";
				cardLeft = "Foward";
				cardRight = "Backward";
				break;
			case 1:
				cardName = "Door";
				cardLeft = "Open";
				cardRight = "Leave";
				break;
			case 2:
				cardName = "fork";
				cardLeft = "Left";
				cardRight = "Right";
				break;
			}
		}
	}

	public void chest() {
		cardType = rand.nextInt(4);
		switch (cardType) {
		case 0:
			cardName = "Bag of Gold";
			break;
		case 1:
			cardName = "Small Chest";
			break;
		case 2:
			cardName = "Large Chest";
			break;
		case 3:
			cardName = "Splendid Chest";
			break;
		default:
			System.out.println("Error creating chest card");
		}
		cardLeft = "Open";
		cardRight = "Leave";
	}

	// Takes an upper and lower bound for a random integer. That integer corresponds
	// to which name is picked.
	public void pickName(int up, int down) {
		Random rand = new Random();
		String dir = System.getProperty("user.dir");
		File file = new File(dir + "//EnemyNames.txt");
		if (file.exists()) {
			try {
				BufferedReader br = new BufferedReader(new FileReader(file));
				String str;
				while ((str = br.readLine()) != null) {
					String[] names = str.split(",");
					int pick = rand.nextInt(up, down);
					cardName = names[pick];
				}
				br.close();
			} catch (IOException e) {
				System.out.println("Error finding/reading file (Enemy)");
			}
		} else {
			System.out.println("Please place 'EnemyNames.txt' from src into folder");
		}
	}

	public void displayCard() {
		// PLACEHOLDER -- WILL BE PLACED INTO PROCESSING
		System.out.println("\n\nCard Name: " + cardName + "\nOptions (Left, Right):\n" + cardLeft + "\n" + cardRight);

	}

	public int cardLeft() {
		// All the positive commands
		switch (cardLeft) {
		case "Foward":
			return 1;
		case "Open":
			return 2;
		case "Yes":
			return 3;
		case "Left":
			return 4;
		default:
			return 0;
		}
	}

	public int cardRight() {
		switch (cardRight) {
		case "Backward":
			return 1;
		case "Leave":
			return 2;
		case "No":
			return 3;
		case "Right":
			return 4;
		default:
			return 0;
		}
	}

	public void saveCard() {
		String dir = System.getProperty("user.dir");
		File file = new File(dir + "//CurrentCard.txt");
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				System.out.println("Uh-oh, Error creating card file.");
			}
		}
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(file));
			bw.write(cardType + "\n" + cardName + "\n" + cardLeft + "\n" + cardRight + "\n" + peaceful);
			if (!peaceful) {
				for (int i = 0; i < eStats.length; i++) {
					bw.write(eStats[i] + ",");
				}
			}
			bw.close();
		} catch (Exception e) {
			System.out.println("Uh-oh, Error writing progress");
		}
	}

	public void lastCard() {
		String dir = System.getProperty("user.dir");
		File file = new File(dir + "//CurrentCard.txt");
		String str;
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			//String line32 = Files.readAllLines(Paths.get("file.txt")).get(32);
			cardType = Integer.parseInt(Files.readAllLines(Paths.get("CurrentCard.txt")).get(0));
			cardName = Files.readAllLines(Paths.get("CurrentCard.txt")).get(1);
			cardLeft = Files.readAllLines(Paths.get("CurrentCard.txt")).get(2);
			cardRight = Files.readAllLines(Paths.get("CurrentCard.txt")).get(3);
			peaceful = Boolean.parseBoolean(Files.readAllLines(Paths.get("CurrentCard.txt")).get(4));
			if (!peaceful) {
				while ((str = br.readLine()) != null) {
					String[] stats = str.split(",");
					for (int i = 4; i < stats.length; i++) {
						eStats[i] = Integer.parseInt(stats[i]);
					}
				}
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
