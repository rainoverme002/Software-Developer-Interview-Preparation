#include <string> 
#include <iostream>
#include <algorithm>

using namespace std;

int main (){

    string x[9] = {"dog","ear", "pu", "egg", "god", "up","ogd","gge","aer"};

    string y[9];

    cout << "Sebelum di sorting" << endl;

    for (int i=0; i<9; i++)
    {   
        cout << x[i] << endl;
    }

    cout << "Setelah di sorting" << endl;

    for (int i=0; i<9; i++)
    {   
        y[i] = x[i];
        sort(y[i].begin(),y[i].end());

        cout << y[i] << endl;
    }

    cout << "Hasil Anagram" << endl;

    for (int i=0; i<9; i++)
    {
        for (int j=i+1; j<9; j++){
            if (y[i] == y[j]) {
                string passingdatax = x[j];
                string passingdatay = y[j];
                int posisi = j;
                for (int n = posisi; n > i+1; n--){  
                    x[n] = x[n-1];
                    y[n] = y[n-1];
                }
                x[i+1] = passingdatax;
                y[i+1] = passingdatay;
            }
        }
     cout << x[i] << endl;
    }
    system("pause");
    return 0;
}
