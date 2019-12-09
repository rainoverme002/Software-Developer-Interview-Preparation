/* Membuat Pallindrome */
var x = 12321;

function pallindrome_JSMasterApproach(x) {
  var rev = x
    .toString()
    .split("")
    .reverse()
    .join("");
  console.log(rev);

  if (rev == x.toString()) {
    console.log("Pallindrome");
  } else {
    console.log("Not a Pallindrome");
  }
}

console.log("JS Master Approach");
console.log(pallindrome_JSMasterApproach(x));
