/* Membuat Pallindrome */

var x = 12321;
var rev = x.toString().split('').reverse().join('');
console.log(rev);

  if (rev == x.toString()) {
    console.log('Pallindrome');
  }else{
    console.log('Not a Pallindrome');
  }

