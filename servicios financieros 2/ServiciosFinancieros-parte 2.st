!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'testing for transfer net' stamp: 't 11/13/2022 20:38:39'!
test07ElTransferNetDeUnaReceptiveAccountQueEnviaElDineroDevuelveElValorCorrecto

	| transferNet cuenta1 cuenta2 |
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	Transfer amount: 100*peso from: cuenta1 to: cuenta2.
	
	transferNet := TransferNet from: cuenta1 .
	
	self assert: -100*peso = transferNet  summary.! !

!ReportTest methodsFor: 'testing for transfer net' stamp: 't 11/13/2022 20:39:55'!
test08ElTransferNetDeDosReceptivesAccountsHabiendoHechoUnaSolaTransferenciaTienenValoresOpuestos

	| transferNetCuenta1 transferNetCuenta2 cuenta1 cuenta2 |
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	Transfer amount: 100*peso from: cuenta1 to: cuenta2.
	
	transferNetCuenta1 := TransferNet from: cuenta1 .
	transferNetCuenta2 := TransferNet from: cuenta2 .
	
	self assert: -100*peso = transferNetCuenta1  summary.
	self assert: 100*peso = transferNetCuenta2  summary.! !

!ReportTest methodsFor: 'testing for transfer net' stamp: 't 11/13/2022 20:41:37'!
test09HacerOtrosTiposDeTransaccionesNoAfectaElValorDelTransferNet

	| transferNetCuenta1 cuenta1 cuenta2 |
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	Deposit register: 300*peso on: cuenta1.
	Withdraw register: 100*peso on: cuenta1.
	Transfer amount: 100*peso from: cuenta1 to: cuenta2.
	
	transferNetCuenta1 := TransferNet from: cuenta1 .
	
	self assert: -100*peso = transferNetCuenta1  summary.
! !


!ReportTest methodsFor: 'testing for account summary' stamp: 'i 11/17/2022 16:23:44'!
test01ElAccountSummaryDeUnaReceptiveAccountSinTransaccionesDevuelveUnBalanceDe0Pesos

	| cuenta1 accountSummary formato |
	
	cuenta1 := ReceptiveAccount new.
	
	accountSummary := AccountSummary from: cuenta1.
	
	formato := OrderedCollection new.
	
	formato add: 'Balance = 0 * pesos'.
	
	self assert: formato = accountSummary  summary.
	
	! !

!ReportTest methodsFor: 'testing for account summary' stamp: 'i 11/17/2022 16:23:57'!
test02ElAccountSummaryDeUnaReceptiveAccountRespetaElFormatoDeDeposito

	| cuenta1 accountSummary summary |
	
	cuenta1 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: cuenta1.
	
	accountSummary := AccountSummary from: cuenta1.
	
	summary := OrderedCollection new.
	
	summary add: 'Deposito por 100 * pesos'.
	summary add: 'Balance = 100 * pesos'.
	
	self assert: summary = accountSummary summary.
	! !

!ReportTest methodsFor: 'testing for account summary' stamp: 'i 11/17/2022 16:24:09'!
test03ElAccountSummaryDeUnaReceptiveAccountRespetaElFormatoDeExtraccion

	| cuenta1 accountSummary summary |
	
	cuenta1 := ReceptiveAccount new.
	
	Withdraw register: 100*peso on: cuenta1.
	
	accountSummary := AccountSummary from: cuenta1.
	
	summary := OrderedCollection new.
	
	summary add: 'Extraccion por 100 * pesos'.
	summary add: 'Balance = -100 * pesos'.
	
	self assert: summary = accountSummary summary.
	! !

!ReportTest methodsFor: 'testing for account summary' stamp: 'i 11/17/2022 16:24:24'!
test04ElAccountSummaryDeUnaReceptiveAccountRespetaElFormatoDeTransferencia

	| cuenta1 summaryDeLaCuenta1 summaryDeLaCuenta2 cuenta2 account1Summary account2Summary |
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	Transfer amount: 100*peso from: cuenta1 to: cuenta2.
	
	account1Summary := AccountSummary from: cuenta1.
	account2Summary := AccountSummary from: cuenta2.
	
	summaryDeLaCuenta1 := OrderedCollection new.
	summaryDeLaCuenta2 := OrderedCollection new.
	
	summaryDeLaCuenta1 add: 'Salida por transferencia de 100 * pesos'.
	summaryDeLaCuenta2 add: 'Entrada por transferencia de 100 * pesos'.
	summaryDeLaCuenta1 add: 'Balance = -100 * pesos'.
	summaryDeLaCuenta2 add: 'Balance = 100 * pesos'.
	
	self assert: summaryDeLaCuenta1 = account1Summary summary.
	self assert: summaryDeLaCuenta2 = account2Summary summary.

	! !

