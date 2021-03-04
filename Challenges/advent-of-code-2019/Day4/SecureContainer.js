function SecureContainer(input) {
  console.time("ThisFunction");

  const arrayOfInput = input.split("-");
  const lowBoundary = parseInt(arrayOfInput[0]);
  const highBoundary = parseInt(arrayOfInput[1]);
  let currentNumber = lowBoundary;
  let counter = 0;
  let steps = 1;
  let adjacent = false;
  let alwaysIncrease = true;

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

    if (alwaysIncrease == true && adjacent == true) {
      counter++;
    }
    currentNumber++;
    steps++;
    alwaysIncrease = true;
    adjacent = false;
  }
  console.timeEnd("ThisFunction");
  return counter;
}

export default SecureContainer;
