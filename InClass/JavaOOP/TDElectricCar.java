package InClass.Day15;

import java.util.ArrayList;
import java.util.Collections;

public class TDElectricCar {
	public static void main(String[] args) {
		ElectricCar defaultEV = new ElectricCar();							// Default constructor
		ElectricCar customEV  = new ElectricCar(5000, "blue", 50.0, 75.0);	// Parameterized constructor

		// Utilize the toString method to print the default car
		System.out.println(defaultEV);

		// Our custom EV is pretty low on charge, let's give it a boost!
		customEV.charge();

		//
		// Let's build another fleet of cars, this time with an ArrayList
		//

		int n = 4;
		ArrayList<ElectricCar> fleet = new ArrayList<>(Collections.nCopies(n, new ElectricCar()));

		for (var car: fleet) {
			System.out.println(car);
		}

	}	
}
