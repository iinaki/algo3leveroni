!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:25:39'!
assertaQueConElRover: unMarsRover alMandarleLosComandos: unaSerieDeComandos quedaEnLasCoordenadas: unasCoordenadas yApuntandoA: unPuntoCardinal
	
	unMarsRover recibirComandos: unaSerieDeComandos.
	
	self assert: (unMarsRover estaUbicadoEn: unasCoordenadas).
	self assert: (unMarsRover estaApuntandoA: unPuntoCardinal).! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:24:00'!
test01SiLeMandamosUnComandoVacioNoHaceNada

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #() quedaEnLasCoordenadas: 1@1 yApuntandoA: #N! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:25:49'!
test02ApuntaAlNorteYConLeftApuntaAlOeste
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #O! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:26:16'!
test03ApuntaAlOesteYConLeftApuntaAlSur
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #S! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:26:43'!
test04ApuntaAlSurYConLeftApuntaAlEste

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #E! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:26:59'!
test05ApuntaAlEsteYConLeftApuntaAlNorte
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #N! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:27:38'!
test06ApuntaAlNorteYConRightApuntaAlEste
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #E
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:28:00'!
test07ApuntaAlEsteYConRightApuntaAlSur
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #S
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:28:20'!
test08ApuntaAlSurYConRightApuntaAlOeste
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #O
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:28:59'!
test09ApuntaAlOesteYConRightApuntaAlNorte
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #N
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:29:33'!
test10ApuntaAlNorteYConForwardAvanzaEnElEjeY
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 1@2 yApuntandoA: #N
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:29:57'!
test11ApuntaAlNorteYConBackRetrocedeEnElEjeY

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 1@0 yApuntandoA: #N
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:30:25'!
test12ApuntaAlEsteYConForwardAvanzaEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 2@1 yApuntandoA: #E
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:30:53'!
test13ApuntaAlEsteYConBackRetrocedeEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 0@1 yApuntandoA: #E
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:31:15'!
test14ApuntaAlOesteYConForwardRetrocedeEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 0@1 yApuntandoA: #O
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:31:41'!
test15ApuntaAlOesteYConBackAvanzaEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 2@1 yApuntandoA: #O
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:32:06'!
test16ApuntaAlSurYConForwardRetrocedeEnElEjeY
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 1@0 yApuntandoA: #S
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:32:37'!
test17ApuntaAlSurYConBackAvanzaEnElEjeY

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 1@2 yApuntandoA: #S
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:56:26'!
test18RecibirUnSoloComandoInvalidoTiraError

	| marsRover |
	
	marsRover := MarsRover ubicadoEn: 1@1 apuntandoA: #E.
	
	self
        should: [ marsRover recibirComandos: #(Q) ]
        raise: Error - MessageNotUnderstood 
        withExceptionDo: [ :anError |
            self assert: 'Se recibio un comando invalido' equals: anError messageText ].

	self assert: (marsRover estaUbicadoEn: 1@1).
	self assert: (marsRover estaApuntandoA: #E).! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:56:18'!
test19RecibirUnComandoInvalidoCortaLaEjecucionDeComandosYTiraError

	| marsRover |
	
	marsRover := MarsRover ubicadoEn: 1@1 apuntandoA: #E.
	
	self
        should: [ marsRover recibirComandos: #(F F Q L F) ]
        raise: Error - MessageNotUnderstood 
        withExceptionDo: [ :anError |
            self assert: 'Se recibio un comando invalido' equals: anError messageText ].

	self assert: (marsRover estaUbicadoEn: 3@1).
	self assert: (marsRover estaApuntandoA: #E).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenada puntoCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'i 10/30/2022 16:57:40'!
initializeUbicadoEn: unaCoordenada apuntandoA: unPuntoCardinal 

	coordenada := unaCoordenada.
	puntoCardinal := unPuntoCardinal.! !


!MarsRover methodsFor: 'movimiento del rover' stamp: 'i 10/30/2022 18:47:18'!
estaApuntandoA: unPuntoCardinal 
	^puntoCardinal = unPuntoCardinal.! !

!MarsRover methodsFor: 'movimiento del rover' stamp: 'i 10/30/2022 18:46:33'!
estaUbicadoEn: unaCoordenada 
	^coordenada = unaCoordenada.! !

!MarsRover methodsFor: 'movimiento del rover' stamp: 'i 10/30/2022 19:51:54'!
recibirComandos: anArray 
	anArray isEmpty ifTrue: [^self].
	
	anArray do: [:unComando |
		(self comandoInvalido: unComando) ifTrue: [^self error: 'Se recibio un comando invalido'].
		self recibirComando: unComando.
	].
	
	! !


!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:31:48'!
avanzar
	puntoCardinal = #N ifTrue: [self avanzarEnEjeY].
	puntoCardinal = #O ifTrue: [self retrocederEnEjeX].
	puntoCardinal = #S ifTrue: [self retrocederEnEjeY].
	puntoCardinal = #E ifTrue: [self avanzarEnEjeX].! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:55:50'!
avanzarEnEjeX
	coordenada := coordenada + (1@0)! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:51:20'!
avanzarEnEjeY
	coordenada := coordenada + (0@1)! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 18:13:34'!
comandoInvalido: unComando
	
	^unComando ~= #L and: [ unComando ~= #R and: [ unComando ~= #F and:[ unComando ~= #B]]].! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 18:35:09'!
recibirComando: unComando 
	
	unComando = #L ifTrue:[ self rotarALaIzquierda ].
	unComando = #R ifTrue:[ self rotarALaDerecha ].
	unComando = #F ifTrue:[ self avanzar ].
	unComando = #B ifTrue:[ self retroceder ].

	! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:32:42'!
retroceder
	puntoCardinal = #N ifTrue: [self retrocederEnEjeY].
	puntoCardinal = #O ifTrue: [self avanzarEnEjeX].
	puntoCardinal = #S ifTrue: [self avanzarEnEjeY].
	puntoCardinal = #E ifTrue: [self retrocederEnEjeX].! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:56:52'!
retrocederEnEjeX
	coordenada := coordenada - (1@0)! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:52:51'!
retrocederEnEjeY
	coordenada := coordenada - (0@1)! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:23:32'!
rotarALaDerecha
	puntoCardinal = #N ifTrue: [puntoCardinal := #E. ^self].
	puntoCardinal = #O ifTrue: [puntoCardinal := #N. ^self].
	puntoCardinal = #S ifTrue: [puntoCardinal := #O. ^self].
	puntoCardinal = #E ifTrue: [puntoCardinal := #S].! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 17:21:10'!
rotarALaIzquierda
	puntoCardinal = #N ifTrue: [puntoCardinal := #O. ^self].
	puntoCardinal = #O ifTrue: [puntoCardinal := #S. ^self].
	puntoCardinal = #S ifTrue: [puntoCardinal := #E. ^self].
	puntoCardinal = #E ifTrue: [puntoCardinal := #N].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'i 10/30/2022 16:55:53'!
ubicadoEn: aPoint apuntandoA: aSymbol 

	^self new initializeUbicadoEn: aPoint apuntandoA: aSymbol ! !
