/**
 * Filename: family.pl
 * Description: HW06 question 2
 * Author: Ryan Smith <smithrm23@juniata.edu>
 */

/* -------------------------------------------------------------------------- */
/*                               Provided rules                               */
/* -------------------------------------------------------------------------- */

parent(X, Y)		:- mother(X, Y).
parent(X, Y)		:- father(X, Y).
grandparent(X, Z)	:- parent(X, Y), parent(Y, Z).
ancestor(X, Y)		:- parent(X, Y).
ancestor(X, Z)		:- parent(X, Y), ancestor(Y, Z).
sibling(X, Y)		:- mother(M, X), mother(M, Y), father(F, X), father(F, Y), X \= Y.
cousin(X, Y)		:- parent(P, X), parent(Q, Y), sibling(P, Q).

/* -------------------------------------------------------------------------- */
/*                                  My rules                                  */
/* -------------------------------------------------------------------------- */

descendant(X, Y)	:- ancestor(Y, X).
aunt(X, Z)			:- sibling(X, Y), parent(Y, Z), female(X).
uncle(X, Z)			:- sibling(X, Y), parent(Y, Z), male(X).

/* -------------------------------------------------------------------------- */
/*                                    Goals                                   */
/* -------------------------------------------------------------------------- */

father(brian, robert).
father(bill, david).

father(robert, ethan).
father(robert, nathan).
father(robert, sophia).

father(david, olivia).
father(david, leah).
father(david, taran).

father(nathan, emma).
father(nathan, liam).

mother(patty, robert).
mother(sally, david).

mother(carol, ethan).
mother(carol, nathan).
mother(carol, sophia).

mother(laura, olivia).
mother(laura, leah).
mother(laura, taran).

mother(olivia, emma).
mother(olivia, liam).

%
% By specifying the gender of each person as a goal, we can differentiate
% between gendered family roles easier.
%

male(brian).
male(robert).
male(bill).
male(david).
male(ethan).
male(nathan).
male(liam).
male(taran).

female(sophia).
female(leah).
female(emma).
female(patty).
female(sally).
female(carol).
female(laura).
female(olivia).

/* -------------------------------------------------------------------------- */
/*                                 Test cases                                 */
/* -------------------------------------------------------------------------- */

test_siblings :-
	%
	% Find the siblings of a given person (sample)
	%
	% Sample input: olivia.
	% Output:
	%	Sibling of olivia is leah
	%	Sibling of olivia is taran
	%

	write('Finding siblings of olivia:'), nl,
	sibling(S, olivia),
	write('Sibling of olivia is '), write(S), nl,
	fail.
test_siblings.

test_aunts :-
	%
	% Find the aunts a given person
	%
	% Sample input: emma.
	% Output:
	%	Aunt of emma is sophia
	%	Aunt of emma is leah
	%

	nl, write('Finding aunts of emma:'), nl,
	aunt(A, emma),
	write('Aunt of emma is '), write(A), nl,
	fail.
test_aunts.

test_uncles :-
	%
	% Find the uncles of a given person
	%
	% Sample input: liam.
	% Output:
	%	Uncle of liam is ethan
	%	Uncle of liam is taran
	%

	nl, write('Finding uncles of liam:'), nl,
	uncle(U, liam),
	write('Uncle of liam is '), write(U), nl,
	fail.
test_uncles.

test_descendants :-
	%
	% Find the descendants of a given person
	%
	% Sample input: brian.
	% Output:
	%	Descendant of brian is robert
	%	Descendant of brian is ethan
	%	Descendant of brian is nathan
	%	Descendant of brian is sophia
	%	Descendant of brian is emma
	%	Descendant of brian is liam
	%

	nl, write('Finding descendants of brian:'), nl,
	descendant(D, brian),
	write('Descendant of brian is '), write(D), nl,
	fail.
test_descendants.

main :-
	test_siblings,
	test_aunts,
	test_uncles,
	test_descendants.

:- initialization(main).