#include <cmath>
#include <iostream>

using namespace std;

int addition(int a, int b){
    
    return a + b;
}

int substraction(int a, int b){
    return a - b;
}

int multiplication(int a, int b){
    return a*b;
}

int division(int a, int b){
    return a/b;
}

int main(){
    
    int a = 2;
    int b = 5;
    
    int c = addition(a,b);
    
    cout<<a<<" + "<<b<<" = "<<c<<endl;
        
    c = substraction(a,b);
    
    cout<<a<<" - "<<b<<" = "<<c<<endl;
    
    c = multiplication(a,b);
    
    cout<<a<<" * "<<b<<" = "<<c<<endl;
    
    c = division(a,b);
    
    cout<<a<<" / "<<b<<" = "<<c<<endl;

    
}