Class {
	#name : #MiTreeMapVisualisationBrowserTest,
	#superclass : #MiAbstractBrowserTest,
	#category : #'MooseIDE-Tests-Browsers'
}

{ #category : #running }
MiTreeMapVisualisationBrowserTest >> browserClass [
	^ MiTreeMapVisualisationBrowser
]

{ #category : #tests }
MiTreeMapVisualisationBrowserTest >> testActivateActionButtons [

	browser actionButtons do: [ :button | self deny: button isEnabled ].

	browser receiveEntity: (FamixStClass named: 'TestClass').

	browser actionButtons do: [ :button | self assert: button isEnabled ]
]

{ #category : #tests }
MiTreeMapVisualisationBrowserTest >> testMiSelectedItem [

	| entityToSelect |
	self assert: browser miSelectedItem isNil.

	entityToSelect := FamixStClass named: 'TestClass'.
	browser receiveEntity: entityToSelect.

	self assert: browser miSelectedItem equals: entityToSelect
]
