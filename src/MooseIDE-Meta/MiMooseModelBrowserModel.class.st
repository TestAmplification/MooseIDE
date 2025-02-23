Class {
	#name : #MiMooseModelBrowserModel,
	#superclass : #Object,
	#instVars : [
		'selected',
		'model'
	],
	#category : #'MooseIDE-Meta-MooseModelBrowser'
}

{ #category : #accessing }
MiMooseModelBrowserModel class >> model: aMooseModel [
	^ self new
		model: aMooseModel;
		yourself
]

{ #category : #accessing }
MiMooseModelBrowserModel >> model [
	^ model
]

{ #category : #accessing }
MiMooseModelBrowserModel >> model: aMooseModel [
	model := aMooseModel
]

{ #category : #accessing }
MiMooseModelBrowserModel >> selected [
	^ selected
]

{ #category : #accessing }
MiMooseModelBrowserModel >> selected: anObject [
	selected := anObject
]
