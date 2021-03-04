import fs from "fs";

function CrossedWires(input, input2) {
  console.time("ThisFunction");

  // Read the data from the file
  let fileInput = fs
    .readFileSync(input, err => {
      if (err) {
        console.log(err);
      }
    })
    .toString()
    .split(",");

  let fileInput2 = fs
    .readFileSync(input2, err => {
      if (err) {
        console.log(err);
      }
    })
    .toString()
    .split(",");

  // Init the coordinate;
  let coordinateWireOne = [0, 0];
  let coordinateWireTwo = [0, 0];

  // arrayToSave Result of position
  let arrayofSum1 = [];
  let arrayofSum2 = [];

  // Determine each position for wire 1
  for (let index = 0; index < fileInput.length - 1; index++) {
    // Init the currentInput 1 & 2 in this index
    const currentInput1 = fileInput[index];

    // Determine the Direction for both
    const direction1 = currentInput1[0];

    // Slice the array from index 1 to the end, so there is number only
    const position1 = parseInt(currentInput1.slice(1, currentInput1.length));

    if (direction1 === "U") {
      let counter = 0;
      while (counter < position1) {
        coordinateWireOne[0] += 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum1.push(coordinateWireOne.slice(0));
        counter++;
      }
    } else if (direction1 === "D") {
      let counter = 0;
      while (counter < position1) {
        coordinateWireOne[0] -= 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum1.push(coordinateWireOne.slice(0));
        counter++;
      }
    } else if (direction1 === "R") {
      let counter = 0;
      while (counter < position1) {
        coordinateWireOne[1] += 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum1.push(coordinateWireOne.slice(0));
        counter++;
      }
    } else if (direction1 === "L") {
      let counter = 0;
      while (counter < position1) {
        coordinateWireOne[1] -= 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum1.push(coordinateWireOne.slice(0));
        counter++;
      }
    }

    // push sum to array
    // .slice(0) make the array pass by value instead of pass by reference
    arrayofSum1.push(coordinateWireOne.slice(0));
  }

  // Determine each position for wire 2
  for (let index = 0; index < fileInput2.length - 1; index++) {
    // Init the currentInput 1 & 2 in this index
    const currentInput2 = fileInput2[index];

    // Determine the Direction for both
    const direction2 = currentInput2[0];

    // Slice the array from index 1 to the end, so there is number only
    const position2 = parseInt(currentInput2.slice(1, currentInput2.length));

    if (direction2 === "U") {
      let counter = 0;
      while (counter < position2) {
        coordinateWireTwo[0] += 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum2.push(coordinateWireTwo.slice(0));
        counter++;
      }
    } else if (direction2 === "D") {
      let counter = 0;
      while (counter < position2) {
        coordinateWireTwo[0] -= 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum2.push(coordinateWireTwo.slice(0));
        counter++;
      }
    } else if (direction2 === "R") {
      let counter = 0;
      while (counter < position2) {
        coordinateWireTwo[1] += 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum2.push(coordinateWireTwo.slice(0));
        counter++;
      }
    } else if (direction2 === "L") {
      let counter = 0;
      while (counter < position2) {
        coordinateWireTwo[1] -= 1;
        // push sum to array
        // .slice(0) make the array pass by value instead of pass by reference
        arrayofSum2.push(coordinateWireTwo.slice(0));
        counter++;
      }
    }
  }

  // Init answer var
  var distance = 1000000000000;
  // Check the cross wire
  for (let i = 0; i < arrayofSum1.length - 1; i++) {
    for (let j = 0; j < arrayofSum2.length - 1; j++) {
      if (
        JSON.stringify(arrayofSum1[i].join()) ==
        JSON.stringify(arrayofSum2[j].join())
      ) {
        const absoluteSum = Math.abs(arrayofSum1[i][0] + arrayofSum1[i][1]);
        if (absoluteSum < distance) {
          distance = absoluteSum;
        }
      }
    }
  }

  console.timeEnd("ThisFunction");
  return distance;
}

export default CrossedWires;
