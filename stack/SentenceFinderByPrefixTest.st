'From Cuis 6.0 [latest update: #5466] on 13 October 2022 at 1:12:30 am'!
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
