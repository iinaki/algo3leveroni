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

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 00:46:07'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 00:46:14'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 00:46:19'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/12/2022 23:39:04'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 00:57:14'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 00:57:42'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 01:00:28'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'i 10/13/2022 01:09:18'!
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
	
	self assert: stack devuelveLaPila = stackAntesDeBuscar devuelveLaPila.
	
	
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

!Estado class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:56:59'!
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

!HayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 't 10/12/2022 22:32:04'!
devolverTope: unStack
	
	^unStack topCuandoHayElementos.! !

!HayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 't 10/12/2022 22:31:17'!
eliminarTope: unStack

	^unStack popCuandoHayElementos! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HayElementosEnLaPila class' category: 'Stack-Exercise'!
HayElementosEnLaPila class
	instanceVariableNames: ''!

!HayElementosEnLaPila class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:58:17'!
correspondeAClase: unStack

	^unStack isEmpty not.
	! !


!classDefinition: #NoHayElementosEnLaPila category: 'Stack-Exercise'!
Estado subclass: #NoHayElementosEnLaPila
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoHayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 't 10/12/2022 22:07:11'!
devolverTope: unStack

	^unStack topCuandoNoHayElementos.! !

!NoHayElementosEnLaPila methodsFor: 'stack operations - double dispatch' stamp: 't 10/12/2022 22:33:53'!
eliminarTope: unStack

	^unStack popCuandoNoHayElementos.! !

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
	instanceVariableNames: 'pila status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'i 10/12/2022 23:21:51'!
cambiarEstado

	status := Estado for: self.! !

!OOStack methodsFor: 'private' stamp: 'i 10/13/2022 01:08:57'!
devuelveLaPila
	^pila.! !

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:02:35'!
initialize
	pila := OrderedCollection new.
	status :=  	Estado for: self.! !

!OOStack methodsFor: 'private' stamp: 'i 10/12/2022 23:22:33'!
popCuandoHayElementos
	| elementoADevolver |
	
	elementoADevolver := pila removeLast.
	self cambiarEstado.
	
	^elementoADevolver. ! !

!OOStack methodsFor: 'private' stamp: 'i 10/12/2022 23:23:01'!
popCuandoNoHayElementos

	^self signalPilaEstaVacia.! !

!OOStack methodsFor: 'private' stamp: 'i 10/9/2022 15:42:28'!
signalPilaEstaVacia
	self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:32:04'!
topCuandoHayElementos

	^pila last.! !

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:09:06'!
topCuandoNoHayElementos

	^self signalPilaEstaVacia.! !


!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/9/2022 15:32:00'!
isEmpty
	^ pila isEmpty.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 't 10/12/2022 22:19:37'!
pop
	^status eliminarTope: self.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 't 10/12/2022 22:29:09'!
push: elementoAGuardar 

	pila addLast:elementoAGuardar.
	self cambiarEstado.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 'i 10/9/2022 15:38:05'!
size
	^pila size.! !

!OOStack methodsFor: 'comportamiento de stack' stamp: 't 10/12/2022 19:55:16'!
top
	^status devolverTope: self. 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


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

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'i 10/13/2022 00:51:22'!
esValidoElPrefijo: unPrefijo

	(unPrefijo = '')  ifTrue: [^ false].
	((unPrefijo findString: ' ' startingAt: 0) > 0)  ifTrue: [^ false].
	
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


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'i 10/13/2022 00:53:10'!
find: prefijo
	| listaDeStrings listaDeStringsEncontrados |
	
	(self esValidoElPrefijo: prefijo) ifFalse: [^self signalPrefixNotValid].
	
	listaDeStrings := self convertirStackEnCollection.
	
	listaDeStringsEncontrados := listaDeStrings select: [:stringActual | (stringActual findString: prefijo startingAt: 0) > 0].
	
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
