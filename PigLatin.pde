final String pattern = "^(qu)|^[^aeiou]+";

public void setup() {
	String[] lines = loadStrings("LowellHymn.txt");
	for (String line : lines) {
	  println(pigLatinOnSentence(line));
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

public String formatWord(String word, boolean first) {
	return word.length() != 0 ? ((word.charAt(0).matches("[A-Z]") ? 
		pigLatin(word.split("[ .,]")[0]).substring(0, 1).toUpperCase() + 
		pigLatin(word.split("[ .,]")[0]).substring(1).toLowerCase() :
		pigLatin(word.split("[ .,]")[0])) +
		(word.contains(",") ? ", " : "") + 
		(word.contains(".") ? "." : " ")) :
		"";
}

public String pigLatinOnSentence(String sentence) {
	String[] words = sentence.split(" ");

	for (int i = 0; i < words.length; i++) {
		words[i] = formatWord(words[i], words[i]);
	}

	String finalSentence = "";

	for (String word : words) {
		finalSentence += word;
	}

	return finalSentence;
}

