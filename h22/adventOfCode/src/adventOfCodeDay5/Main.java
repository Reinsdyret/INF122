package adventOfCodeDay5;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) throws FileNotFoundException {
    
		
		File inputFile = new File("day5Input.txt");
		Scanner sc = new Scanner(inputFile);
		
		List<String> setupLines = new ArrayList<>();
		
		String line = sc.nextLine();
		
		while(line != "") {
			setupLines.add(line);
			if(sc.hasNext()) line = sc.nextLine();
			else break;
		}
		
		String[] numberLine = setupLines.get(setupLines.size()-1).strip().split("   ");
		int numberOfCrates = Integer.valueOf(numberLine[numberLine.length-1]);
		
		setupLines.remove(setupLines.size()-1);
		
		List<CrateStack> crateStacks = new ArrayList<>();
		// init stacks
		for(int i = 0; i<numberOfCrates; i++) crateStacks.add(new CrateStack());
		
		// add all crates
		for(int i = setupLines.size()-1; i>=0; i--) {
			line = setupLines.get(i);
			// Skipping every fourth to get letters or nothing
			int p = 0;
			for(int j = 1; j < line.length(); j += 4) {
				if(line.charAt(j) == ' ') {
					p+=1;
					continue;
				}
				Crate crate = new Crate(line.charAt(j));
				crateStacks.get(p).addCrate(crate);
				p+=1;
			}
		}
		
		while(sc.hasNext()) {
			line = sc.nextLine();
			String[] words = line.split(" ");
			int nCrates = Integer.valueOf(words[1]);
			CrateStack stackFrom = crateStacks.get(Integer.valueOf(words[3]) - 1);
			CrateStack stackTo = crateStacks.get(Integer.valueOf(words[5]) - 1);
			List<Crate> crates = stackFrom.removeCrates(nCrates);
			stackTo.addCrates(crates);
		}
		
		// Write out top letter of each stack
		String letters = "";
		for(CrateStack cs : crateStacks) {
			letters += cs.topCrate();
		}
		
		System.out.println(letters);
		
	}

}