!ReportTest methodsFor: 'testing for account summary' stamp: 'i 11/17/2022 16:24:39'!
test05ElAccountSummaryDeUnPortfolioSinTransaccionesDevuelveUnBalanceDe0Pesos

	| portfolio1 accountSummary summary |
	
	portfolio1 := Portfolio new.
	
	accountSummary := AccountSummary from: portfolio1 .
	
	summary := OrderedCollection new.
	
	summary add: 'Balance = 0 * pesos'.
	
	self assert: summary = accountSummary  summary.! !

!ReportTest methodsFor: 'testing for account summary' stamp: 'i 11/17/2022 16:24:54'!
test06ElAccountSummaryDeUnPortfolioRespetaElFormatoDeTransferencia

	| portfolio1 cuenta1 cuenta2 summary accountSummary |
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	portfolio1 := Portfolio new.
	portfolio1 add: cuenta1.
	
	Transfer amount: 100*peso from: cuenta1 to: cuenta2.
	
	accountSummary := AccountSummary from: portfolio1 .
	
	summary := OrderedCollection new.
	
	summary add: 'Salida por transferencia de 100 * pesos'.
	summary add: 'Balance = -100 * pesos'.
	
	self assert: summary = accountSummary  summary.! !


!classDefinition: #SpecialReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #SpecialReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SpecialReportTest methodsFor: 'testing de detailed tree printer' stamp: 'i 11/18/2022 15:35:17'!
test05DetailedTreePrinterDeUnPortfolioVacioMuestraElNombreDelPortfolioYSuBalance

	| portfolio1 portfolioDetailedTreePrinter1 reporteEsperado |
	
	portfolio1 := Portfolio named: 'portfolio1'.
	
	portfolioDetailedTreePrinter1 := PortfolioDetailedTreePrinter from: portfolio1.
	
	reporteEsperado := 
	
	'portfolio1
        Balance = 0 * pesos'.

	self assert: reporteEsperado = portfolioDetailedTreePrinter1 summary.! !

!SpecialReportTest methodsFor: 'testing de detailed tree printer' stamp: 'i 11/18/2022 15:38:18'!
test06DetailedTreePrinterDeUnPortfolioConUnaCuentaDentroIncluyeElResumenDeLaCuenta

	| portfolio1 portfolioDetailedTreePrinter1 reporteEsperado cuenta1 |
	
	portfolio1 := Portfolio named: 'portfolio1'.
	
	cuenta1 := ReceptiveAccount named: 'cuenta1'.
	
	Deposit register: 100*peso on: cuenta1.
	
	portfolio1 add: cuenta1.
	
	portfolioDetailedTreePrinter1 := PortfolioDetailedTreePrinter from: portfolio1.
	
	reporteEsperado := 
	'portfolio1
        cuenta1
                Deposito por 100 * pesos
                Balance = 100 * pesos
        Balance = 100 * pesos'.

	self assert: reporteEsperado = portfolioDetailedTreePrinter1 summary.! !

