"
Filename: hw05.st
Description: HW05 question 3
Author: Ryan Smith <smithrm23@juniata.edu>
"

Smalltalk at: #myArray put: 0 !
myArray := Array new: 15 !

"Populate the array with using the to: do: iteration so that the value"
"in the array is double the index."
'Populate the array - each value is double the index' printNl !
1 to: 15 do: [:i | myArray at: i put: i * 2] !

"Output the array by sending printNl to the entire object."
'Print the array' printNl !
myArray printNl !

"Output the array in ascending order, using to: do: iteration."
'Output array in ascending order' printNl !
1 to: 15 do: [:i | (myArray at: i) printNl] !

"Output the array in descending (reverse) order, using to: do: iteration."
'Output array in descensing order' printNl !
15 to: 1 by: -1 do: [:i | (myArray at: i) printNl] !

"Print out only the elements in the array which end in 4 (two ways)."

"1. to: do: iteration with the by: increment"
'Elements that end in 4 (via to: do: by:)' printNl !
2 to: 15 by: 5 do: [:i | (myArray at: i) printNl ] !

"2. to: do: iteration with a nested conditional"
'Elements that end in 4 (via nested conditional)' printNl !
1 to: 15 do: [:i |
	((myArray at: i) \\ 10 = 4) ifTrue: [
		(myArray at: i) printNl
	]
] !
