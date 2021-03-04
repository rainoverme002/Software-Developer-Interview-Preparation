function SecureContainer2(input) {
  console.time("ThisFunction");

  const arrayOfInput = input.split("-");
  const lowBoundary = parseInt(arrayOfInput[0]);
  const highBoundary = parseInt(arrayOfInput[1]);
  let currentNumber = lowBoundary;
  let counter = 0;
  let steps = 1;
  let adjacent = false;
  let alwaysIncrease = true;
  let arePartLargeGroup = false;

  // Brute Force

  while (currentNumber <= highBoundary) {
    //
    const currentNumberString = currentNumber.toString();
    //Check if there value always increasing
    for (let index = 0; index < currentNumberString.length - 1; index++) {
      if (
        parseInt(currentNumberString[index]) >
        parseInt(currentNumberString[index + 1])
      ) {
        alwaysIncrease = false;
      }
    }
    //Check if there value adjacent
    for (let index = 0; index < currentNumberString.length - 1; index++) {
      if (
        currentNumberString[index] == currentNumberString[index + 1] &&
        currentNumberString[index] != currentNumberString[index + 2]
      ) {
        adjacent = true;
      }
    }

    //Check if there value arePartLargeGroup
    for (let index = 0; index < currentNumberString.length - 2; index++) {
      if (
        currentNumberString[index] == currentNumberString[index + 2] &&
        currentNumberString[index] == currentNumberString[index + 1]
      ) {
        arePartLargeGroup = true;
      }
    }
    if (
      alwaysIncrease == true &&
      adjacent == true &&
      arePartLargeGroup == false
    ) {
      counter++;
    }
    currentNumber++;
    steps++;
    alwaysIncrease = true;
    adjacent = false;
    arePartLargeGroup = false;
  }
  console.timeEnd("ThisFunction");
  return counter;
}

export default SecureContainer2;
