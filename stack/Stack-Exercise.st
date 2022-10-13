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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:10:01'!
test01

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
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:14:01'!
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
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:15:16'!
test02

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
		should: [ finder find: 'iiiiiiiiiii     holaa' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ]
	
	! !


!classDefinition: #Estado category: 'Stack-Exercise'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Estado methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 22:19:37'!
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

!HayElementosEnLaPila methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 22:32:04'!
devolverTope: unStack
	
	^unStack topCuandoHayElementos.! !

!HayElementosEnLaPila methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 22:31:17'!
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

!NoHayElementosEnLaPila methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 22:07:11'!
devolverTope: unStack

	^unStack topCuandoNoHayElementos.! !

!NoHayElementosEnLaPila methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 22:33:53'!
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

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:29:28'!
cambiarEstado

	status := Estado for: self.! !

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:02:35'!
initialize
	pila := OrderedCollection new.
	status :=  	Estado for: self.! !

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:35:46'!
popCuandoHayElementos

	| elementoADevolver |
	
	elementoADevolver := pila removeLast.
	
	self cambiarEstado.
	
	^elementoADevolver. ! !

!OOStack methodsFor: 'private' stamp: 't 10/12/2022 22:33:53'!
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

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 20:55:50'!
find: prefijo! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:00:45'!
initializeWith: unStack

	stack := unStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 21:11:47'!
prefixEmptyErrorDescription

	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 't 10/12/2022 20:59:05'!
with: unStack

	^SentenceFinderByPrefix new initializeWith: unStack.! !
