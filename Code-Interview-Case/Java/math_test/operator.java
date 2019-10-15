package math_test;
/* File name : mathoperator.java */
public class operator{
    float result;
    public void add(int a, int b){
        result = a + b;
    }

    public void substract(int a, int b){
        result = a - b;
    }

    public void multiply(int a, int b){
        result = a * b;
    }

    public void divide(int a, int b){
        result = a / b;
    }

    public float get_result(){
        return result;
    }
}