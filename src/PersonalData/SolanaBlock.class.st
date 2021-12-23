Class {
	#name : #SolanaBlock,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'newData'
	],
	#category : #PersonalData
}

{ #category : #accessing }
SolanaBlock >> getTreeViewFor: aView [

	<gtView>
	^ aView forward
		  title: 'Tree';
		  priority: 51;
		  object: [ self prettyData];
		  view: #gtTreeFor:context:
	
]

{ #category : #accessing }
SolanaBlock >> newMethod [
	"This is a new method"
]

{ #category : #accessing }
SolanaBlock >> prettyData [
    newData := rawData.
    newData at: #blockTime put: (self time).
    ^ newData
]

{ #category : #accessing }
SolanaBlock >> rawData [
 ^ rawData
]

{ #category : #accessing }
SolanaBlock >> rawData: aDict [
  rawData :=  aDict
]

{ #category : #accessing }
SolanaBlock >> time [
	^ DateAndTime fromUnixTime: (self rawData at: #blockTime)
]
