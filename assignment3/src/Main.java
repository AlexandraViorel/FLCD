public class Main {
    public static void main(String[] args) {
        SymbolTable<String> symbolTable = new SymbolTable<>();

        symbolTable.add("a");
        symbolTable.add("b");
        symbolTable.add("01");

        System.out.println(symbolTable.search("a"));
        System.out.println(symbolTable.search("b"));
        System.out.println(symbolTable.search("01"));
    }
}
