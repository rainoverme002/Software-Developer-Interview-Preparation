#include <iostream>
#include <cmath>
#include <cstdlib>

using namespace std;

int main(){
    int N;

    cout<<"Masukan Jumlah Deret Fibonacci yang diinginkan"<<endl;
    cin>>N;

    int a[N];
    int b = 0;
    a[0] = b;

    for (int i=0; i<N; i++){
        if (i==0){
            a[i+1] = a[i] + 1;}
        else{
            a[i+1] = a[i] + a[i-1];
        }
        cout<<a[i]<<endl;
    }
}