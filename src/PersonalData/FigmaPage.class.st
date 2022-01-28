Class {
	#name : #FigmaPage,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#classInstVars : [
		'rawData'
	],
	#category : #PersonalData
}

{ #category : #accessing }
FigmaPage class >> from: p [

	rawData := p.
	^ self
]

{ #category : #accessing }
FigmaPage >> name [
	^ rawData at: #name
]
