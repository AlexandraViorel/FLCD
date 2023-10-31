import java.util.ArrayList;

public class PIF {
    private ArrayList<Pair> pifList = new ArrayList<>();

    public PIF() {
        this.pifList = new ArrayList<>();
    }

    public void addToPifList(Pair p) {
        this.pifList.add(p);
    }

    public int length() {
        return this.pifList.size();
    }

    public Pair get(int position) {
        return this.pifList.get(position);
    }
}
