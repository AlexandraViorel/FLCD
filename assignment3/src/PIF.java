import java.util.ArrayList;

public class PIF {
    private ArrayList<Pair<String, Integer>> pifList = new ArrayList<>();

    public PIF() {
        this.pifList = new ArrayList<>();
    }

    public void addToPifList(Pair<String, Integer> p) {
        this.pifList.add(p);
    }

    public int length() {
        return this.pifList.size();
    }

    public Pair<String, Integer> get(int position) {
        return this.pifList.get(position);
    }
}
