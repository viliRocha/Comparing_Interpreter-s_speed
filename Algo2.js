let values = [7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6];

//Gets mode numbers in array
function get_mode(mod) {
    console.time('code executed in');

    let frequency = [];

    let bgst_freq = 1;

    const mode_vals = [];

    for (let i = 0; i < mod.length; i++) {
        let num = mod[i];

        if (frequency[num]) {
            frequency[num] += 1;
        }
        else {
            frequency[num] = 1;
        }

        if (frequency[num] > bgst_freq) {
            bgst_freq = frequency[num];
        }
    }
    for (let num in frequency) {
            if (frequency[num] === bgst_freq) {
                mode_vals.push(parseFloat(num));
            }
        }

    console.timeEnd('code executed in');

    return (mode_vals.join(', '));
}

console.log('Mode:', get_mode(values));
