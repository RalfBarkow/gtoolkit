"
I am {{gtClass:IceCredentialsProvider}}.
I provide {{gtClass:IcePlaintextCredentials}} and {{gtClass:IceSshCredentials}}.
## Public API
- {{gtMethod:GtNotificationIcebergCredentialsProvider>>#obtainPlaintextCredentials:|label=#selector}}, and
- {{gtMethod:GtNotificationIcebergCredentialsProvider>>#obtainSshCredentials:|label=#selector}}.
## Behavior
I use {{gtClass:GtNotificationIcebergCredentialsElement}} to display user dialogs as a notification. Currently every credentials request is aborted by signaling {{gtClass:LGitNoCredentialsProvided}}. The reason is that we cannot block Bloc UI process to wait for user inputs. As a consequence, a user have to re-execute a code snippet that requieres the credentials.
## Examples
See {{gtClass:GtNotificationIcebergCredentialsElement|show=#gtSubclassesFor:|expanded=true|height=150}} subclasses for specific examples:


"
Class {
	#name : #GtNotificationIcebergCredentialsProvider,
	#superclass : #IceCredentialsProvider,
	#category : #'GToolkit-Notifications-Iceberg'
}

{ #category : #'api - initialization' }
GtNotificationIcebergCredentialsProvider class >> beDefaultProvider [
	IceCredentialsProvider providerType: self
]

{ #category : #'api - initialization' }
GtNotificationIcebergCredentialsProvider class >> disableThisProvider [
	IceCredentialsProvider providerType = self ifTrue: [ 
		IceCredentialsProvider providerType: nil ]
]

{ #category : #'api - accessing' }
GtNotificationIcebergCredentialsProvider class >> threadedFFIPriority [
	"The higher number, the higher preference (importance)"
	<return: #Number>
	^ 10
]

{ #category : #'private - testing' }
GtNotificationIcebergCredentialsProvider >> isFromBloc [
	^ BlParallelUniverse all
			detect: [ :eachUniverse |
				| aResult |
				aResult := false.
				eachUniverse hostClass
					uiProcessDo: [ :eachUIProcess |
						aResult := eachUIProcess = Processor activeProcess ].
				aResult ]
			ifFound: [ :aUniverse | true ]
			ifNone: [ false ].
]

{ #category : #'private - testing' }
GtNotificationIcebergCredentialsProvider >> isFromMorphic [
	| context worldMorphClass |
	worldMorphClass := Smalltalk 
		at: #WorldMorph
		ifAbsent: [ ^ false ].
	context := thisContext.
	[ context notNil ]
		whileTrue: [ (context receiver isKindOf: worldMorphClass)
				ifTrue: [ ^ true ].
			context := context sender ].
	^ false
]

{ #category : #private }
GtNotificationIcebergCredentialsProvider >> obtainPlaintextCredentials: credentialsToReturn [

	GtNotificationIcebergCredentialsSignal 
		mayEmitOnProvider: self 
		credentials: credentialsToReturn.

	self obtainPlaintextCredentialsInBloc: credentialsToReturn.
]

{ #category : #private }
GtNotificationIcebergCredentialsProvider >> obtainPlaintextCredentialsForNonUIProcess: credentialsToReturn [
	
	| aCredentials aNotification aSemaphore isAccepted |
	isAccepted := false.
	aSemaphore := Semaphore new.
	aCredentials := IcePlaintextCredentials new.
	aCredentials host: remote host.
	aNotification := GtNotificationIcebergPlaintextCredentials new
		credentials: aCredentials;
		credentialStore: self credentialStore;
		acceptCallback: [ 
			isAccepted := true.
			aSemaphore signal ];
		cancelCallback: [ 
			isAccepted := false.
			aSemaphore signal ].
	GtWorld showNotification: aNotification.

	aSemaphore wait.

	isAccepted 
		ifTrue: [ credentialsToReturn readFrom: aCredentials ]
		ifFalse: [ LGitNoCredentialsProvided signal ].
]

{ #category : #private }
GtNotificationIcebergCredentialsProvider >> obtainPlaintextCredentialsInBloc: credentialsToReturn [
	
	| aCredentials aNotification |
	
	aCredentials := IcePlaintextCredentials new.
	aCredentials host: remote host.
	aNotification := GtNotificationIcebergPlaintextCredentials new 
		credentials: aCredentials;
		credentialStore: self credentialStore.

	GtNotificationForwarder showNotification: aNotification.

	LGitNoCredentialsProvided signal.
]

{ #category : #private }
GtNotificationIcebergCredentialsProvider >> obtainPlaintextCredentialsInMorphic: credentialsToReturn [
	(IceTipInteractiveCredentialsProvider new 
		remote: remote)
			obtainPlaintextCredentials: credentialsToReturn.
]

{ #category : #private }
GtNotificationIcebergCredentialsProvider >> obtainSshCredentials: response [
	| aCredentials aNotification |
	
	GtNotificationIcebergCredentialsSignal 
		mayEmitOnProvider: self 
		credentials: response.
	
	aCredentials := IceSshCredentials new.
	aCredentials host: remote host.
	aNotification := GtNotificationIcebergSshCredentials new
		credentials: aCredentials;
		credentialStore: self credentialStore.
		
	GtNotificationForwarder showNotification: aNotification.

	LGitNoCredentialsProvided signal.
]
