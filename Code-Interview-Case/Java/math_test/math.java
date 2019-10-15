class math{
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
public class hello
{   
    public static void main(String[] args){

        /* Hello World Output */
        System.out.println("Hello World !");

        /* Initialize the object */
        math coba = new math();

        /* Call the addition method*/
        coba.add(1,2);
        coba.get_result();
        System.out.println("Result is : " + coba.result);

        /* Call the substract method*/
        coba.substract(1,2);
        coba.get_result();
        System.out.println("Result is : " + coba.result);

        /* Call the multiply method*/
        coba.multiply(1,2);
        coba.get_result();
        System.out.println("Result is : " + coba.result);

        /* Call the divide method*/
        coba.divide(1,2);
        coba.get_result();
        System.out.println("Result is : " + coba.result);
    }
}