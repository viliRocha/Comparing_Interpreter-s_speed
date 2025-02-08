import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

import java.util.ArrayList;

import java.util.ArrayList;
import java.util.HashMap;
import java.text.DecimalFormat;

public class GetMode {
    public static void main(String[] args) {
        ArrayList<Double> values = new ArrayList<>();
        
        try {
            File txtFile = new File("test.txt");
            Scanner rawContent = new Scanner(txtFile);
        
            while (rawContent.hasNextLine()) {
                String data = rawContent.nextLine().trim(); // Reads the line and removes extra spaces
                
                // Remove brackets
                data = data.replace("[", "").replace("]", "");

                // Splits the string into individual numbers using the comma as a separator
                String[] numberStrings = data.split(",");
                
                for (String numberString : numberStrings) {
                    double number = Double.parseDouble(numberString.trim()); // Remove spaces and converts
                    
                    values.add(number);
                }
            }
            rawContent.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred while reading file.");
            e.printStackTrace();
        }
        
        System.out.println("Mode: " + getMode(values));
    }

    // Gets mode numbers in array
    public static String getMode(ArrayList<Double> mod) {
        long startTime = System.nanoTime();

        HashMap<Double, Integer> frequency = new HashMap<>();
        int bgstFreq = 1;
        ArrayList<Double> modeVals = new ArrayList<>();

        for (double num : mod) {
            frequency.put(num, frequency.getOrDefault(num, 0) + 1);
            bgstFreq = Math.max(bgstFreq, frequency.get(num));
        }

        for (Double num : frequency.keySet()) {
            if (frequency.get(num) == bgstFreq && !modeVals.contains(num)) {
                modeVals.add(num);
            }
        }

        long endTime = System.nanoTime();
        double duration = (endTime - startTime) / 1000000.00;  // get time in milliseconds.

        // Defines number of decimals, in this case, 3
        DecimalFormat df = new DecimalFormat("#.###");
        String formattedNum = df.format(duration);
        System.out.println("Code executed in: " + formattedNum + " ms");

        return String.join(", ", modeVals.stream().map(String::valueOf).toArray(String[]::new));
    }
}