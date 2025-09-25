import libraries.stdlib.Strings;
import com.google.gson.Gson;
import java.util.HashMap;

public class HelloJson {
    public static void main(String args[]) {
        String concatedArgs = Strings.concatArray(args);
        String basis = "Hello, ";

        HashMap<String, String> greeting = new HashMap<>();
        greeting.put("greeting", basis.concat(concatedArgs));

        Gson gson = new Gson();
        String json = gson.toJson(greeting);

        System.out.println(json);
    }
}
