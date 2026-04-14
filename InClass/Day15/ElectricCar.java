/**
 * A subclass representing an electric car, which is a type of car.
 * 
 * @author Ryan Smith <smithrm23@juniata.edu>
 * @version 1.0
 * @since 2026-04-14
 */

package InClass.Day15;

public class ElectricCar extends Car {
	/// The state of charge (SoC) of the electric car, as a percentage
	private double soc;

	/// The battery capacity of the electric car, in kWh
	private double batteryCapacity;

	/* -------------------------------------------------------------------------- */
	/*                                Constructors                                */
	/* -------------------------------------------------------------------------- */

	/**
	 * Default constructor that initializes miles to 0, color to white,
	 * SoC to 100%, and battery capacity to 75 kWh.
	 */
	public ElectricCar() {
		super();
		this.soc = 100.0;
		this.batteryCapacity = 75.0;
	}

	/**
	 * Parameterized constructor that initializes miles, color, SoC, and
	 * battery capacity to the given values.
	 * 
	 * @param miles
	 * @param color
	 * @param soc
	 * @param batteryCapacity
	 */
	public ElectricCar(int miles, String color, double soc, double batteryCapacity) {
		super(miles, color);
		this.soc = soc;
		this.batteryCapacity = batteryCapacity;
	}

	/* -------------------------------------------------------------------------- */
	/*                                   Getters                                  */
	/* -------------------------------------------------------------------------- */

	/**
	 * Getter for state of charge (SoC).
	 * 
	 * @return The state of charge (SoC) of the electric car, as a percentage
	 */
	public double getSoC() {
		return soc;
	}

	/**
	 * Getter for battery capacity.
	 * 
	 * @return The battery capacity of the electric car, in kWh
	 */
	public double getBatteryCapacity() {
		return batteryCapacity;
	}

	/* -------------------------------------------------------------------------- */
	/*                                   Setters                                  */
	/* -------------------------------------------------------------------------- */

	/**
	 * Setter for state of charge (SoC).
	 * 
	 * @param soc The new state of charge (SoC) of the electric car, as a percentage
	 */
	public void setSoc(double soc) {
		this.soc = soc;
	}

	/**
	 * Setter for battery capacity.
	 * 
	 * @param batteryCapacity The new battery capacity of the electric car, in kWh
	 */
	public void setBatteryCapacity(double batteryCapacity) {
		this.batteryCapacity = batteryCapacity;
	}

	/* -------------------------------------------------------------------------- */
	/*                                  Utilities                                 */
	/* -------------------------------------------------------------------------- */

	/**
	 * Simulates charging the electric car by incrementing the state of charge (SoC)
	 * until it reaches 100%. Prints the current SoC current kWh at each step.
	 */
	public void charge() {
		System.out.println("Charging...");
		
		try {
			while (this.soc < 100.0) {
				this.soc += 1.0;  // Increment SoC by 1%
				
				double capacity = this.soc / 100.0 * this.batteryCapacity;
				System.out.printf("Current SoC: %.0f%% | Current kWh: %.2f\n", this.soc, capacity);
				Thread.sleep(1000);
			}
			System.out.println("Charging complete!");
		} catch (InterruptedException e) {
			System.err.println("Error: charging aborted.");
		}
	}

	@Override
	public String toString() {
		return String.format(
			"A %s electric car with %d miles, a %.2f kWh battery, and %.2f%% SoC",
			color,
			miles,
			batteryCapacity,
			soc
		);
	}
}
