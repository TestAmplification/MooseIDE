Class {
	#name : #MiMooseModelBrowserTests,
	#superclass : #MiAbstractBrowserTest,
	#instVars : [
		'savedRoot'
	],
	#category : #'MooseIDE-Tests-Browsers'
}

{ #category : #accessing }
MiMooseModelBrowserTests class >> defaultTimeLimit [
	self
		flag:
			'This should be removed when opening Moose Model Browser will be faster'.
	^ 1 minute
]

{ #category : #running }
MiMooseModelBrowserTests >> browserClass [
	^ MiMooseModelBrowser
]

{ #category : #running }
MiMooseModelBrowserTests >> setUp [
	super setUp.
	savedRoot := MooseModelRoot installedRoot.
	MooseModelRoot resetRoot.
	
]

{ #category : #running }
MiMooseModelBrowserTests >> tearDown [

	MooseModelRoot installRoot: savedRoot.
	super tearDown
]

{ #category : #tests }
MiMooseModelBrowserTests >> testActivateActionButtons [

	| newModel |
	browser actionButtons do: [ :button | self deny: button isEnabled ].

	newModel := FamixStModel new.
	newModel addAll: { 
			(FamixStClass named: 'Class1').
			(FamixStClass named: 'Class2') }.
	MooseModel root add: newModel.
	browser receiveEntity: newModel.
	browser actionButtons do: [ :button | self deny: button isEnabled ].

	browser modelPresenter clickAtPath: #( 1 ).
	browser actionButtons do: [ :button | self assert: button isEnabled ].

	browser modelPresenter clickAtPath: #( 1 1 ).
	browser actionButtons do: [ :button | self assert: button isEnabled ]
]

{ #category : #tests }
MiMooseModelBrowserTests >> testMiSelectedItem [

	| newModel |
	self assert: browser miSelectedItem isNil.

	newModel := FamixStModel new.
	newModel addAll: { 
			(FamixStClass named: 'Class1').
			(FamixStClass named: 'Class2') }.
	MooseModel root add: newModel.
	browser followEntity: newModel.
	self assert: browser miSelectedItem isNil.

	browser modelPresenter clickAtPath: #( 1 ).
	self
		assertCollection: browser miSelectedItem
		hasSameElements: newModel allModelClasses.

	browser modelPresenter clickAtPath: #( 1 1 ).
	self
		assert: browser miSelectedItem
		equals: (newModel allModelClasses sorted: #name ascending) first
]
