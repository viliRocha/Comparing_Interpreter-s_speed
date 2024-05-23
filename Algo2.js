let values = [7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6];

//Gets mode numbers in array
function get_mode(mod) {
    console.time('code executed in');

    let frequency = [];

    let bgst_freq = 1;

    let mode_vals = [];

    for (let i = 0; i < mod.length; i++) {
        for(let c = 0; c < mod.length; c++) {
            if(mod[i] === mod[c]) {
                // Null, undefined, etc = false
                // If has value = true
                if(frequency[i]) {
                    frequency[i][0] = mod[i];

                    frequency[i][1] += 1;
                }
                else {
                    frequency.push([mod[i], 1]);
                }

                if (frequency[i][1] > bgst_freq) {
                    bgst_freq = frequency[i][1];
                }
            }
        }
        //console.log(frequency[i]);
        //console.log(bgst_freq);
    }
        
        for (let num in frequency) {
            if (frequency[num][1] === bgst_freq/* && frequency[num][0] != mode_vals[num]*/) {
                mode_vals.push(parseFloat(frequency[num][0]));

                console.log(mode_vals[num]);
            }
        }

    console.timeEnd('code executed in');

    return (mode_vals.join(', '));
}

console.log('Mode:', get_mode(values));
