Class {
	#name : #MiFreezeCommand,
	#superclass : #MiReceivingModeCommand,
	#category : #'MooseIDE-Core-Command'
}

{ #category : #default }
MiFreezeCommand class >> defaultName [

	^ 'Freeze'
]

{ #category : #accessing }
MiFreezeCommand >> iconName [

	^ self iconNameForState: self context canFollow not
]

{ #category : #accessing }
MiFreezeCommand >> receivingMode [

	^ MiFreezeMode
]
