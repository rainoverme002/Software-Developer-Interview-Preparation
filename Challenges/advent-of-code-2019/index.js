import howMuchisTheFuel from "./Day1/howMuchIsTheFuel.js";
import howMuchisTheFuel2 from "./Day1/howMuchIsTheFuel2.js";
import programAlarm from "./Day2/programAlarm.js";
import programAlarm2 from "./Day2/programAlarm2.js";
import CrossedWires from "./Day3/CrossedWires.js";
import SecureContainer from "./Day4/SecureContainer.js";
import SecureContainer2 from "./Day4/SecureContainer2.js";

// Day 1
// Problem 1
const input1 = "./Day1/input1.txt";
console.log(howMuchisTheFuel(input1));
// Problem 2
console.log(howMuchisTheFuel2(input1));

// Day 2
// Problem 1
const input2 = "./Day2/input2.txt";
console.log(programAlarm(input2));
//Problem 2
console.log(programAlarm2(input2));
// answer :  noun = 80 & verb = 51 === 8051

// Day 3
// Problem 1 - Need Optimization
const wire1 = "./Day3/wire1.txt";
const wire2 = "./Day3/wire2.txt";
console.log(CrossedWires(wire1, wire2));

// Day 4
// Problem 1
const input = "271973-785961";
console.log(SecureContainer(input));
// Problem 2 - Still Wrong
console.log(SecureContainer2(input));