!SpecialReportTest methodsFor: 'testing de detailed tree printer' stamp: 'i 11/18/2022 15:41:41'!
test07ElDetailedTreePrinterAplicadoAUnPortfolioConMuchasCuentasYPortfoliosAnidadosRespetaElFormatoDeArbol

	|  portfolioDetailedTreePrinter reporteEsperado  angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount cuentax |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	cuentax := ReceptiveAccount new. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta Mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter from: familyPortfolio.
	
	Deposit register: 100*peso on: myAccount .
	Withdraw register: 100*peso on: myAccount .
	
	Deposit register: 100*peso on: johnsAccount .
	Withdraw register: 100*peso on: johnsAccount .
	
	Transfer amount: 100*peso from: angiesAccount to: cuentax.
	
	reporteEsperado := 
	'Portfolio de la familia
        Cuenta Mia
                Deposito por 100 * pesos
                Extraccion por 100 * pesos
                Balance = 0 * pesos
        Portfolio de hijos
                Cuenta de Juan
                        Deposito por 100 * pesos
                        Extraccion por 100 * pesos
                        Balance = 0 * pesos
                Cuenta de Angeles
                        Salida por transferencia de 100 * pesos
                        Balance = -100 * pesos
                Balance = -100 * pesos
        Balance = -100 * pesos'.

	self assert: reporteEsperado = portfolioDetailedTreePrinter summary.! !


!SpecialReportTest methodsFor: 'testing de tree printer' stamp: 'i 11/18/2022 15:24:33'!
test01TreePrinterDeUnPortfolioVacioSoloEstaCompuestoPorSuNombre
	| portfolio1 portfolioTreePrinter1 |
	
	portfolio1 := Portfolio named: 'portfolio1'.
	
	portfolioTreePrinter1 := PortfolioTreePrinter from: portfolio1.
	
	self assert: 'portfolio1' = portfolioTreePrinter1 summary.
	! !

!SpecialReportTest methodsFor: 'testing de tree printer' stamp: 'i 11/18/2022 15:26:39'!
test02TreePrinterDeUnPortfolioConUnaCuentaRespetaLaIndentacion

	| portfolio1 portfolioTreePrinter1 cuenta1 reporteEsperado |
	
	portfolio1 := Portfolio named: 'portfolio1'.
	
	cuenta1 := ReceptiveAccount named: 'cuenta1'.
	portfolio1  add: cuenta1.
	
	portfolioTreePrinter1 := PortfolioTreePrinter from: portfolio1.
	
	reporteEsperado := 
	'portfolio1
        cuenta1'.

	self assert: reporteEsperado = portfolioTreePrinter1 summary.
	! !

!SpecialReportTest methodsFor: 'testing de tree printer' stamp: 'i 11/18/2022 15:30:51'!
test03TreePrinterDeUnPortfolioQueTieneOtroPortfolioConUnaCuentaDentroMuestraElFormatoDeArbol

	| portfolio1 portfolioTreePrinter1 cuenta1 reporteEsperado cuenta2 portfolio2 |
	
	portfolio1 := Portfolio named: 'portfolio1'.
	portfolio2 := Portfolio named: 'portfolio2'.
	
	cuenta1 := ReceptiveAccount named: 'cuenta1'.
	cuenta2 := ReceptiveAccount named: 'cuenta2'.
	
	portfolio1  add: cuenta1.
	portfolio2  add: cuenta2.
	portfolio1  add: portfolio2.
	
	portfolioTreePrinter1 := PortfolioTreePrinter from: portfolio1.
	
	reporteEsperado := 
	'portfolio1
        cuenta1
        portfolio2
                cuenta2'.

	self assert: reporteEsperado = portfolioTreePrinter1 summary.
	! !

!SpecialReportTest methodsFor: 'testing de tree printer' stamp: 'i 11/18/2022 15:41:27'!
test04ElSummaryDelTreePrinterEnUnPortfolioConCuentasYPortfoliosAdentroEsElEsperado

	|  portfolioTreePrinter1  reporteEsperado   angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	portfolioTreePrinter1 := PortfolioTreePrinter from: familyPortfolio.
	
	reporteEsperado := 
	'Portfolio de la familia
        Cuenta mia
        Portfolio de hijos
                Cuenta de Juan
                Cuenta de Angeles'.

	self assert: reporteEsperado = portfolioTreePrinter1 summary.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'add to report' stamp: 'i 11/17/2022 17:28:18'!
addToReport: unReporte

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 't 11/16/2022 19:07:13'!
initializeNamed: unNombreDelPortoflio 

	nombre := unNombreDelPortoflio.! !

!Portfolio methodsFor: 'initialization' stamp: 't 11/16/2022 23:10:14'!
initializeNamed: unNombreDelPortoflio with: unaCuenta with: otraCuenta

	nombre := unNombreDelPortoflio.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	
	accounts add: unaCuenta.
	accounts add: otraCuenta.
	! !


