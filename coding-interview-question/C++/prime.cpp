#include<iostream>
#include<cstdlib>
#include<cmath>

using namespace std;

int main(){

    int N;

    cout<<"Masukan Banyaknya Bilangan Prima yang ingin ditampilkan"<<endl;
    cin >> N;

    int counter = 0, x = 1;

    while(counter!=N){

        if(x%2!=0){
            cout<<x<<endl;
            counter+=1;
        }    
        x+=1;   
    }
}