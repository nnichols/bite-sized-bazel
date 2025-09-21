import libraries.stdlib.Strings;

public class Hello {
    public static void main(String args[]) {
        String concatedArgs = Strings.concatArray(args);
        String basis = "Hello, ";

        System.out.println(basis.concat(concatedArgs));
    }
}
