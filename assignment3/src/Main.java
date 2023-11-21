import java.util.Scanner;

public class Main {

    public static void printMenu() {
        System.out.println("1 - Display the set of states");
        System.out.println("2 - Display the alphabet");
        System.out.println("3 - Display the transitions");
        System.out.println("4 - Display the initial state");
        System.out.println("5 - Display the final states");
        System.out.println("6 - Display if the given sequence is accepted by the DFA");
        System.out.println("0 - EXIT");
    }

    public static void finiteAutomataCases() {
        String file = "finiteautomata.txt";
        FiniteAutomata fa = new FiniteAutomata();
        fa.readFile(file);

        printMenu();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Input the number of your option:");
        String option = scanner.nextLine();
        while (option != "0") {
            switch (option) {
                case "0" -> {
                    return;
                }
                case "1" -> {
                    System.out.println("THE LIST OF STATES");
                    System.out.println(fa.getStates());
                }
                case "2" -> {
                    System.out.println("THE ALPHABET");
                    System.out.println(fa.getAlphabet());
                }
                case "3" -> {
                    System.out.println("THE TRANSITIONS");
                    System.out.println(fa.getTransitions());
                }
                case "4" -> {
                    System.out.println("THE INITIAL STATE");
                    System.out.println(fa.getInitialState());
                }
                case "5" -> {
                    System.out.println("THE FINAL STATES");
                    System.out.println(fa.getFinalStates());
                }
                case "6" -> {
                    System.out.println("Enter the sequence:");
                    String seq = scanner.nextLine();
                    System.out.println(fa.isAccepted(seq));
                }
            }
            System.out.println();
            printMenu();
            System.out.println("Input the number of your option:");
            option = scanner.nextLine();
        }


    }

    public static void main(String[] args) {
//        SymbolTable<String> symbolTable = new SymbolTable<>();
//
//        symbolTable.add("a");
//        symbolTable.add("b");
//        symbolTable.add("01");
//
//        System.out.println(symbolTable.searchPosition("a"));
//        System.out.println(symbolTable.searchPosition("b"));
//        System.out.println(symbolTable.searchPosition("01"));
//        System.out.println(symbolTable.searchByPosition(97));

        MyScanner s = new MyScanner("P3.txt");
        s.scan();

//        finiteAutomataCases();
    }
}
