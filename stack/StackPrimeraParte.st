!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:24:43'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 15:46:09'!
test02StackShouldNotBeEmptyWhenSeAgregaUnElemento

	| stack |
	
	stack := Stack new.
	
	stack push: 2.
	
	self deny: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 15:47:53'!
test03StackShouldBeEmptyWhenSeAgregaUnElementoYDespuesSeLoSaca

	| stack |
	
	stack := Stack new.
	
	stack push: 2.
	
	stack pop.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 15:50:38'!
test04PopDevuelveElUltimoElemento

	| stack ultimoElemento |
	
	stack := Stack new.
	
	stack push: 1.
	stack push: 2.
	stack push: 3.
	
	ultimoElemento := stack pop.
	
	self assert: ultimoElemento = 3.! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:48:44'!
test05NoSePuedeHacerPopDeStackVacio

	| stack |
	
	stack := Stack new.
	
	self testearClosureQueFalla: [stack pop] yHacer: [ :anError | 
			self assert: anError messageText = Stack stackNoPuedeEstarVacioMensajeDeError.
			self assert: stack isEmpty ] conErrorDelTipo: Error.! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:12:34'!
test06SePuedeObtenerUlltimoElementoSinRemoverlo

	| stack ultimoElemento |
	
	stack := Stack new.
	
	stack push: 1.
	stack push: 2.
	stack push: 3.
	
	ultimoElemento := stack top.
	
	self assert: ultimoElemento = 3 & stack cantidadDeElementos = 3.! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:49:51'!
test07NoSePuedeHacerTopDeStackVacio

	| stack |
	
	stack := Stack new.
	
	self testearClosureQueFalla: [stack top] yHacer: [ :anError | 
			self assert: anError messageText = Stack stackNoPuedeEstarVacioMensajeDeError.
			self assert: stack isEmpty ] conErrorDelTipo: Error.! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:53:20'!
test08CantidadDeElementosEsCeroCuandoSeInicializa

	| stack |
	
	stack := Stack new.
	
	self assert: stack cantidadDeElementos = 0.! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:58:38'!
test09PopDevuelveElUltimoElementoCorrectamenteCuandoSeAgreganMuchosElementos

	| stack ultimoElemento iterador |
	
	stack := Stack new.
	
	iterador := 0.
	
	100 timesRepeat: [stack push: iterador.
	iterador := iterador + 1.	
	].

	50 timesRepeat: [stack pop].
	
	ultimoElemento := stack pop.
	
	self assert: ultimoElemento = 49.! !

!StackTest methodsFor: 'tests' stamp: 'i 10/7/2022 16:46:46'!
testearClosureQueFalla: bloqueQueFalla yHacer: bloqueDeSalida conErrorDelTipo: unError

	[ bloqueQueFalla value.
	self fail ]
		on: unError 
		do: bloqueDeSalida.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'mensajes de error' stamp: 'i 10/7/2022 16:43:36'!
signalCollectionEstaVacia

	self error: self class stackNoPuedeEstarVacioMensajeDeError ! !


!Stack methodsFor: 'inicializacion' stamp: 'i 10/7/2022 16:27:55'!
initialize

	collection := OrderedCollection new.! !


!Stack methodsFor: 'operaciones del stack' stamp: 'i 10/7/2022 16:38:49'!
cantidadDeElementos
	^ collection size.! !

!Stack methodsFor: 'operaciones del stack' stamp: 'i 10/7/2022 16:28:40'!
isEmpty

	^collection isEmpty.! !

!Stack methodsFor: 'operaciones del stack' stamp: 'i 10/7/2022 16:51:52'!
pop
	collection isEmpty ifTrue:[self signalCollectionEstaVacia].
	
	^collection removeLast.
	! !

!Stack methodsFor: 'operaciones del stack' stamp: 'i 10/7/2022 16:31:07'!
push: elementoAGuardar

	collection addLast: elementoAGuardar.! !

!Stack methodsFor: 'operaciones del stack' stamp: 'i 10/7/2022 16:50:35'!
top
	collection isEmpty ifTrue:[self signalCollectionEstaVacia].
	
	^collection last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'as yet unclassified' stamp: 'i 10/7/2022 16:44:44'!
stackNoPuedeEstarVacioMensajeDeError

	^'El stack no puede estar vacio'! !
