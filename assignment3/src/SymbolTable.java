public class SymbolTable<K> {
    private HashTable<K> hashTable;

    public SymbolTable() {
        this.hashTable = new HashTable<>();
    }

    public HashTable<K> getHashTable() {
        return hashTable;
    }

    public void add(K t) {
        this.hashTable.insertNode(t);
    }

    public int search(K t) {
        return this.hashTable.searchPosition(t);
    }
}
