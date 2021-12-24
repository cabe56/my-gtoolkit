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
SolanaBlock >> gtTransactions: aView [
  <gtView>
  ^ aView columnedList
  	title: 'Transactions';
  	items: [ (self rawData at: #transactions)];
  	column: 'Status' text: [ :t | ((t at: #meta) at: #status) keys first];
  	column: 'Fee' text: [ :t | (t at: #meta) at: #fee];
  	column: 'Raw Data' text: [ :t | t ]
]

{ #category : #accessing }
SolanaBlock >> gtTreeViewFor: aView [

	<gtView>
	^ aView forward
		  title: 'Tree';
		  priority: 1;
		  object: [ self prettyData];
		  view: #gtTreeFor:context:
	
]

{ #category : #accessing }
SolanaBlock >> newMethod [
	"This is a new method"
]

{ #category : #accessing }
SolanaBlock >> prettyData [
    newData := rawData copy.
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
