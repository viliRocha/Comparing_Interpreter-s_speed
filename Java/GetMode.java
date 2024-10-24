import java.util.ArrayList;
import java.util.HashMap;
import java.text.DecimalFormat;

public class GetMode {
    public static void main(String[] args) {
        double[] values = {7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6};
        System.out.println("Mode: " + getMode(values));
    }

    // Gets mode numbers in array
    public static String getMode(double[] mod) {
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