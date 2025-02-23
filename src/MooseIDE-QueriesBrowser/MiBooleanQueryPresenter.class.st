"
A query configuration presenter for the `FQBooleanQuery`
"
Class {
	#name : #MiBooleanQueryPresenter,
	#superclass : #MiPropertyQueryPresenter,
	#category : #'MooseIDE-QueriesBrowser-Configuration presenters'
}

{ #category : #actions }
MiBooleanQueryPresenter >> computeQuery: aProperty [

	self updateProperty: aProperty
]

{ #category : #'api - actions' }
MiBooleanQueryPresenter >> configureFor: aQuery [

	propertyDropList selectItem: aQuery property.
	query := aQuery
]

{ #category : #initialization }
MiBooleanQueryPresenter >> initializePresenters [

	super initializePresenters.

	propertyDropList isImpossibleQueryPresenter ifFalse: [ 
		propertyDropList whenSelectedItemChangedDo: [ :property | 
			self computeQueryAction: property ] ].
	self initializeLayout
]

{ #category : #initialization }
MiBooleanQueryPresenter >> newComparatorDropList [
	^ self newNullPresenter 
]

{ #category : #layout }
MiBooleanQueryPresenter >> newLayout [

	| padding |
	padding := 5.
	^ SpBoxLayout newLeftToRight
		  add: propertyDropList
		  expand: false
		  fill: true
		  padding: padding;
		  yourself
]

{ #category : #initialization }
MiBooleanQueryPresenter >> newValueInputField [

	"Boolean queries do not have a value to comapre to (only a comparator: #not or #yourself)"

	^ self newNullPresenter
]
