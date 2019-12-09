// Check if there is any value in array 1 that === value in array 2
const array1 = ["a", "b", "c", "d"];
const array2 = ["x", "y", "z"];

// Naive Approach

function arr1HasValueinArr2_naive(arr1, arr2) {
  for (let i = 0; i < arr1.length; i++) {
    for (let j = 0; j < arr2.length; j++) {
      if (arr1[i] === arr2[j]) {
        return true;
      }
    }
  }
  return false;
}
// O(a*b) because two arrays have different length
console.log("naiveApproach");
console.log(arr1HasValueinArr2_naive(array1, array2));

// Optimized Approach - Change array into object

function arr1HasValueinArr2_optimizedObject(arr1, arr2) {
  // looping through the array 1 and change it into the object
  // const map = {
  // a: true
  // b: true
  // c: true
  // }
  let tally = {};
  for (let i = 0; i < arr1.length; i++) {
    if (!tally[arr1[i]]) {
      const item = arr1[i];
      tally[item] = true;
    }
  }

  // lopping through the object to know is array2 value is in the object
  for (let i = 0; i < arr2.length; i++) {
    if (tally[arr2[i]]) {
      return true;
    }
  }

  return false;
}

// O(a+b)

console.log("Optimized Object");
console.log(arr1HasValueinArr2_optimizedObject(array1, array2));

// JavaScript Master Approach

function arr1HasValueinArr2_JSMasterApproach(arr1, arr2) {
  return arr1.some(result => arr2.includes(result));
}

console.log("JS Master Approach");
console.log(arr1HasValueinArr2_JSMasterApproach(array1, array2));