!Portfolio methodsFor: 'main protocol' stamp: 't 11/16/2022 20:57:23'!
accounts
	^accounts.! !

!Portfolio methodsFor: 'main protocol' stamp: 't 11/13/2022 18:59:11'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'i 11/18/2022 15:52:50'!
nombre

	^nombre! !

!Portfolio methodsFor: 'main protocol' stamp: 'i 11/15/2022 21:29:50'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'add to report' stamp: 'i 11/17/2022 17:29:00'!
addToReport: unReporte
	
	^unReporte addPortfolio: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation' stamp: 't 11/16/2022 19:05:59'!
named: unNombreDelPortoflio 

	^self new initializeNamed: unNombreDelPortoflio. ! !

!Portfolio class methodsFor: 'instance creation' stamp: 't 11/16/2022 23:05:48'!
named: unNombre with: unaCuenta with: otraCuenta 
	
	^self new initializeNamed: unNombre with: unaCuenta with: otraCuenta. ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 't 11/16/2022 19:13:18'!
initializeNamed: unNombre 
	nombre := unNombre.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'i 11/16/2022 17:43:10'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'i 11/18/2022 15:53:16'!
nombre

	^nombre.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'i 11/16/2022 14:50:23'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'i 11/15/2022 21:28:44'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'i 11/15/2022 21:32:39'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'add to report' stamp: 'i 11/17/2022 17:29:22'!
addToReport: unReporte
	
	^unReporte addReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 't 11/16/2022 19:12:56'!
named: unNombre 
	^self new initializeNamed: unNombre ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'i 11/16/2022 18:33:06'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'i 11/16/2022 18:37:24'!
valueForBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'add to report' stamp: 'i 11/16/2022 17:27:11'!
addToReport: unReport

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'i 11/16/2022 17:41:35'!
affectBalance: aBalance

	^aBalance + value ! !

!Deposit methodsFor: 'balance' stamp: 'i 11/18/2022 15:57:02'!
valueForBalance

	^ value! !


!Deposit methodsFor: 'add to report' stamp: 'i 11/16/2022 17:27:46'!
addToReport: unReport

	^unReport addDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'i 11/16/2022 17:44:59'!
value

	^transfer value! !

!TransferLeg methodsFor: 'value' stamp: 'i 11/16/2022 18:38:13'!
valueForBalance

	self subclassResponsibility ! !


!TransferLeg methodsFor: 'initialization' stamp: 't 11/13/2022 18:17:35'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'add to report' stamp: 'i 11/16/2022 17:28:05'!
addToReport: unReport

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 't 11/13/2022 18:17:49'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !

!TransferDepositLeg methodsFor: 'balance' stamp: 'i 11/16/2022 18:38:27'!
valueForBalance

	^transfer value! !


!TransferDepositLeg methodsFor: 'add to report' stamp: 'i 11/16/2022 17:28:25'!
addToReport: unReport

	^unReport addTransferDeposit: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !

!TransferWithdrawLeg methodsFor: 'balance' stamp: 'i 11/16/2022 18:38:37'!
valueForBalance

	^transfer value negated! !


!TransferWithdrawLeg methodsFor: 'add to report' stamp: 'i 11/16/2022 17:28:43'!
addToReport: unReport

	^unReport addTransferWithdraw: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'i 11/16/2022 18:27:10'!
affectBalance: aBalance

	^aBalance - value! !

!Withdraw methodsFor: 'balance' stamp: 'i 11/16/2022 18:38:56'!
valueForBalance

	^value negated! !


!Withdraw methodsFor: 'add to report' stamp: 'i 11/16/2022 17:28:57'!
addToReport: unReport

	^unReport addWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'main protocol' stamp: 't 11/13/2022 20:43:37'!
summary

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 't 11/13/2022 20:44:43'!
from: unaCuenta

	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'cuenta'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'i 11/15/2022 21:13:34'!
initializeWith: unaCuenta
	
	cuenta := unaCuenta ! !


