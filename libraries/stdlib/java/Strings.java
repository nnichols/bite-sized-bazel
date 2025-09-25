package libraries.stdlib;

public class Strings{
    public static String concatArray (String[] in){
        String basis = "";
        for (String s : in){
            basis = basis.concat(s);
        }
        return basis;
    }
}
