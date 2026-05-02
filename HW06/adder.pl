/**
 * Filename: adder.pl
 * Description: HW06 question 3
 * Author: Ryan Smith <smithrm23@juniata.edu>
 */

/* -------------------------------------------------------------------------- */
/*                                    Rules                                   */
/* -------------------------------------------------------------------------- */

two_bit_adder(A, B, C, S) :-
	bit_and(A, B, C),	% Carry is analagous to bitwise AND
	bit_xor(A, B, S).	% Sum is analagous to bitwise XOR

/* -------------------------------------------------------------------------- */
/*                                    Goals                                   */
/* -------------------------------------------------------------------------- */

%
% Bitwise AND truth table
%

bit_and(0, 0, 0).
bit_and(0, 1, 0).
bit_and(1, 0, 0).
bit_and(1, 1, 1).

%
% Bitwise XOR truth table
%

bit_xor(0, 0, 0).
bit_xor(0, 1, 1).
bit_xor(1, 0, 1).
bit_xor(1, 1, 0).

main :-
	two_bit_adder(0, 0, C1, S1),
	write('0 + 0 ='), nl,
	write('Carry: '), write(C1),nl,
	write('Sum: '), write(S1), nl, nl,

	two_bit_adder(0, 1, C2, S2),
	write('0 + 1 ='), nl,
	write('Carry: '), write(C2), nl,
	write('Sum: '), write(S2), nl, nl,

	two_bit_adder(1, 1, C3, S3),
	write('1 + 1 ='), nl,
	write('Carry: '), write(C3), nl,
	write('Sum: '), write(S3), nl, nl,

	two_bit_adder(1, 0, C4, S4),
	write('1 + 0 ='), nl,
	write('Carry: '), write(C4), nl,
	write('Sum: '), write(S4), nl.

:- initialization(main).