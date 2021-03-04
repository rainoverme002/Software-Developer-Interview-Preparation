import fs from "fs";

function programAlarm2(input) {
  console.time("ThisFunction");

  // Read the data
  let fileInput = fs
    .readFileSync(input, err => {
      if (err) {
        console.log(err);
      }
    })
    .toString()
    .split(",")
    .map(function(item) {
      return parseInt(item);
    });

  let index = 0;

  fileInput[index + 1] = 80;
  fileInput[index + 2] = 51;

  while (fileInput[index] != 99) {
    let firstValue = fileInput[fileInput[index + 1]];
    let secondValue = fileInput[fileInput[index + 2]];
    let thirdValue = fileInput[index + 3];

    if (fileInput[index] === 1) {
      fileInput[thirdValue] = firstValue + secondValue;
    } else if (fileInput[index] === 2) {
      fileInput[thirdValue] = firstValue * secondValue;
    }

    index += 4;
  }

  console.timeEnd("ThisFunction");
  return fileInput[0];
}

export default programAlarm2;
