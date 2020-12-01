package math_test;
/* File name : math.java */
public class math
{   
    public static void main(String[] args){

        /* Hello World Output */
        System.out.println("Hello World !");

        /* Initialize the object */
        operator coba = new operator();

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