!AccountSummary methodsFor: 'main protocol' stamp: 'i 11/17/2022 16:22:50'!
summary

	
	| resumen |
	
	resumen := OrderedCollection new.
	
	cuenta transactions do: [:unaTransaccion | resumen add: (self lineaDelResumenSegun: unaTransaccion)].
	resumen add: self balanceDeLaCuenta.
	
	^resumen



		"| resumen |
	
	resumen := ''.
	
	cuenta transactions do: [:unaTransaccion | 
	resumen := (self lineaDelResumenSegun: unaTransaccion) appendToString: resumen.
	resumen := self agregarEnterA: resumen.
	].
	resumen := self balanceDeLaCuenta appendToString: resumen.
	
	^resumen"! !


!AccountSummary methodsFor: 'private' stamp: 'i 11/16/2022 17:30:21'!
addDeposit: unDeposito

	^'Deposito por ',unDeposito value asString! !

!AccountSummary methodsFor: 'private' stamp: 'i 11/16/2022 17:30:37'!
addTransferDeposit: unDepositoDeTransferencia

	^'Entrada por transferencia de ',unDepositoDeTransferencia value asString! !

!AccountSummary methodsFor: 'private' stamp: 'i 11/16/2022 17:30:51'!
addTransferWithdraw: unWithdrawDeTransferencia

	^'Salida por transferencia de ', unWithdrawDeTransferencia value asString! !

!AccountSummary methodsFor: 'private' stamp: 'i 11/16/2022 17:29:22'!
addWithdraw: unWithdraw

	^'Extraccion por ',unWithdraw value asString! !

!AccountSummary methodsFor: 'private' stamp: 'i 11/17/2022 16:10:08'!
balanceDeLaCuenta

	^'Balance = ', cuenta balance asString! !

!AccountSummary methodsFor: 'private' stamp: 'i 11/17/2022 17:26:23'!
lineaDelResumenSegun: unaTransaccion
	^unaTransaccion addToReport: self.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'i 11/15/2022 21:13:03'!
from: unaCuenta

	^self new initializeWith: unaCuenta.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'cuenta'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'initialization' stamp: 'i 11/16/2022 14:46:44'!
initializeWith: unaCuenta 

	cuenta := unaCuenta.! !


!TransferNet methodsFor: 'main protocol' stamp: 'i 11/18/2022 15:50:00'!
summary
			
	^cuenta transactions sum: [ :aTransaction | self valueForReport: aTransaction ] ifEmpty: [ 0*peso ]! !


!TransferNet methodsFor: 'private' stamp: 'i 11/16/2022 18:39:46'!
addDeposit: unDeposito
	^0*peso! !

!TransferNet methodsFor: 'private' stamp: 'i 11/16/2022 18:39:59'!
addTransferDeposit: unDepositoDeTransferencia
	^ unDepositoDeTransferencia valueForBalance ! !

!TransferNet methodsFor: 'private' stamp: 'i 11/16/2022 18:40:08'!
addTransferWithdraw: unWithdrawDeTransferencia
	^unWithdrawDeTransferencia valueForBalance ! !

!TransferNet methodsFor: 'private' stamp: 'i 11/16/2022 18:40:16'!
addWithdraw: unWithdraw
	^0*peso
! !

!TransferNet methodsFor: 'private' stamp: 'i 11/16/2022 18:05:51'!
valueForReport: unaTransaccion

	^unaTransaccion addToReport: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'i 11/16/2022 14:46:20'!
from: unaCuenta

	^self new initializeWith: unaCuenta.! !


!classDefinition: #SpecialReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #SpecialReport
	instanceVariableNames: 'portfolio profundidad reporte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SpecialReport methodsFor: 'reports' stamp: 'i 11/18/2022 16:01:34'!
summary

	^self summaryEnFormatoDeArbolConProfundidad: 1.! !


!SpecialReport methodsFor: 'private' stamp: 'i 11/18/2022 16:05:08'!
agregarDescripcionDeCuentasAlReporteCon: unaProfundidad

	reporte := portfolio nombre.
	
	portfolio accounts do: [:unaCuenta |
		
		profundidad := unaProfundidad .
		
		reporte := self agregarEnterA: reporte.
		(unaProfundidad) timesRepeat: [reporte := self agregarTabA: reporte].
		
		reporte := unaCuenta addToReport: self.
	].

	^reporte.! !

