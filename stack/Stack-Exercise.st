!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'i 10/14/2022 16:51:17'!
test10CanNotTopWhenThereAreNoObjectsInTheStack
	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'i 10/14/2022 16:58:21'!
test11PushWithLimitsAddsElements
	| stack |
	stack := OOStack conLimiteDe: 3.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'i 10/14/2022 17:09:40'!
test12SiSePusheaHastaElLimiteNoSePuedeSeguirPusheando

	| stack |
	stack := OOStack conLimiteDe: 3.
	
	stack push: 'something1'.
	stack push: 'something2'.
	 stack push: 'something3'.
	
	self
		should: [ stack push: 'something4'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackFullErrorDescription equals: anError messageText ].
! !

!OOStackTest methodsFor: 'test' stamp: 'i 10/14/2022 17:17:09'!
test13NoSePuedeCrearStackConLimiteNegativo
	
	self
		should: [ OOStack conLimiteDe: -5. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack limiteNegativoErrorDescription equals: anError messageText ].
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/14/2022 15:48:36'!
comparacionDeStack1: stack1 conStack2: stack2

	| tamanioInicial |
	
	stack1 size = stack2 size ifFalse:[^false].
	
	tamanioInicial := stack1 size.
	
	tamanioInicial timesRepeat: [ (stack1 pop = stack2 pop) ifFalse: [^false] ].
	
	^true.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/13/2022 00:46:07'!
test01APrefixEmptyReturnAnError
	| stack finder |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'coscu'.
	stack push: 'cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	stack := OOStack new.
	
	self
		should: [ finder find: '' ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: SentenceFinderByPrefix prefixNotValid equals: anError messageText ].
		! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/13/2022 00:46:14'!
