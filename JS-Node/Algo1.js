import { readFileSync } from "fs";

// Start measuring total time including file import
console.time('Total execution time');

const content = readFileSync("./data/1000_nums.txt", "utf-8");

// Function to sort numbers in ascending order
function put_in_order(nums) {
  console.time('Sorting time');
  
  for (let i = 1; i < nums.length; i++) {
    let current = nums[i];
    let j = i - 1;
    
    while (j >= 0 && nums[j] > current) {
      nums[j + 1] = nums[j];
      j--;
    }
    
    nums[j + 1] = current;
  }
  
  console.timeEnd('Sorting time');
  return nums;
}

// Converts the file content (string) to an array
const numsArray = content
  .replace("[", "")
  .replace("]", "")
  .split(",")
  .map(num => parseFloat(num.trim()));

// Call the sorting function and log the result
console.log(put_in_order(numsArray));

// End measuring total time
console.timeEnd('Total execution time');
