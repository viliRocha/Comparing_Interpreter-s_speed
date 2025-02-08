import { readFileSync } from "fs";

const content = readFileSync("./data/50_nums.txt", "utf-8");

function put_in_order(nums) {
  console.time('code executed in');
        
  for (let i = 1; i < nums.length; i++) {
    let current = nums[i];
    let j = i - 1;
        
    while (j >= 0 && nums[j] > current) {
      nums[j + 1] = nums[j];
      j--;
    }
        
    nums[j + 1] = current;
  }
  console.timeEnd('code executed in');

  return nums;
}

// Converts the file content (string) to an array
const numsArray = content
  .replace("[", "")
  .replace("]", "")
  .split(",")
  .map(num => parseFloat(num.trim()));

console.log(put_in_order(numsArray));