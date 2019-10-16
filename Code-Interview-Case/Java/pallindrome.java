import java.util.Scanner;

public class pallindrome{
    public static void main(String[] args){
        /* Scanner initializing */
        Scanner in = new Scanner(System.in);

        System.out.println("Testing Pallindrome");
        System.out.println("Masukan Angka yang ingin di testing");
        int x = in.nextInt();

        int hasilmodulo,rev = 0;

        while(x!= 0){
            hasilmodulo = x%10;
            rev = (rev*10) + hasilmodulo;
            x = x/10;
        }

        if (rev == x){
            System.out.println("Pallindrome");
        } else {
            System.out.println("Non Pallindrome");
        }

        System.out.println("Angka yang telah di reverse adalah :" + rev);
    }
}