test02PrefijoNoPuedeTenerEspaciosVacios
	| stack finder |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'coscu'.
	stack push: 'cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	stack := OOStack new.
	
	self
		should: [ finder find: 'hola como estas?' ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: SentenceFinderByPrefix prefixNotValid equals: anError messageText ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/13/2022 00:46:19'!
test03PrefijoNoPuedeEmpezarConEspaciosVacios
	| stack finder |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'coscu'.
	stack push: 'cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	stack := OOStack new.
	
	self
		should: [ finder find: ' hola como estas?' ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: SentenceFinderByPrefix prefixNotValid equals: anError messageText ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/12/2022 23:39:04'!
test04FindTiraErrorCuandoBuscamosAlgoEnMayusculaYEstaPeroEnMinuscula
	| stack finder |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'coscu'.
	stack push: 'cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.

	self
		should: [ finder find: 'Cos' ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: SentenceFinderByPrefix prefixNotFoundErrorDescription equals: anError messageText ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/13/2022 00:57:14'!
test06FindEncuentraNashei
	| stack finder |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'Coscu'.
	stack push: 'cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	self assert: (finder find: 'nas') first = #('nashei') first.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/13/2022 00:57:42'!
test07FindEncuentraCoscu
	| stack finder |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'Coscu'.
	stack push: 'cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	self assert: (finder find: 'Co') first = #('Coscu') first.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/13/2022 01:00:28'!
test08FindEncuentraACoscuYACosculluela
	| stack finder collectionParaComparar |
	
	stack := OOStack new.
	
	stack push: 'holaa'.
	stack push: 'chauu'.
	stack push: 'nashei'.
	stack push: 'Coscu'.
	stack push: 'Cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	collectionParaComparar := OrderedCollection new.
	
	collectionParaComparar addAll: #('Cosculluela' 'Coscu').
	
	self assert: (finder find: 'Co') = collectionParaComparar.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/14/2022 15:49:22'!
test09FindNoCambiaLaEstructuraDelStack
	| stack stackAntesDeBuscar finder |
	
	stack := OOStack new.
	stackAntesDeBuscar := OOStack new.
	
	stack push: 'holaa'.
	stackAntesDeBuscar push: 'holaa'.
	
	stack push: 'chauu'.
	stackAntesDeBuscar push: 'chauu'.
	
	stack push: 'nashei'.
	stackAntesDeBuscar push: 'nashei'.
	
	stack push: 'Coscu'.
	stackAntesDeBuscar push: 'Coscu'.
	
	stack push: 'Cosculluela'.
	stackAntesDeBuscar push: 'Cosculluela'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	finder find: 'Co'.
	
	self assert: (self comparacionDeStack1: stack conStack2: stackAntesDeBuscar).
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'i 10/14/2022 16:26:01'!
test10EjemploDeConsigna
	| stack finder collectionParaComparar |
	
	stack := OOStack new.
	
	stack push: 'winter is coming'.
	
	stack push: 'winning is everything'.
	
	stack push: 'The winds of Winter'.
	
	stack push: 'Winter is here'.
	
	finder := SentenceFinderByPrefix with: stack.
	
	collectionParaComparar := OrderedCollection new.
	
	collectionParaComparar addAll: #('Winter is here').
	
	self assert: (finder find: 'Wint') first = #('Winter is here') first.
	
	
	! !


!classDefinition: #Estado category: 'Stack-Exercise'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Estado methodsFor: 'stack operations - double dispatch' stamp: 'i 10/12/2022 23:20:15'!
devolverTope: unStack

	self subclassResponsibility ! !

!Estado methodsFor: 'stack operations - double dispatch' stamp: 'i 10/12/2022 23:20:20'!
eliminarTope: unStack
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Estado class' category: 'Stack-Exercise'!
Estado class
	instanceVariableNames: ''!

!Estado class methodsFor: 'as yet unclassified' stamp: 'i 10/14/2022 16:42:49'!
for: unStack

	| subclaseDetectada |
	
	subclaseDetectada := Estado subclasses detect: [:EstadoSubclass | (EstadoSubclass correspondeAClase: unStack)].
	
	^subclaseDetectada new! !


!classDefinition: #HayElementosEnLaPila category: 'Stack-Exercise'!
Estado subclass: #HayElementosEnLaPila
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!HayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:54:42'!
devolverTope: unStack

	^unStack topCuandoHayElementos.! !

!HayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:55:22'!
eliminarTope: unStack

	^unStack popCuandoHayElementos! !

!HayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:47:26'!
pushear: elementoAGuardar alStack: unStack.
	^ unStack pushearCuandoNoEstaLleno: elementoAGuardar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HayElementosEnLaPila class' category: 'Stack-Exercise'!
HayElementosEnLaPila class
	instanceVariableNames: ''!

!HayElementosEnLaPila class methodsFor: 'as yet unclassified' stamp: 'i 10/14/2022 17:09:29'!
correspondeAClase: unStack

	^unStack isEmpty not and: [unStack estaLleno not].
	! !


!classDefinition: #LaPilaEstaLlena category: 'Stack-Exercise'!
Estado subclass: #LaPilaEstaLlena
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LaPilaEstaLlena methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:54:59'!
devolverTope: unStack

	^unStack topCuandoHayElementos.! !

!LaPilaEstaLlena methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:55:31'!
eliminarTope: unStack

	^unStack popCuandoHayElementos! !

!LaPilaEstaLlena methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:46:33'!
pushear: elementoAGuardar alStack: unStack.
	^ unStack pushearCuandoEstaLleno.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaPilaEstaLlena class' category: 'Stack-Exercise'!
LaPilaEstaLlena class
	instanceVariableNames: ''!

!LaPilaEstaLlena class methodsFor: 'as yet unclassified' stamp: 'i 10/14/2022 16:43:28'!
correspondeAClase: unStack
	^unStack estaLleno.! !


!classDefinition: #NoHayElementosEnLaPila category: 'Stack-Exercise'!
Estado subclass: #NoHayElementosEnLaPila
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoHayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:41:39'!
devolverTope: unStack

	^unStack topCuandoNoHayElementos.! !

!NoHayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:41:34'!
eliminarTope: unStack

	^unStack popCuandoNoHayElementos.! !

!NoHayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 'i 10/14/2022 16:47:14'!
pushear: elementoAGuardar alStack: unStack.
	^ unStack pushearCuandoNoEstaLleno: elementoAGuardar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoHayElementosEnLaPila class' category: 'Stack-Exercise'!
NoHayElementosEnLaPila class
	instanceVariableNames: ''!

!NoHayElementosEnLaPila class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:58:29'!
correspondeAClase: unStack

	^unStack isEmpty.
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'pila limite'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 16:43:55'!
estaLleno
	^pila size = limite.! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 16:52:06'!
initialize
	pila := OrderedCollection new.! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 17:16:53'!
initializeWith: unLimit
	unLimit < 0 ifTrue: [self signalLimiteNegativo].	

	pila := OrderedCollection new.
	limite := unLimit ! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 15:53:42'!
popCuandoHayElementos
	| elementoADevolver |
	
	elementoADevolver := pila removeLast.
	
	^elementoADevolver. ! !

!OOStack methodsFor: 'private' stamp: 'i 10/12/2022 23:23:01'!
popCuandoNoHayElementos

	^self signalPilaEstaVacia.! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 16:48:34'!
pushearCuandoEstaLleno
	^self signalPilaEstaLlena.! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 16:50:25'!
pushearCuandoNoEstaLleno: elementoAGuardar
	pila addLast:elementoAGuardar.! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 17:15:15'!
signalLimiteNegativo

	self error: self class limiteNegativoErrorDescription! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 16:49:15'!
signalPilaEstaLlena

	self error: self class stackFullErrorDescription! !

!OOStack methodsFor: 'private' stamp: 'i 10/9/2022 15:42:28'!
signalPilaEstaVacia
	self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 15:53:55'!
topCuandoHayElementos

	^pila last.! !

!OOStack methodsFor: 'private' stamp: 'i 10/14/2022 15:53:50'!
topCuandoNoHayElementos

	^self signalPilaEstaVacia.! !


!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/9/2022 15:32:00'!
isEmpty
	^ pila isEmpty.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/14/2022 15:52:09'!
pop	| estado |
	
	estado := Estado for: self.
	 
	^estado eliminarTope: self.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/14/2022 16:45:21'!
push: elementoAGuardar 
	| estado |
	
	estado := Estado for: self.
	
	^estado pushear: elementoAGuardar alStack: self.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/9/2022 15:38:05'!
size
	^pila size.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/14/2022 15:53:03'!
top
	| estado |
	
	estado := Estado for: self.
	
	^estado devolverTope: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'i 10/14/2022 17:12:52'!
limiteNegativoErrorDescription
	^ ' El limite es negativo '! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'i 10/14/2022 16:49:42'!
stackFullErrorDescription

	^ 'Stack is full'! !


!OOStack class methodsFor: 'instance creation' stamp: 'i 10/14/2022 17:14:16'!
conLimiteDe: unLimite
	^OOStack new initializeWith: unLimite! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'i 10/13/2022 01:03:01'!
convertirStackEnCollection
	| listaDeStrings iterador |
	
	listaDeStrings := OrderedCollection new.
	
	[stack isEmpty not] whileTrue: [listaDeStrings addLast: stack pop.].
	
	iterador := listaDeStrings size.
	
	[iterador > 0] whileTrue: [stack push: (listaDeStrings at: iterador). iterador := iterador - 1].
	
	^listaDeStrings 
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'i 10/14/2022 16:31:56'!
esValidoElPrefijo: unPrefijo

	((unPrefijo = '')  or: [(unPrefijo findString: ' ' startingAt: 0) > 0]) ifTrue: [^ false].
	
	^true.
	
	 
	
	

	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'i 10/13/2022 01:11:02'!
initializeWith: unStack

	stack := unStack.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'i 10/13/2022 00:53:33'!
signalPrefixNotFound
	self error: self class prefixNotFoundErrorDescription! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'i 10/13/2022 00:47:18'!
signalPrefixNotValid
	self error: self class prefixNotValid! !


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'i 10/14/2022 16:26:23'!
find: prefijo
	| listaDeStrings listaDeStringsEncontrados |
	
	(self esValidoElPrefijo: prefijo) ifFalse: [^self signalPrefixNotValid].
	
	listaDeStrings := self convertirStackEnCollection.
	
	listaDeStringsEncontrados := listaDeStrings select: [:stringActual | stringActual beginsWith: prefijo].
	
	listaDeStringsEncontrados isEmpty ifTrue: [^self signalPrefixNotFound].
	
	^listaDeStringsEncontrados.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'i 10/12/2022 23:32:43'!
prefixCantHaveSpacesErrorDescription

	^ 'Prefix cant have spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:11:47'!
prefixEmptyErrorDescription

	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'i 10/12/2022 23:31:59'!
prefixNotFoundErrorDescription

	^ 'Prefix is not found'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 00:45:52'!
prefixNotValid

	^ 'Prefix is not valid'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 20:59:05'!
with: unStack

	^SentenceFinderByPrefix new initializeWith: unStack.! !
