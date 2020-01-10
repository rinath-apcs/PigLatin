final String pattern = "^(qu)|^[^aeiou]+";

public void setup() {
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (String word : lines) {
	  System.out.println(pigLatin(word));
	}
}

//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
public String pigLatin(String word) {
	return (match(word, pattern) == null ? 
		word + "w" : 
		word.replaceFirst(pattern, "") + match(word, pattern)[0]) 
	+ "ay";
}

