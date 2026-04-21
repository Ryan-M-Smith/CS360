"
Filename: account.st
Description: A basic account class in Smalltalk that tracks the number of times the balance went negative.
Author: Ryan Smith <smithrm23@juniata.edu>
"

"Account class"

Object subclass: #Account
   instanceVariableNames: 'balance timesNegative'
   classVariableNames: ''
   poolDictionaries: ''
   category: nil !

Account comment:
    'I represent a place to deposit and withdraw money' !

!Account class methodsFor: 'instance creation'!
    new
		| r |

		r := super new.
		r init.
		^r
    ! !

!Account methodsFor: 'instance initialization'!
    init
		balance := 0.
		timesNegative := 0
    ! !
   
!Account methodsFor: 'printing'!
    printOn: stream
		super printOn: stream.
		stream nextPutAll: ' with balance: '.
		balance printOn: stream.
		stream nextPutAll: '. Balance has been negative '.
		timesNegative printOn: stream.
		stream nextPutAll: ' times.'
    ! !

!Account methodsFor: 'moving money'!
	spend: amount
    	balance := balance - amount.

		(balance < 0) ifTrue: [
			timesNegative := timesNegative + 1
		]
	!
	
	deposit: amount
    	balance := balance + amount.

		(balance < 0) ifTrue: [
			timesNegative := timesNegative + 1
		]
	! !

!Account methodsFor: 'accessing'!
	getTimesNegative
		^ timesNegative
	! !

!Account methodsFor: 'modifying'!
	setTimesNegative: newTimes
		timesNegative := newTimes
	! !

"Test driver"

"Create a new account instance"
Smalltalk at: #account put: Account new !
account printNl ! 

"Deposit some money into the account"
account deposit: 100 !
account printNl !

"After this first spend, we still have a positive balance"
account spend: 50 !
account printNl !

"Now, spend more to go negative"
account spend: 75 !
account printNl !		"timesNegative = 1"
account spend: 100 !
account printNl !		"timesNegative = 2"

"Let's deposit a small amount - we'll still be negative though"
account deposit: 50 !
account printNl !		"timesNegative = 3"

"Use the getter"
account getTimesNegative printNl !

"Use the setter to reset timesNegative to 0"
account deposit: 75 !
account setTimesNegative: 0 !
account printNl !