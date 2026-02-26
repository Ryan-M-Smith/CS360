/**
 * Filename: URLParse.java
 * Description: Parse a given URL and extract all URLs from the webpage.
 * @author: Ryan Smith (smithrm23@juniata.edu)
 */

package HW02;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class URLParse {
	/// The list of discovered URLs.
	private static final ArrayList<URL> urls = new ArrayList<>();

	/**
	 * A regex pattern for matching URLs. Matches:
	 * 
	 * <ul>
	 * 	 <li> <code>http://</code> or <code>https://</code> </li>
	 *   <li> Domain/sub-domain names </li>
	 *   <li> URL paths and query parameters </li>
	 * 	 <li> Special characters in URLs </li>
	 * 	 <li> Trailing slashes </li>
	 * </ul>
	 */
	private static final String regex = "(https?)://[\\w.-]+(?:\\.[\\w.-]+)+[/\\w.~_-]*[\\?\\w=&/~_.+;-]*";
	
	/**
	 * Prompt the user for a URL, then parse the webpage and extract all URLs from it.
	 * All discovered URLs are displayed at the end.
	 * 
	 * @param 	args				Command line arguments (unused)
	 * 
	 * @throws 	IOException			If an error occurs while reading the URL
	 * @throws 	URISyntaxException	If the input URL is invalid
	 */
	public static void main(String[] args) throws IOException, URISyntaxException {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Input initial URL: ");
		String input = scanner.next();
		scanner.close();

		System.out.printf("Scanning %s for URLs...\n\n", input);
		
		// Since Java 20, URLs should be created via the URI class
		URL urlIn = new URI(input).toURL();
		urls.add(urlIn);
		
		// Read the HTML from the site with a scanner via an input stream 
		InputStream urlStream = urlIn.openStream();
		Scanner streamScanner = new Scanner(urlStream);
		
		// Compile the regex pattern for matching URLs
		Pattern urlPattern = Pattern.compile(regex);

		// Search the page content for URLs
		while (streamScanner.hasNext()) {
			String token = streamScanner.next();			// Parse the next token from the page content
			Matcher matcher = urlPattern.matcher(token);	// Match the token against the URL regex
			
			// Extract found URLs and store them
			if (matcher.find()) {
				URL found = new URI(matcher.group()).toURL();
				urls.add(found);
			}
		}

		streamScanner.close();

		// Display the results
		for (int i = 0; i < urls.size(); i++) {
			System.out.printf("url: %d %s\n", i, urls.get(i));
		}
	}
}