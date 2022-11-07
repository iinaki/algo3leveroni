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


!classDefinition: #TransferenciaTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenciaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:26:59'!
test01LaCuentaALaCualSeLeTransfierePasaATenerElMonto 

	| accountQueRecibePlata accountQueTransfierePlata |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 100 * peso equals: accountQueRecibePlata balance! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:27:18'!
test02LaCuentaQueTransfiereDejaDeTenerElMonto 

	| accountQueRecibePlata accountQueTransfierePlata |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 0 * peso equals: accountQueTransfierePlata balance! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:27:56'!
test03SeRegistraLaTransferenciaEnLasDosCuentas

	| accountQueRecibePlata accountQueTransfierePlata transferencia |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: (accountQueRecibePlata hasRegistered: transferencia pataDeDeposit).
	self assert: (accountQueTransfierePlata hasRegistered: transferencia pataDeWithdraw).! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:28:12'!
test04LaTransferenciaConoceSuValor

	| accountQueRecibePlata accountQueTransfierePlata transferencia |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 100 * peso equals: transferencia value.! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:40:47'!
test05LaPataDeWithdrawTieneComoContraparteALaPataDeDeposito

	| accountQueRecibePlata accountQueTransfierePlata transferencia pataDeDeposito pataDeWithdraw |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	pataDeDeposito := transferencia pataDeDeposit.
	pataDeWithdraw := transferencia pataDeWithdraw.
	
	self assert: (pataDeWithdraw esContraparte: pataDeDeposito).! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:29:00'!
test06LaPataDeDepositoTieneComoContraparteALaPataDeWithdraw

	| accountQueRecibePlata accountQueTransfierePlata transferencia pataDeDeposit pataDeWithdraw |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	pataDeDeposit := transferencia pataDeDeposit.
	pataDeWithdraw := transferencia pataDeWithdraw.
	
	self assert: (pataDeDeposit esContraparte: pataDeWithdraw ).! !


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


!classDefinition: #DepositoDeTransferencia category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #DepositoDeTransferencia
	instanceVariableNames: 'contraparte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositoDeTransferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:15:42'!
agregarContraparte: unWithdraw
	contraparte := unWithdraw ! !

!DepositoDeTransferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:22:07'!
esContraparte: unPosibleWithdarDeTransferencia
	^contraparte = unPosibleWithdarDeTransferencia ! !


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


!classDefinition: #WithdrawDeTransferencia category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #WithdrawDeTransferencia
	instanceVariableNames: 'contraparte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawDeTransferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:15:20'!
agregarContraparte: unDeposito
	contraparte := unDeposito ! !

!WithdrawDeTransferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:09:11'!
esContraparte: unPosibleDepositoDeTransferencia 
	^contraparte = unPosibleDepositoDeTransferencia ! !


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



!classDefinition: #Transferencia category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transferencia
	instanceVariableNames: 'value cuentaQueTransfiere cuentaQueRecibe pataDeDeposito pataDeWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:41:37'!
initializeFor: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe

	value := unMonto.
	cuentaQueTransfiere := unaCuentaQueTransfiere .
	cuentaQueRecibe := unaCuentaQueRecibe .
	pataDeDeposito := DepositoDeTransferencia register: unMonto on: unaCuentaQueRecibe .
	pataDeWithdraw := WithdrawDeTransferencia register: unMonto on: unaCuentaQueTransfiere .
	pataDeDeposito agregarContraparte: pataDeWithdraw.
	pataDeWithdraw agregarContraparte: pataDeDeposito ! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 17:50:23'!
pataDeDeposit
	^ pataDeDeposito! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 17:51:07'!
pataDeWithdraw
	^ pataDeWithdraw! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 15:59:10'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transferencia class' category: 'ServiciosFinancieros-Ejercicio'!
Transferencia class
	instanceVariableNames: ''!

!Transferencia class methodsFor: 'as yet unclassified' stamp: 'i 11/7/2022 18:17:10'!
register: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe
	
	| transaction |
	
	transaction := self new initializeFor: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe. 
	"unaCuentaQueTransfiere register: transaction .
	unaCuentaQueRecibe register: transaction."
		
	^ transaction
	
	! !
