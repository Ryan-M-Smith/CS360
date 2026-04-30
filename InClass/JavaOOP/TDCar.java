/**
 * Test driver for the Car class.
 * 
 * @author Ryan Smith <smithrm23@juniata.edu>
 * @version 1.0
 * @since 2026-04-14
 */

package InClass.Day15;

import java.util.Arrays;

/// Test driver for the Car class.
public class TDCar {
	/**
	 * Main method to test the Car class.
	 * 
	 * @param args Command line arguments (not used)
	 */
	public static void main(String[] args) {
		Car defaultCar = new Car();					// Default constructor
		Car customCar  = new Car(10000, "blue");	// Parameterized constructor
		
		// Utilize the toString method to print the default car
		System.out.println(defaultCar);

		// Provide the default car with some values using the setter methods
		defaultCar.setColor("red");
		defaultCar.setMiles(5000);
		System.out.println(defaultCar);

		// A custom printout using the getters
		System.out.printf("My car has %d miles and is %s!\n", customCar.getMiles(), customCar.getColor());

		//
		// Let's build a fleet of cars, just for fun!
		//

		int size = 4;					// Array size
		Car[] fleet = new Car[size];	// Create an empty fleet
		Arrays.fill(fleet, new Car());	// Fill it with cars

		for (var car: fleet) {
			System.out.println(car);
		}
	}
}