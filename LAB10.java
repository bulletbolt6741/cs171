import java.util.Random;
import java.util.Scanner;

public class LAB10 {
    static Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        Q1();
        Q2();
        Q3();
        Q4();
        scan.close();
    }

    public static void Q1() {
        while (true) {
            System.out.println("Pick a shape: square, rectangle, circle (or 'q' to quit)");
            String input = scan.nextLine();
            if (input.equals("q")) {
                return;
            }

            if (input.equals("square")) {
                double a;
                System.out.println("Enter the length of side a: ");
                a = Double.parseDouble(scan.nextLine());
                System.out.println("The perimeter of the square is: " + a * 4);//Changed from circumference to perimeter for a square
                System.out.println("The area of the square is: " + a * a);

            } else if (input.equals("rectangle")) {
                double a, b;
                System.out.println("Enter the length of side a and b: ");// added the input of a and b into one string
                a = Double.parseDouble(scan.nextLine());
                b = Double.parseDouble(scan.nextLine());
                System.out.println("The perimeter of the rectangle is: " + (2 * a + 2 * b));//Changed from circumference to perimeter for a rectangle
                System.out.println("The area of the rectangle is: " + (a * b));
            } else if (input.equals("circle")) {
                double r;
                System.out.println("Enter the radius: ");
                r = Double.parseDouble(scan.nextLine());
                System.out.println("The circumference of the circle is: " + (Math.PI * r * 2));
                System.out.println("The area of the circle is: " + (Math.PI * r * r));
            }
        }
    }

    public static void Q2() {
        System.out.println("Q2: Enter the current day (1-31): ");
        int num = Integer.parseInt(scan.nextLine());
        System.out.println("Enter the current month: (1-12)");
        int num2 = Integer.parseInt(scan.nextLine());

        
        if((num==1)||(num==21)||(num==31)){
            System.out.println("You selected "+num+"st of ");
        }
        else if((num==2)||(num==22)){
            System.out.println("You selected "+num+"nd of ");
        }
        else if((num==3)||(num==23)){
            System.out.println("You selected "+num+"rd of ");
        }
       else if((num<=30)){
            System.out.println("You selected "+num+"th of ");
       }
        else {
            System.out.println("Invalid month");
        }
        

        if(num2 == 1) {
            System.out.println("January");
        } else if (num2 == 2) {
            System.out.println("February");
        } else if (num2 == 3) {
            System.out.println("March");
        } else if (num2 == 4) {
            System.out.println("April");
        } else if (num2 == 5) {
            System.out.println("May");
        } else if (num2 == 6) {
            System.out.println("June");
        } else if (num2 == 7) {
            System.out.println("July");
        } else if (num2 == 8) {
            System.out.println("Augst");
        } else if (num2 == 9) {
            System.out.println("September");
        } else if (num2 == 10) {
            System.out.println("October");
        } else if (num2 == 11) {
            System.out.println("November");
        } else if (num2 == 12) {
            System.out.println("December");
        } else {
            System.out.println("Invalid month");
        }
    }

public static void Q3() {
    System.out.println("Q3: Enter how many numbers you want to check for primality: ");
    int n = Integer.parseInt(scan.nextLine());
    int counter = 0;
    for (int i = 0; i < n; i++) {
    if (i < 2)
    continue;
    boolean check = true;

    for (int j = 2; j * j <= i; j++) {
    if (i % j == 0) {
    check = false;
    break;
    } else {

    }
    }
        if (check == true) {
        counter++;
        } 
        else {}
    }

        System.out.println("There are: " + counter + " primes between 0 and " + n);
    }

    public static void Q4() {
        Random rng = new Random();

        String next;
        System.out.println("Q4: Let's play a game. Type \"A\" to attack, \"B\" to buff your next attack. Kill the enemy to win!");
        System.out.println("Q4: You must roll higher than the enemy armor class (12) to hit. Roll 20 for a critical hit!");
        System.out.println("Q4: Your damage is 2-16 (2d8)");

        int enemyHP = 100;
        int a = 0;

        boolean check = false;
        while (true) {

            boolean doAttack = false;
            boolean check2 = false;
            while (!check2) {
                next = scan.nextLine();
                check2 = true;
                switch (next) {
                    case "A", "a":
                        doAttack = true;
                        break;
                    case "B", "b":
                        check = true;
                        System.out.println("Buffing! +5 to your next attack roll and damage");
                        break;
                    default:
                        System.out.println("Invalid input");
                        check2 = false;
                }
            }

            if (doAttack) {
                a++;
                int attackRoll = rng.nextInt(20) + 1;
                int damage = 0;
                System.out.print("You rolled: " + attackRoll);
                if(check) {
                    attackRoll += 5;
                    System.out.print(" + 5 (buff active)\n");
                } else {
                    System.out.println();
                }
                if (attackRoll >= 12) {
                    damage = rng.nextInt(8) + 1;
                    damage += rng.nextInt(8) + 1;
                    if(check) {
                        damage += 5;
                    }
                    if (attackRoll == 20 || (check && attackRoll == 20 + 5)) {
                        damage *= 2;
                        System.out.print("Critical hit! ");
                    }
                    System.out.print("You dealt " + damage + " damage");
                    if(check) {
                        System.out.print(" (buffed attack)");
                    }
                    enemyHP -= damage;
                    System.out.println("\nEnemy HP: " + Math.max(0, enemyHP));

                } else {
                    System.out.println("Miss");
                }

                check = false;
                if (enemyHP <= 0) {
                    System.out.println("Enemy died in " + a + " turns");
                    scan.close();
                    return;
                }
            }

        }
    }
}
