const values = [7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6];

//  Gets mode numbers in array
function get_mode() {
    console.time('code executed in');

    let frequency = [];

    let bgst_freq = 1;

    //  Count the frequency of each number using a for loop
    for (let i = 0; i < values.length; i++) {
        const num = values[i];
        frequency[num] = (frequency[num] || 0) + 1;
        if (frequency[num] > bgst_freq) {
            bgst_freq = frequency[num];
        }
    }
    
    // Find the numbers that have the highest frequency using a for loop
    const modes = [];
    const keys = Object.keys(frequency); // Get the keys of the frequency object
    for (let i = 0; i < keys.length; i++) {
        const num = keys[i];
        if (frequency[num] === bgst_freq) {
            modes.push(num);
        }
    }

    console.timeEnd('code executed in');

    console.log("Mode: " + modes.join(", "));
}

get_mode();
