import fs from "fs";

function howMuchIsTheFuel2(input) {
  console.time("ThisFunction");

  // Read the data
  const fileInput = fs
    .readFileSync(input, err => {
      if (err) {
        console.log(err);
      }
    })
    .toString();

  // Divide line by line
  const lineInput = fileInput.split("\n");

  // init TotalFuel
  let totalFuel = 0;

  for (let index = 0; index < lineInput.length - 1; index++) {
    let totalCurrentFuel = 0;
    let currentFuel = Math.floor(lineInput[index] / 3) - 2;
    while (currentFuel >= 0) {
      totalCurrentFuel += currentFuel;
      currentFuel = Math.floor(currentFuel / 3) - 2;
    }
    totalFuel += totalCurrentFuel;
  }
  console.timeEnd("ThisFunction");
  return totalFuel;
}

export default howMuchIsTheFuel2;
