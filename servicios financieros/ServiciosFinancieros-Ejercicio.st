!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'i 11/6/2022 21:58:29'!
test08LaCuentaALaCualSeLeTransfierePasaATenerElMonto 

	| accountQueRecibePlata accountQueTransfierePlata |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 100 * peso equals: accountQueRecibePlata balance

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'i 11/6/2022 21:59:33'!
test09LaCuentaQueTransfiereDejaDeTenerElMonto 

	| accountQueRecibePlata accountQueTransfierePlata |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 0 * peso equals: accountQueTransfierePlata balance

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'i 11/6/2022 22:00:04'!
test10SeRegistraLaTransferenciaEnLasDosCuentas

	| accountQueRecibePlata accountQueTransfierePlata transferencia |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: (accountQueRecibePlata hasRegistered: transferencia).
	self assert: (accountQueTransfierePlata hasRegistered: transferencia).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'i 11/7/2022 15:58:38'!
test11LaTransferenciaConoceSuValor

	| accountQueRecibePlata accountQueTransfierePlata transferencia |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 100 * peso equals: transferencia value.

! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'i 11/6/2022 20:29:31'!
register: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'i 11/6/2022 21:05:53'!
valueForBalanceEnLaCuenta: unaCuenta

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transferencia category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transferencia
	instanceVariableNames: 'value cuentaQueTransfiere cuentaQueRecibe'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/6/2022 20:56:08'!
initializeFor: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe

	value := unMonto.
	cuentaQueTransfiere := unaCuentaQueTransfiere .
	cuentaQueRecibe := unaCuentaQueRecibe .! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 15:59:10'!
value

	^ value! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/6/2022 21:05:38'!
valueForBalanceEnLaCuenta: unaCuenta

	unaCuenta = cuentaQueTransfiere ifTrue: [^value negated].
	unaCuenta = cuentaQueRecibe ifTrue: [^value].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transferencia class' category: 'ServiciosFinancieros-Ejercicio'!
Transferencia class
	instanceVariableNames: ''!

!Transferencia class methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 15:52:30'!
register: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe
	
	| transaction |
	
	transaction := self new initializeFor: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe. 
	unaCuentaQueTransfiere register: transaction .
	unaCuentaQueRecibe register: transaction.
		
	^ transaction
	
	! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'i 11/6/2022 19:48:49'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'i 11/6/2022 21:05:59'!
valueForBalanceEnLaCuenta: unaCuenta

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'i 11/6/2022 21:04:23'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueForBalanceEnLaCuenta: self ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'i 11/6/2022 20:05:55'!
transferir: unMonto aLaCuenta: unaCuentaQueRecibeMonto
	
	Withdraw register: unMonto on: self .

	Deposit register: unMonto on: unaCuentaQueRecibeMonto 
	
	
	! !
