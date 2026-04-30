/**
 * Filename: perennial_garden.pl
 * Description: HW06 question 1
 * Author: Ryan Smith <smithrm23@juniata.edu>
 */

flower(phlox).
flower(petunia).
flower(rose).
flower(daisy).

type(phlox, perennial).
type(petunia, annual).
type(rose, bush).
type(daisy, perennial).
type(daisy, annual).

perennial_garden(F) :- flower(F), type(F, perennial).

main :-
	trace,
	perennial_garden(F),
	write(F), nl,
	fail.

:- initialization(main).
