package libraries.stdlib;

import libraries.stdlib.Strings;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class StringsTest {

    @Test
    public void concatArrayEmptyTest(){
        String[] in = new String[0];
        String expected = "";
        String actual = Strings.concatArray(in);
        assertEquals(expected, actual);
    }

    @Test
    public void concatArraySingleEntryTest() {
        String[] in = {"hello"};
        String expected = "hello";
        String actual = Strings.concatArray(in);
        assertEquals(expected, actual);
    }

    @Test
    public void concatArraySeveralEntriesTest() {
        String[] in = { "hello", " testing" };
        String expected = "hello testing";
        String actual = Strings.concatArray(in);
        assertEquals(expected, actual);
    }

}
