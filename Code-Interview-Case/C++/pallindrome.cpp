#include <iostream>
#include <cmath>
#include <algorithm>

using namespace std;

int main(){
    
    int x, hasilmodulo,number;
    int rev = 0;

    cout << "Please insert your number for pallindrome check" <<endl;
    cin >> x;

    number = x;

    do {
        hasilmodulo = number % 10;
        rev = (rev * 10) + hasilmodulo;
        number = number/10;
    } while (number != 0);
    
    cout << rev << endl;

    if(rev == x){
        cout << "Yes It is Palindrome" <<endl;
    } else {
        cout << "Not a Pallindrome" <<endl;
    }
    system("pause");
    return 0;
}