!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 't 11/11/2022 01:37:49'!
test01DepositamosEnUnaCuentaYElBalanceEsElBalanceDeLaCuenta

	| portfolio unaCuenta |
	
	portfolio := Portfolio new.
	unaCuenta := ReceptiveAccount new.
	Deposit register: 50*peso on: unaCuenta.
	
	portfolio add: unaCuenta.
	
	self assert: 50 * peso equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 't 11/11/2022 01:39:05'!
test02DepositamosEnDosCuentasYElBalanceEsElBalanceDeLaCuentasSumadas

	| portfolio unaCuenta otraCuenta |
	portfolio := Portfolio new.
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	Deposit register: 50*peso on: unaCuenta.
	Deposit register: 50*peso on: otraCuenta .
		
	portfolio add: unaCuenta.
	portfolio add: otraCuenta .
			
	self assert: 100 * peso equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 't 11/11/2022 01:40:26'!
test03DepositamosEnUnaCuentaYSeRegistraLaTransaccion

	| portfolio unaCuenta unDeposito |
	portfolio := Portfolio new.
	unaCuenta := ReceptiveAccount new.
	unDeposito := Deposit register: 50*peso on: unaCuenta.
		
	portfolio add: unaCuenta.
			
	self assert: (portfolio hasRegistered: unDeposito).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 't 11/11/2022 01:49:34'!
