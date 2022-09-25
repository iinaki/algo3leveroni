!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 11:45:29'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.

	self assert: (self ejecutarElBloque: [customerBook addCustomerNamed: 'John Lennon'] tardaMenosQue: (50 * millisecond) )
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 11:46:28'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assert: (self ejecutarElBloque: [customerBook removeCustomerNamed: paulMcCartney] tardaMenosQue: (100 * millisecond) )
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 13:25:32'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self testearClosureQueFalla: [customerBook addCustomerNamed: ''] yHacer: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ] conErrorDelTipo: Error.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 13:39:22'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self testearClosureQueFalla: [customerBook removeCustomerNamed: 'Paul McCartney'] yHacer: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)  ] conErrorDelTipo: NotFound.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 12:18:37'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self testeaNumeroDeClientes: (OrderedCollection with: 0 with: 1 with: 1) deUnLibroDeClientes: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 12:19:49'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self testeaNumeroDeClientes: (OrderedCollection with: 0 with: 0 with: 0) deUnLibroDeClientes: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 13:53:14'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self testeaQueHabiendoUnCostumerLlamado: johnLennon NoSePuedeSuspenderA: 'Ringo Starr' enElLibro: customerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'i 9/25/2022 13:53:32'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self testeaQueHabiendoUnCostumerLlamado: johnLennon NoSePuedeSuspenderA: johnLennon enElLibro: customerBook.

! !


!CustomerBookTest methodsFor: 'abstracciones de los tests' stamp: 'i 9/25/2022 11:44:20'!
ejecutarElBloque: unBloque tardaMenosQue: unTiempo
	|millisecondsBeforeRunning  millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	unBloque value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning) < unTiempo! !

!CustomerBookTest methodsFor: 'abstracciones de los tests' stamp: 'i 9/25/2022 12:19:04'!
testeaNumeroDeClientes: unaCollection deUnLibroDeClientes: unLibro

	self assert: (unaCollection at: 1			 ) equals: unLibro numberOfActiveCustomers.
	self assert: ( unaCollection at: 2 ) equals: unLibro numberOfSuspendedCustomers.
	self assert: ( unaCollection at: 3 ) equals: unLibro numberOfCustomers.! !

!CustomerBookTest methodsFor: 'abstracciones de los tests' stamp: 'i 9/25/2022 13:52:41'!
testeaQueHabiendoUnCostumerLlamado: unicoCostumer NoSePuedeSuspenderA: unCustomer enElLibro: unLibro
	
	self testearClosureQueFalla: [unLibro suspendCustomerNamed: unCustomer] yHacer: [ :anError | 
				self assert: unLibro numberOfCustomers = 1.
				self assert: (unLibro includesCustomerNamed: unicoCostumer) ] conErrorDelTipo: CantSuspend.
	! !

!CustomerBookTest methodsFor: 'abstracciones de los tests' stamp: 'i 9/25/2022 13:24:18'!
testearClosureQueFalla: bloqueQueFalla yHacer: bloqueDeSalida conErrorDelTipo: unError

	[ bloqueQueFalla value.
	self fail ]
		on: unError 
		do: bloqueDeSalida.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
