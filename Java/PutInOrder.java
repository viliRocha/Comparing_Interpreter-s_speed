import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

import java.util.ArrayList;

import java.text.DecimalFormat;

public class PutInOrder {
    public static void main(String[] args) {

        double startTime = System.nanoTime();
        
        ArrayList<Double> numbers = new ArrayList<>();
        
        try {
            File txtFile = new File("./data/1000_nums.txt");
            Scanner rawContent = new Scanner(txtFile);
        
            while (rawContent.hasNextLine()) {
                String data = rawContent.nextLine().trim(); // Reads the line and removes extra spaces
                
                // Remove brackets
                data = data.replace("[", "").replace("]", "");

                // Splits the string into individual numbers using the comma as a separator
                String[] numberStrings = data.split(",");
                
                for (String numberString : numberStrings) {
                    double number = Double.parseDouble(numberString.trim()); // Remove spaces and converts
                    
                    numbers.add(number);
                }
            }
            rawContent.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred while reading file.");
            e.printStackTrace();
        }

        //  Actual insertion sort algorithm
        for (int i = 0; i < numbers.size(); i++) {
            double current = numbers.get(i);
            int j = i - 1;

            while (j >= 0 && numbers.get(j) > current) {
              numbers.set(j + 1, numbers.get(j));
              j--;
            }

            numbers.set(j + 1, current);
        }

        // Finally we can print the numbers in the ascending order
        for (int i = 0; i < numbers.size(); i++) {
            System.out.println(numbers.get(i));
        }

        double endTime = System.nanoTime();
        double duration = (endTime - startTime) / 1000000;  // get time in milliseconds.

        // Defines number of decimals, in this case, 3
        DecimalFormat df = new DecimalFormat("#.###");
        String formattedNum = df.format(duration);

        System.out.println("Execution time: " + formattedNum + " milliseconds");
    }
}