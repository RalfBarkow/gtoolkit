"
# Glamorous Toolkit
Glamorous Toolkit is the moldable development environment. It is a live notebook. It is a flexible search interface. It is a fancy code editor. It is a software analysis platform. It is a data visualization engine. All in one. It is built in Pharo and it is free and open-source under an MIT license.

Glamorous Toolkit offers a fundamentally new perspective on programming. We call it moldable development. We want the environment to fit the context of the current system and when it does not, we want to mold it seamlessly. This change is transformational.

Glamorous Toolkit has cool widgets and fancy code analyses, yet the emphasis is not on the features, but on the way you experience software. Take a look around to see how this feels, but do not stop there. Play with it. And engage with us. We'd love to hear from you: <https://gtoolkit.com>. 
## Moldable development
Glamorous Toolkit is not just a tool. It's a platform that embodies a new approach to software development. The core principle behind the Glamorous Toolkit is moldability. This means that any detail in the system can be viewed in multiple ways. This applies to handling static code, to inspecting individual objects, to debugging or to the way we search. To make this practical, the cost of creating a new view or interaction is small and in most cases the target is to extend the system live during the interaction.

Want to learn more? Take a look at a more detailed explanation of {{gtClass:GtMoldableDevelopmentExplanation|label=moldable development}}.
## Project organization
Glamorous Toolkit is made out of {{gtExample:BaselineOfGToolkit class>>#withAllContainedProjects|label=#size}} distinct, yet combinable, components. The picture below provides an overview of these components and their interdependencies. The map is navigable. Click on each component to learn more about it.

{{gtExample:BaselineOfGToolkit class>>#itself|previewShow=#gtGtMapFor:|noCode=|previewHeight=420}}
## Learn
### Inspector
Learn about it in {{gtClass:BaselineOfGToolkitInspector}}.
### Playground
Learn about it in {{gtClass:BaselineOfGToolkitPlayground}}.
### Documenter
This very document is edited and rendered through {{gtClass:BaselineOfGToolkitDocumenter}}.
### Coder
Coder offers a set of components that allow us to manipulate code. More details at: {{gtClass:BaselineOfGToolkitCoder}}.
## Spotter
Spotter is the universal search interface. Learn more at: {{gtClass:BaselineOfGToolkitSpotter}}.
### Examples and example-driven development
Examples offer both a new way to organize the test code and a bridge between the testing effort and documentation.

The introductory example-driven development tutorial:
[examples-tutorial.pillar](fileLocator://gtResource/feenkcom/gtoolkit-examples/doc/tutorial/examples-tutorial.pillar)

The exemplifying software tutorial based on a case study of face recognition using the Azure Face API:
[esug-2018-exemplifying-software.pillar](fileLocator://gtResource/feenkcom/gtoolkit-demos/doc/tutorial/esug-2018/esug-2018-exemplifying-software.pillar)
### Visualizer
Visualizer is a set of visualization engines to ease the creation of custom visualizations directly in the environment. Learn more at {{gtClass:BaselineOfGToolkitVisualizer}}.
### Transcript
This is a reimagining of the classic transcript by taking advantage of the text rendering possibilities. Learn more at {{gtClass:BaselineOfGToolkitTranscript}}.
### Releaser
Releaser is the engine for releasing deeply nested projects spread over multiple repositories. We are using it to release Glamorous Toolkit with it. Learn more at {{gtClass:BaselineOfGToolkitReleaser}}.
## A few words about the graphical stack
The Glamorous Toolkit is based on the Sparta/Bloc/Brick graphical stack. This stack has a few properties that make it distinct:
- it relies on one rendering tree at all times.
- it features moldable and scalable text editor is made out of elements. This means that we can embed text with graphics to obtain live editors.
- graph layouts are regular layouts. The implication here is that any element can be part of a graph-based visualization.
- debuggable. There are a significant amount of tools and mechanisms that are built for this.

Learn more about it: {{gtClass:GtWhatMakesBlocSpecialExplanation}}
## And about XDoc
What is XDoc? Learn here: {{gtClass:BaselineOfXdoc}}


"
Class {
	#name : #BaselineOfGToolkit,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded',
		'PreLoaded'
	],
	#category : #BaselineOfGToolkit
}

{ #category : #baseline }
BaselineOfGToolkit >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		
		spec preLoadDoIt: #'preLoadGToolkit:'.
		spec postLoadDoIt: #'postLoadGToolkit:'.
		spec 
			baseline: 'GToolkitClipboard' with: [
				spec repository: 'github://feenkcom/gtoolkit-clipboard/src' ];
			baseline: 'GToolkitDocumenter' with: [
				spec repository: 'github://feenkcom/gtoolkit-documenter/src' ];
			baseline: 'GToolkitPresenter' with: [
				spec repository: 'github://feenkcom/gtoolkit-presenter/src' ];
			baseline: 'GToolkitTranscript' with: [
				spec repository: 'github://feenkcom/gtoolkit/src' ];
			baseline: 'GToolkitDebugger' with: [
				spec repository: 'github://feenkcom/gtoolkit-debugger/src' ];
			baseline: 'GToolkitFileBrowser' with: [
				spec repository: 'github://feenkcom/gtoolkit-filebrowser:main/src' ];
			baseline: 'GToolkitDemos' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos/src' ];
			baseline: 'GToolkitReleaser' with: [
				spec repository: 'github://feenkcom/gtoolkit-releaser/src' ];
			baseline: 'GToolkitConstrainer' with: [
				spec repository: 'github://feenkcom/gtoolkit-constrainer/src' ];
			baseline: 'GToolkit4Pharo' with: [
				spec repository: 'github://feenkcom/gt4pharo:main/src' ];
			baseline: 'GToolkit4SmaCC' with: [
				spec repository: 'github://feenkcom/gt4smacc/src' ];
			baseline: 'GToolkit4XMLSupport' with: [
				spec repository: 'github://feenkcom/gt4xmlsupport/src' ];				
			baseline: 'GToolkit4PetitParser2' with: [
				spec repository: 'github://feenkcom/gt4petitparser2/src' ];
			baseline: 'GToolkit4Famix3' with: [ 
				spec repository: 'github://feenkcom/gt4famix3/src' ];
			baseline: 'GToolkitRemote' with: [ 
				spec repository: 'github://feenkcom/gtoolkit-remote/src' ];
			baseline: 'GToolkit4Git' with: [ 
				spec repository: 'github://feenkcom/gt4git/src' ];
			baseline: 'GToolkit4Jenkins' with: [ 
				spec repository: 'github://feenkcom/gt4jenkins/src' ];
			baseline: 'Gt4PharoLink' with: [
				spec repository: 'github://feenkcom/gtoolkit-remote/src' ];
			baseline: 'GToolkitMorphic' with: [
				spec repository: 'github://feenkcom/gtoolkit/src' ];
			baseline: 'BlocExtensions' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'LepiterEngine' with: [
				spec repository: 'github://feenkcom/lepiter:main/src' ];
			baseline: 'GToolkitRobocoder' with: [
				spec repository: 'github://feenkcom/gtoolkit-robocoder:main/src'].
		spec package: 'GToolkit-Extensions' with: [ 
			spec requires: #( 'GToolkitDocumenter' ) ].
		spec package: 'GToolkit-Docs'.
		spec package: 'GToolkit-Monitor' with: [
			spec requires: #('GToolkitDocumenter') ].
		spec package: 'GToolkit-Profiler' with: [
			spec requires: #('GToolkitDocumenter') ].
		spec package: 'GToolkit-Constraints' with: [ 
			spec requires: #('GToolkitConstrainer' 'GToolkitDocumenter') ].
		spec package: 'GToolkit-Notifications' with: [ 
			spec requires: #('GToolkitDocumenter' 'GToolkitDebugger' ) ].
		spec package: 'GToolkit-SceneDriller'.
		spec package: 'GToolkit-World' with: [ 
			spec requires: #('GToolkit-Notifications' 'GToolkit-SceneDriller' 'GToolkitFileBrowser') ].
		spec package: 'GToolkit-Setup' with: [ 
			spec requires: #('GToolkitReleaser' 'GToolkitDocumenter' 'GToolkitDebugger') ].
		spec package: 'GToolkit-DependencyAnalyzer'.
	]
]

{ #category : #'post load' }
BaselineOfGToolkit >> fixCommandLineHandlerForPharo7 [
	BasicCommandLineHandler compile: ((BasicCommandLineHandler>>#gtHandleArgument:) sourceCode
		copyReplaceAll: 'gtHandleArgument: aString' with: 'handleArgument: aString').
	EvaluateCommandLineHandler compile: ((EvaluateCommandLineHandler>>#gtArgumentString) sourceCode
		copyReplaceAll: 'gtArgumentString' with: 'argumentString')
]

{ #category : #'post load' }
BaselineOfGToolkit >> fixCommandLineHandlerForPharo8 [
	EvaluateCommandLineHandler compile: ((EvaluateCommandLineHandler>>#gtArgumentString) sourceCode
		copyReplaceAll: 'gtArgumentString' with: 'argumentString')
]

{ #category : #'post load' }
BaselineOfGToolkit >> postLoadGToolkit: spec [
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].
	PostLoaded := true.
	
	SystemVersion current major = 7 ifTrue: [ 
		self fixCommandLineHandlerForPharo7 ].
	SystemVersion current major = 8 ifTrue: [ 
		self fixCommandLineHandlerForPharo8 ].
	
	(self class environment at: #GtNotificationBadgePublisher) beActivated.
	(self class environment at: #GtNotificationIcebergCredentialsProvider) beDefaultProvider.
	
	(self class environment at: #GtImage) setupLepiterIntegration.
]

{ #category : #'post load' }
BaselineOfGToolkit >> preLoadGToolkit: spec [

	(PreLoaded isNotNil and: [ PreLoaded ])
		ifTrue: [ ^ self ].
	PreLoaded := true.
	
	Author fullName: 'GlamorousAuthor'.
]
