Object subclass: #Account
	instanceVariableNames: 'balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: nil !

Account comment:
	'I represent a place to deposit and withdraw money' !

(Account comment) printNl !

!Account class methodsFor: 'instance creation'!
	new
		| r |

		r := super new.
		r init.
		^r
	! !

!Account methodsFor: 'instance initialization'!
	init
		balance := 0
	! !
   
!Account methodsFor: 'printing'!
	printOn: stream
		super printOn: stream.
		stream nextPutAll: ' with balance: '.
		balance printOn: stream
	! !

!Account methodsFor: 'moving money'!
   spend: amount
		balance := balance - amount
   !
   
   deposit: amount
		balance := balance + amount
   ! !
   
Smalltalk at: #a put: (Account new) !
a deposit: 125!
a deposit: 20!
a printNl!
a spend: 10!
a printNl!

Account subclass: #Savings
	instanceVariableNames: 'interest'
	classVariableNames: ''
	poolDictionaries: ''
	category: nil !

!Savings methodsFor: 'initialization'!
	init
		interest := 0.
		^ super init
	! !

!Savings methodsFor: 'interest'!
	interest: amount
		interest := interest + amount.
		self deposit: amount
	!
   
	clearInterest
		| oldinterest |

		oldinterest := interest.
		interest := 0.
		^oldinterest
	! !

Smalltalk at: #s put: (Savings new) !
s printNl !
s interest: 3 !
s printNl !
s clearInterest !

Account subclass: #Checking
	instanceVariableNames: 'checknum checksleft'
	classVariableNames: ''
	poolDictionaries: ''
	category: nil !

!Checking methodsFor: 'initialization'!
	init
		checksleft := 0.
		^super init
	! !

!Checking methodsFor: 'spending'!
	newChecks: number count: checkcount
		checknum := number.
		checksleft := checkcount
	!

	writeCheck: amount
		| num |
		
		num := checknum.
		checknum := checknum + 1.
		checksleft := checksleft - 1.
		self spend: amount.
		^ num
	! !

Smalltalk at: #c put: (Checking new) !
c printNl !
c deposit: 250 !
c printNl !
c newChecks: 100 count: 50 !
c printNl !
(c writeCheck: 32) printNl !
c printNl !