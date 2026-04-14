/**
 * A simple class representing a car to demo OOP.
 * 
 * @author rmsmith
 * @version 1.0
 * @since 2026-04-14
 */

package InClass.Day15;

/// A simple class representing a car to demo OOP.
public class Car {
	/// The number of miles on the car
	protected int miles;

	/// The paint color of the car
	protected String color; 
	
	/* -------------------------------------------------------------------------- */
	/*                                Constructors                                */
	/* -------------------------------------------------------------------------- */

	/**
	 * Default constructor that initializes miles to 0 and color to white.
	 */
	public Car() {
		this.miles = 0;
		this.color = "white";
	}

	/**
	 * Parameterized constructor that initializes miles and color to the given values.
	 * 
	 * @param miles The number of miles on the car
	 * @param color The color of the car
	 */
	public Car(int miles, String color) {
		this.miles = miles;
		this.color = color;
	}

	/* -------------------------------------------------------------------------- */
	/*                                   Getters                                  */
	/* -------------------------------------------------------------------------- */

	/**
	 * Getter for miles.
	 * 
	 * @return The number of miles on the car
	 */
	public int getMiles() {
		return miles;
	}

	/**
	 * Getter for color.
	 * 
	 * @return The paint color of the car
	 */
	public String getColor() {
		return color;
	}

	/* -------------------------------------------------------------------------- */
	/*                                   Setters                                  */
	/* -------------------------------------------------------------------------- */

	/**
	 * Setter for miles.
	 * 
	 * @param miles The new number of miles on the car
	 */
	public void setMiles(int miles) {
		this.miles = miles;
	}

	/**
	 * Setter for color.
	 * 
	 * @param color THe new paint color of the car
	 */
	public void setColor(String color) {
		this.color = color;
	}

	/* -------------------------------------------------------------------------- */
	/*                                   Utility                                  */
	/* -------------------------------------------------------------------------- */

	@Override
	public String toString() {
		return String.format("A %s car with %d miles", color, miles);
	}
}
