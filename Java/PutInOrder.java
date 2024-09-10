import java.text.DecimalFormat;

public class PutInOrder {
    public static void main(String[] args) {

        double startTime = System.nanoTime();

        int[] numbers = {13, 5, 7, 200, 3, 9};

        for (int i = 0; i < numbers.length; i++) {
            int current = numbers[i];
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