test04LasTransaccionesDeUnaCuentaSonLasMismasQueLasDelPortfolio

	| portfolio cuenta1 |
	
	portfolio := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	
	Deposit register: 50*peso on: cuenta1.
	
	portfolio add: cuenta1.
			
	self assert: (cuenta1 transactions = portfolio transactions ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 't 11/11/2022 01:51:10'!
test05ElBalanceConPortfoliosYCuentasAnidadasEsElCorrecto

	| portfolio1 cuenta1 cuenta2 portfolio2 portfolio3 cuenta3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	cuenta3 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: cuenta1 .
	Deposit register: 50*peso on: cuenta2.
	Deposit register: 100*peso on: cuenta3 .
		
	portfolio1 add: cuenta1.
	portfolio2 add: cuenta2.
	portfolio3 add: cuenta3.
	portfolio2 add: portfolio3 .
	portfolio1 add: portfolio2 .
			
	self assert: (250*peso = portfolio1 balance).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'i 11/11/2022 09:39:21'!
test06SeEncuentraElRegistroEntreCuentasYPortfoliosAnidados

	| portfolio1 cuenta1 cuenta2 portfolio2 portfolio3 cuenta3 unDeposito |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	cuenta3 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: cuenta1 .
	Deposit register: 50*peso on: cuenta2.
	unDeposito := Deposit register: 100*peso on: cuenta3 .
		
	portfolio1 add: cuenta1.
	portfolio2 add: cuenta2.
	portfolio3 add: cuenta3.
	portfolio2 add: portfolio3 .
	portfolio1 add: portfolio2 .
			
	self assert: (portfolio1 hasRegistered: unDeposito).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'i 11/11/2022 16:33:19'!
test07LasTransaccionesDelPortfolioSonLasEsperadasLuegoDeAnidarCuentasYPortfolios

	| portfolio1 cuenta1 cuenta2 portfolio2 portfolio3 cuenta3 depositos |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	depositos := OrderedCollection new.
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	cuenta3 := ReceptiveAccount new.
	depositos add: 	(Deposit register: 100*peso on: cuenta1).
	depositos add: (	Deposit register: 50*peso on: cuenta2).
	depositos add: (	Deposit register: 200*peso on: cuenta3).
	portfolio1 add: cuenta1.
	portfolio2 add: cuenta2.
	portfolio3 add: cuenta3.
	portfolio2 add: portfolio3 .
	portfolio1 add: portfolio2 .
	self assert: (depositos = portfolio1 transactions ).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'i 11/11/2022 15:46:29'!
test08UnPortfolioNoPuedeAgregarDosVecesLaMismaCuenta

	| portfolio1 cuenta1  |
	
	portfolio1 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: cuenta1 .
	
	portfolio1 add: cuenta1.
	
	self
	
        should: [portfolio1 add: cuenta1]

        raise: Error - MessageNotUnderstood 

        withExceptionDo: [ :anError |
	
            self assert: 'Un portfolio no puede agregar dos veces la misma cuenta.' equals: anError messageText ].
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'i 11/11/2022 15:48:25'!
test09UnPortfolioNoSePuedeIncluirASiMismo

	| portfolio1  |
	
	portfolio1 := Portfolio new.

	self
	
        should: [portfolio1 add: portfolio1]

        raise: Error - MessageNotUnderstood 

        withExceptionDo: [ :anError |
	
            self assert: 'Un portfolio no se puede incluir a si mismo.' equals: anError messageText ].
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'i 11/11/2022 16:16:08'!
test10NoSePuedeAgregarUnaCuentaQueYaEstaEnUnPortfolioHijo
	
	| portfolio1 portfolio2 cuenta1 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	
	portfolio2 add: cuenta1.
	portfolio1 add: portfolio2.

	self
	
        should: [portfolio1 add: cuenta1]

        raise: Error - MessageNotUnderstood 

        withExceptionDo: [ :anError |
	
            self assert: 'Un portfolio no puede agregar una cuenta que ya esta incluida en un portfolio hijo.' equals: anError messageText ].
	! !


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

!TransferenciaTest methodsFor: 'testing' stamp: 'i 11/7/2022 18:26:59'!
test01LaCuentaALaCualSeLeTransfierePasaATenerElMonto 

	| accountQueRecibePlata accountQueTransfierePlata |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 100 * peso equals: accountQueRecibePlata balance! !

!TransferenciaTest methodsFor: 'testing' stamp: 'i 11/7/2022 18:27:18'!
test02LaCuentaQueTransfiereDejaDeTenerElMonto 

	| accountQueRecibePlata accountQueTransfierePlata |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 0 * peso equals: accountQueTransfierePlata balance! !

!TransferenciaTest methodsFor: 'testing' stamp: 'i 11/7/2022 18:27:56'!
test03SeRegistraLaTransferenciaEnLasDosCuentas

	| accountQueRecibePlata accountQueTransfierePlata transferencia |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: (accountQueRecibePlata hasRegistered: transferencia pataDeDeposit).
	self assert: (accountQueTransfierePlata hasRegistered: transferencia pataDeWithdraw).! !

!TransferenciaTest methodsFor: 'testing' stamp: 'i 11/7/2022 18:28:12'!
test04LaTransferenciaConoceSuValor

	| accountQueRecibePlata accountQueTransfierePlata transferencia |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	self assert: 100 * peso equals: transferencia value.! !

!TransferenciaTest methodsFor: 'testing' stamp: 'i 11/7/2022 18:40:47'!
test05LaPataDeWithdrawTieneComoContraparteALaPataDeDeposito

	| accountQueRecibePlata accountQueTransfierePlata transferencia pataDeDeposito pataDeWithdraw |
	
	accountQueRecibePlata := ReceptiveAccount new.
	accountQueTransfierePlata := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountQueTransfierePlata.
	
	transferencia := Transferencia register: 100*peso desde: accountQueTransfierePlata hacia: accountQueRecibePlata.
	
	pataDeDeposito := transferencia pataDeDeposit.
	pataDeWithdraw := transferencia pataDeWithdraw.
	
	self assert: (pataDeWithdraw esContraparte: pataDeDeposito).! !

!TransferenciaTest methodsFor: 'testing' stamp: 'i 11/7/2022 18:29:00'!
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

!AccountTransaction methodsFor: 'value' stamp: 'i 11/11/2022 09:52:36'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'i 11/6/2022 20:29:31'!
register: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe
	self subclassResponsibility ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'i 11/11/2022 09:52:48'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'i 11/11/2022 09:52:53'!
valueForBalance

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


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

!Withdraw methodsFor: 'value' stamp: 'i 11/8/2022 19:51:26'!
valueForBalance

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PataDeTransferencia category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PataDeTransferencia
	instanceVariableNames: 'contraparte value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PataDeTransferencia methodsFor: 'initialize' stamp: 'i 11/8/2022 20:41:27'!
initializeFor: aValue

	value := aValue ! !


!PataDeTransferencia methodsFor: 'operaciones' stamp: 'i 11/8/2022 20:40:49'!
agregarContraparte: unaContraparte
	contraparte := unaContraparte ! !

!PataDeTransferencia methodsFor: 'operaciones' stamp: 'i 11/8/2022 20:40:30'!
esContraparte: unPosibleContraparteDeTransferencia
	^contraparte = unPosibleContraparteDeTransferencia ! !

!PataDeTransferencia methodsFor: 'operaciones' stamp: 'i 11/8/2022 20:41:55'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PataDeTransferencia class' category: 'ServiciosFinancieros-Ejercicio'!
PataDeTransferencia class
	instanceVariableNames: ''!

!PataDeTransferencia class methodsFor: 'instance creation' stamp: 'i 11/8/2022 20:44:54'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #DepositoDeTransfer category: 'ServiciosFinancieros-Ejercicio'!
PataDeTransferencia subclass: #DepositoDeTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositoDeTransfer methodsFor: 'value' stamp: 'i 11/8/2022 20:42:18'!
valueForBalance

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositoDeTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
DepositoDeTransfer class
	instanceVariableNames: ''!

!DepositoDeTransfer class methodsFor: 'instance creation' stamp: 'i 11/8/2022 20:44:16'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawDeTransfer category: 'ServiciosFinancieros-Ejercicio'!
PataDeTransferencia subclass: #WithdrawDeTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawDeTransfer methodsFor: 'value' stamp: 'i 11/8/2022 20:42:45'!
valueForBalance

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawDeTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawDeTransfer class
	instanceVariableNames: ''!

!WithdrawDeTransfer class methodsFor: 'instance creation' stamp: 'i 11/8/2022 20:44:24'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'cuentasYPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'public' stamp: 'i 11/11/2022 17:09:44'!
add: elementoDelPortfolio

	self elementoEsValido: elementoDelPortfolio.
	
	cuentasYPortfolios add: elementoDelPortfolio! !

!Portfolio methodsFor: 'public' stamp: 't 11/10/2022 23:24:18'!
balance
	^cuentasYPortfolios sum: [ :unaCuenta | unaCuenta balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'public' stamp: 't 11/10/2022 23:24:18'!
hasRegistered: unaTransferencia 
	^ cuentasYPortfolios  anySatisfy: [:unaCuenta | unaCuenta hasRegistered: unaTransferencia]! !

!Portfolio methodsFor: 'public' stamp: 'i 11/11/2022 17:09:52'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.
	
	cuentasYPortfolios do: [:unaCuenta | transactions addAll: unaCuenta transactions ].
	
	^transactions 

! !


!Portfolio methodsFor: 'private' stamp: 'i 11/11/2022 15:46:02'!
cuentaEstaIncluidaEnElPortfolio: unaCuenta
	^ cuentasYPortfolios includes: unaCuenta! !

!Portfolio methodsFor: 'private' stamp: 'i 11/11/2022 16:38:42'!
cuentaIncluidaEnAlgunPortfolio: elementoDelPortfolio

	(self cuentaEstaIncluidaEnElPortfolio: elementoDelPortfolio) ifTrue: [^true].

	^ cuentasYPortfolios anySatisfy: [:elementoActualDePortfolio | elementoActualDePortfolio cuentaIncluidaEnAlgunPortfolio: elementoDelPortfolio ].

	! !

!Portfolio methodsFor: 'private' stamp: 'i 11/11/2022 17:02:16'!
elementoEsValido: elementoDelPortfolio

	(self cuentaEstaIncluidaEnElPortfolio: elementoDelPortfolio) ifTrue:[ self signalCuentaYaExisteEnElPortfolio  ].
	(self esElPropioPortfolio: elementoDelPortfolio ) ifTrue:[ self signalNoSePuedeIncluirASiMismo ].
	(self cuentaIncluidaEnAlgunPortfolio: elementoDelPortfolio) ifTrue:[ self signalNoPuedeIncluirUnaCuentaQueEsteEnAlgunPortfolioHijo ].
	! !

!Portfolio methodsFor: 'private' stamp: 'i 11/11/2022 15:54:04'!
esElPropioPortfolio: unPortfolio
	^ unPortfolio = self! !


!Portfolio methodsFor: 'signals' stamp: 'i 11/11/2022 15:45:18'!
signalCuentaYaExisteEnElPortfolio

	self error: self class cuentaYaExisteEnElPortfolioMensajeDeError! !

!Portfolio methodsFor: 'signals' stamp: 'i 11/11/2022 16:31:54'!
signalNoPuedeIncluirUnaCuentaQueEsteEnAlgunPortfolioHijo

	self error: self class portfolioNoPuedeIncluirCuentaQueEsteEnPortfolioHijo! !

!Portfolio methodsFor: 'signals' stamp: 'i 11/11/2022 15:54:55'!
signalNoSePuedeIncluirASiMismo

	self error: self class portfolioNoSePuedeIncluirASiMismoMensajeDeError! !


!Portfolio methodsFor: 'initialize' stamp: 'i 11/11/2022 17:09:37'!
initialize

	cuentasYPortfolios := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errores' stamp: 'i 11/11/2022 15:58:06'!
cuentaYaExisteEnElPortfolioMensajeDeError

	^'Un portfolio no puede agregar dos veces la misma cuenta.'! !

!Portfolio class methodsFor: 'errores' stamp: 'i 11/11/2022 16:32:50'!
portfolioNoPuedeIncluirCuentaQueEsteEnPortfolioHijo

	^ 'Un portfolio no puede agregar una cuenta que ya esta incluida en un portfolio hijo.'! !

!Portfolio class methodsFor: 'errores' stamp: 'i 11/11/2022 15:55:29'!
portfolioNoSePuedeIncluirASiMismoMensajeDeError

	^'Un portfolio no se puede incluir a si mismo.'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'i 11/8/2022 19:50:58'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueForBalance ] ifEmpty: [ 0 ]! !

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


!ReceptiveAccount methodsFor: 'private' stamp: 'i 11/11/2022 16:34:43'!
cuentaIncluidaEnAlgunPortfolio: elementoDelPortfolio
	^false! !


!classDefinition: #Transferencia category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transferencia
	instanceVariableNames: 'value pataDeDeposito pataDeWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transferencia methodsFor: 'initialize' stamp: 'i 11/11/2022 09:49:47'!
initializeFor: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe

	value := unMonto.
	pataDeDeposito := DepositoDeTransfer register: unMonto on: unaCuentaQueRecibe .
	pataDeWithdraw := WithdrawDeTransfer register: unMonto on: unaCuentaQueTransfiere .
	pataDeDeposito agregarContraparte: pataDeWithdraw.
	pataDeWithdraw agregarContraparte: pataDeDeposito ! !


!Transferencia methodsFor: 'value' stamp: 'i 11/7/2022 15:59:10'!
value

	^ value! !


!Transferencia methodsFor: 'patas de transferencia' stamp: 'i 11/7/2022 17:50:23'!
pataDeDeposit
	^ pataDeDeposito! !

!Transferencia methodsFor: 'patas de transferencia' stamp: 'i 11/7/2022 17:51:07'!
pataDeWithdraw
	^ pataDeWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transferencia class' category: 'ServiciosFinancieros-Ejercicio'!
Transferencia class
	instanceVariableNames: ''!

!Transferencia class methodsFor: 'instance creation' stamp: 'i 11/7/2022 18:17:10'!
register: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe
	
	| transaction |
	
	transaction := self new initializeFor: unMonto desde: unaCuentaQueTransfiere hacia: unaCuentaQueRecibe. 
	"unaCuentaQueTransfiere register: transaction .
	unaCuentaQueRecibe register: transaction."
		
	^ transaction
	
	! !
