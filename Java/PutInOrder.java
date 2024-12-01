import java.text.DecimalFormat;

public class PutInOrder {
    public static void main(String[] args) {

        double startTime = System.nanoTime();

        double[] numbers = {-3.5, 2, 0, -1, 4.2, 7, -8, 5.5, 3, -2, 1.1, 6, -4, 8.8, 0.5, -6};

        for (int i = 0; i < numbers.length; i++) {
            double current = numbers[i];
            int j = i - 1;

            while (j >= 0 && numbers[j] > current) {
              numbers[j + 1] = numbers[j];
              j--;
            }

            numbers[j + 1] = current;
        }

        // Finally we can print the numbers in the ascending order
        for (int i = 0; i < numbers.length; i++) {
            System.out.println(numbers[i]);
        }

        double endTime = System.nanoTime();
        double duration = (endTime - startTime) / 1000000;  // get time in milliseconds.

        // Defines number of decimals, in this case, 3
        DecimalFormat df = new DecimalFormat("#.###");
        String formattedNum = df.format(duration);

        System.out.println("Execution time: " + formattedNum + " milliseconds");
    }
}