!SpecialReport methodsFor: 'private' stamp: 'i 11/18/2022 16:07:18'!
agregarEnterA: unReporte
	^'
' appendToString: unReporte.	! !

!SpecialReport methodsFor: 'private' stamp: 'i 11/18/2022 16:07:24'!
agregarTabA: unReporte
	^'        ' appendToString: unReporte! !

!SpecialReport methodsFor: 'private' stamp: 'i 11/18/2022 16:02:33'!
summaryEnFormatoDeArbolConProfundidad: unaProfundidad
	self subclassResponsibility ! !


!SpecialReport methodsFor: 'add accounts' stamp: 'i 11/17/2022 18:35:41'!
addPortfolio: unPortfolio
	self subclassResponsibility ! !

!SpecialReport methodsFor: 'add accounts' stamp: 'i 11/17/2022 18:36:01'!
addReceptiveAccount: unaReceptiveAccount
	self subclassResponsibility ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
SpecialReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'initialization' stamp: 'i 11/18/2022 16:05:08'!
initializeWith: aPortfolio 

	portfolio := aPortfolio.
	profundidad := 0.
	reporte := ''.! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'i 11/17/2022 16:11:06'!
balanceDelPortfolio

	^'Balance = ', portfolio balance asString! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'i 11/18/2022 16:07:52'!
summaryEnFormatoDeArbolConProfundidad: unaProfundidad
	
	self agregarDescripcionDeCuentasAlReporteCon: unaProfundidad.

	reporte := self agregarEnterA: reporte .
	unaProfundidad timesRepeat: [reporte := self agregarTabA: reporte].
	
	reporte := self balanceDelPortfolio appendToString: reporte.
	
	^reporte.! !


!PortfolioDetailedTreePrinter methodsFor: 'add accounts' stamp: 'i 11/18/2022 16:05:08'!
addPortfolio: unPortfolio

	^((PortfolioDetailedTreePrinter from: unPortfolio) summaryEnFormatoDeArbolConProfundidad: (profundidad + 1)) appendToString: reporte! !

!PortfolioDetailedTreePrinter methodsFor: 'add accounts' stamp: 'i 11/18/2022 16:06:38'!
addReceptiveAccount: unaReceptiveAccount

	| stringQueAportaProfundidad |
			
	reporte := (unaReceptiveAccount nombre) appendToString: reporte .
		
	(AccountSummary from: unaReceptiveAccount) summary do:[:elementoDeAccountSummary |
	stringQueAportaProfundidad := ''.
	reporte := self agregarEnterA: reporte.
	
	(profundidad + 1) timesRepeat: [stringQueAportaProfundidad := self agregarTabA: stringQueAportaProfundidad.].
	stringQueAportaProfundidad := elementoDeAccountSummary appendToString: stringQueAportaProfundidad .
	
	reporte := 	stringQueAportaProfundidad appendToString: reporte
	].

	^reporte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'instance creation' stamp: 't 11/16/2022 23:43:43'!
from: aPortfolio 
	^self new initializeWith: aPortfolio! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
SpecialReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'i 11/18/2022 16:05:08'!
initializeWith: aPortfolio 

	portfolio := aPortfolio.
	profundidad := 0.
	reporte := ''
! !


!PortfolioTreePrinter methodsFor: 'private' stamp: 'i 11/18/2022 16:03:48'!
summaryEnFormatoDeArbolConProfundidad: unaProfundidad

	^self agregarDescripcionDeCuentasAlReporteCon: unaProfundidad.! !


!PortfolioTreePrinter methodsFor: 'add accounts' stamp: 'i 11/18/2022 16:05:08'!
addPortfolio: unPortfolio
	^((PortfolioTreePrinter from: unPortfolio) summaryEnFormatoDeArbolConProfundidad: (profundidad + 1)) appendToString: reporte! !

!PortfolioTreePrinter methodsFor: 'add accounts' stamp: 'i 11/17/2022 17:39:26'!
addReceptiveAccount: unaReceptiveAccount
	^(unaReceptiveAccount nombre) appendToString: reporte ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 't 11/16/2022 19:14:10'!
from: aPortfolio 
	^self new initializeWith: aPortfolio ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'i 11/15/2022 21:29:17'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
