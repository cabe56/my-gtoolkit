Class {
	#name : #MyLogEntry,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'firstWord'
	],
	#category : #PersonalData
}

{ #category : #'instance creation' }
MyLogEntry class >> fromString: aLine [ 
  |instance|
  instance := self new string: aLine.
  instance firstWord: instance note substrings first.
  ^ instance.
]

{ #category : #accessing }
MyLogEntry class >> validPersonNicknames [
  ^ #('JG' 'FE' 'RF' 'BG' 'JV' 'DA' 'KC' 'Nini')
]

{ #category : #accessing }
MyLogEntry >> date [
	| y m d splitDate |
	splitDate := (self dateAndTimeRawData splitOn: ',') first splitOn: '/'.
	y := splitDate at: 3.
	m := splitDate at: 2.
	d := splitDate at: 1.
	^ Date year: y month: m day: d.
]

{ #category : #accessing }
MyLogEntry >> dateAndTimeRawData [
  ^ (rawData regex: '\[.*\]' matchesCollect: [:r | r ]) first
]

{ #category : #accessing }
MyLogEntry >> firstWord: aString [

	firstWord := aString
]

{ #category : #accessing }
MyLogEntry >> newMethod [
	"This is a new method"
]

{ #category : #accessing }
MyLogEntry >> note [

	| splitd |
	splitd := rawData substrings: ']'.
	^ splitd size > 1 ifTrue: [splitd second] ifFalse: [splitd first].
]

{ #category : #accessing }
MyLogEntry >> personReferenced [

	| candidates |
	candidates := self note substrings select: [ :each | 
		              self class validPersonNicknames includes: each ].
	^ candidates size = 1
		  ifTrue: [ candidates first ]
		  ifFalse: [ UndefinedObject ]
]

{ #category : #accessing }
MyLogEntry >> rawData [
 ^ rawData
]

{ #category : #accessing }
MyLogEntry >> string: aLine [ 
  rawData := aLine
]
