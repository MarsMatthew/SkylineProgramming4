import java.util.*;
import java.io.*;

/*
 * Main
 * 
 * Made by Matthew Sorensen
 */

public class Main {
	// Order is HP, ATK, MGC, SPD, GOLD
	static int[] plyrStats = { 50, 10, 10, 10, 0 };
	static boolean firstTime = false;
	static boolean alive = true;
	public static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {

		String dir = System.getProperty("user.dir");
		File file = new File(dir + "//GameProgress.txt");
		Card card = new Card(null, 0);
		Random rand = new Random();

		displayMain();
		// Add functionality in processing for buttons
		switch (input()) {
		/*
		 * Credits
		 */
		case 0:
			System.out.println(
					"Made by: Matthew Sorensen\nInspiration: Reigns by Devolver Digital\nFor: Year 2 Programming project");
			break;
		/*
		 * New Game
		 */
		case 1:
			saveProgress(file);
			if (firstTime) {
				print("(Placeholder tutorial)\nTip a card left or right to select options.\nThe object of the game is to get as far as possible",
						30);
			}
			break;
		/*
		 * Continue Game
		 */
		case 2:
			try {
				readProgress(file);
			} catch (Exception e) {
				System.out.println("Error reading progress... uh oh!");
			}
			break;
		default:
			System.out.println("Failed to understand input");
		}
		/*
		 * Make first card
		 */
		card.pickCardType(0);
		/*
		 * Game Loop
		 */
		while (alive) {
			if (!card.peaceful) {
				combat(card, rand);
			} else {
				card.displayCard();
				switch (input("Left or Right")) {
				case 'l':
					switch (card.cardLeft()) {
					case 1:
						card.saveCard();
						break;
					case 2:
						if (card.chest) {
							int goldGot = rand.nextInt(0, 26);
							print("You got " + goldGot + " gold", 30);
						}
						card.saveCard();
						card.pickCardType(0);
						break;
					case 3:
						// PlaceHolder
						break;
					case 4:
						card.saveCard();
						card.pickCardType(0);
						break;
					}
				case 'r':
					switch (card.cardRight()) {
					case 1:
						card.lastCard();
						break;
					case 2:
						card.lastCard();
						break;
					case 3:
						// PlaceHolder
						break;
					case 4:
						card.saveCard();
						card.pickCardType(0);
						break;
					}
				}
			}
			clear();
			saveProgress(file);
		}
		// End loop
		alive = false;
		scan.close();
	}

	public static void displayMain() {
		// Add functionality in processing
		// Print statements for now
		System.out.println("Enter 0 for credits, Enter 1 to make a new game, Enter 2 to continue a saved game");
	}

	public static void saveProgress(File file) {
		// Check if the save file exists. If not, create a new file
		if (!file.exists()) {
			try {
				firstTime = true;
				file.createNewFile();
			} catch (IOException e) {
				System.out.println("Uh-oh, Error creating save file.");
			}
		}
		// Save the player information in the file
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(file));
			for (int i = 0; i < plyrStats.length; i++) {
				bw.write(plyrStats[i] + ",");
			}
			bw.close();
		} catch (Exception e) {
			System.out.println("Uh-oh, Error writing progress");
		}
	}

	// Save the player progress from the file into the game
	public static void readProgress(File read) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(read));
		String str;
		while ((str = br.readLine()) != null) {
			String[] stats = str.split(",");
			for (int i = 0; i < stats.length; i++) {
				plyrStats[i] = Integer.parseInt(stats[i]);
			}
		}
		br.close();
	}

	/*
	 * TO DO: MAKE THE COMBAT HAVE MORE UNIQUE MESSAGES MAKE THE DEFENSE HAVE MORE
	 * INTERESTING EFFECTS
	 */
	public static void combat(Card card, Random rand) {
		boolean mgcDef = false, spdAdv = false;
		int dmgTaken = 0, dmgDealt = 0, dodge = 0;
		// Start combat
		print("\nSomething jumps out at you!", 30);
		// Check if the enemy is faster than the player
		card.displayCard();
		if (plyrStats[3] >= card.eStats[3]) {
			spdAdv = true;
		}
		switch (input("Continue (Left) Help (Right)")) {
		case 'r':
			print("\nMagic has a random chance of succeding, but on success, you avoid the attack entirely\nand gain a temporary increase in damage equal to your magic strength.\nDodging is always a success, but you only avoid up to 70% of the damage.\nHowever, you gain a temporary increase in damage qual to your speed",
					10);
			break;
		}
		// Order is HP, ATK, MGC, SPD
		// Game loop
		while (plyrStats[0] > 0 && card.eStats[0] > 0) {
			if (spdAdv && !mgcDef) {
				print("\nThe enemy attacks first!", 30);
				dmgTaken = card.eStats[1] - dodge;
				print("\nYou take " + dmgTaken + " damage", 30);
				plyrStats[0] -= dmgTaken;
				print("\nYou are now at " + plyrStats[0] + " hp", 30);
			}
			switch (input("\nAttack (Left) or Defend (Right)")) {
			case 'l':
				dmgDealt = plyrStats[1];
				if (mgcDef) {
					dmgDealt += plyrStats[2];
					print("\nYour magic shield increases your damage! ", 30);
				} else if (dodge > 0) {
					dmgDealt += dodge;
					print("\nYour dodge increases your damage! ", 30);
				}
				print("\nYou attack, dealing " + dmgDealt + " damage", 30);
				card.eStats[0] -= dmgDealt;
				dodge = 0;
				mgcDef = false;
				break;
			case 'r':
				switch (input("\nUse magic to defend (Left), or dodge out of the way (Right)")) {
				case 'l':
					if (rand.nextInt(0, (plyrStats[2]) + 1) > (plyrStats[2] / 2)) {
						mgcDef = true;
						print("\nYou gain a magic shield to protect you", 30);
					} else {
						print("\nYour magical charm fails to protect you", 30);
					}
					break;
				case 'r':
					print("You dodge out of the way", 30);
					dodge = (rand.nextInt(0, plyrStats[3] + 1));
					break;
				}
			}
			if (!spdAdv && !mgcDef) {
				print("\nThe enemy attacks!", 30);
				dmgTaken = card.eStats[1] - dodge;
				print("\nYou take " + dmgTaken + " damage", 30);
				plyrStats[0] -= dmgTaken;
				print("\nYou are now at " + plyrStats[0] + " hp", 30);
			}
			clear();
		}
		// Who died?
		if (plyrStats[0] <= 0) {
			print("Game Over! ", 30);
			alive = false;
		} else if (card.eStats[0] <= 0) {
			print("\n You've slain the enemy!", 30);
			card.pickCardType(0);
		}
	}

	// Method that prints something slowly
	// To be removed
	public static void print(String text, int time) {
		for (int i = 0; i < text.length(); i++) {
			char c = text.charAt(i);
			System.out.print(c);
			try {
				Thread.sleep(time);
			} catch (Exception e) {
			}
		}
	}

	// Methods that will take the user input because I was too lazy to write it
	// multiple times :/
	// To be removed when moved into processing
	public static char input(String question) {
		print(question, 30);
		char out = 'n';
		out = scan.next().toLowerCase().charAt(0);
		return out;
	}

	public static int input() {
		int out = scan.nextInt();
		return out;
	}

	// Finds the clear command that the os uses, then clears the console (Only works
	// in a terminal)
	// Will be removed when put into processing
	static void clear() {
		try {
			new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
		} catch (Exception IOException) {
			System.out.println("oh no... uh.. ignore this msg!!");
		}
	}
}