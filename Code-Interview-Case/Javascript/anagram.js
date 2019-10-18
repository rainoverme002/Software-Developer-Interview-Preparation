/* Anagram Javascript */

var x = ["dog", "ear", "pu", "egg", "god", "up", "ogd", "gge", "aer"];
var y = ["", "", "", "", "", "", "", "", ""];

for (i = 0; i < 9; i++) {
  var sorted = x[i]
    .split("")
    .sort()
    .join("");
  y[i] = sorted;
}
for (var i = 0; i < 9; i++) {
  for (var j = i + 1; j < 9; j++) {
    if (y[i] == y[j]) {
      var passingdatax = x[j];
      var passingdatay = y[j];
      var posisi = j;
      for (var n = posisi; n > i + 1; n--) {
        x[n] = x[n - 1];
        y[n] = y[n - 1];
      }
      x[i + 1] = passingdatax;
      y[i + 1] = passingdatay;
    }
  }
  console.log(x[i]);
}
