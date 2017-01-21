package g;
import java.util.*;

public final class SessionIdentifierGenerator {
public static String genNextValue(){

char[] chars = "A56FG".toCharArray();
StringBuilder sb = new StringBuilder();
Random random = new Random();
for (int i = 0; i < 5; i++) {
    char c = chars[random.nextInt(chars.length)];
    sb.append(c);
}
String output = sb.toString();
System.out.println(output);
return output;
}
}