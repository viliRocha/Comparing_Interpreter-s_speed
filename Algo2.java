import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Algo2 {
    public static List<Integer> get_mode(int[] mod) {
        int[] frequency = new int[mod.length];
        int bgst_freq = 1;
        
        List<Integer> mode_vals = new ArrayList<>();
        
        for (int i = 0; i < mod.length; i++) {
            int num = mod[i];

            if (frequency[num] != 0) {
                frequency[num] += 1;
            }
            else {
                frequency[num] = 1;
            }

            if (frequency[num] > bgst_freq) {
                bgst_freq = frequency[num];
            }
        }
    
        for (int num = 0; num < frequency.length; num++) {
            if (frequency[num] == bgst_freq) {
                mode_vals.add(num);
            }
        }
        
        return mode_vals;
    }
    
    public static void main(String args[]) {
        int[] values = {200, 13, 5, 7, 13, 200, 3, 9, 200, 13};
        
        List<Integer> modes = get_mode(values);
        String modeString = modes.stream()
                                 .map(String::valueOf)
                                 .collect(Collectors.joining(", "));
        System.out.println("Mode: " + modeString);
    }
}
