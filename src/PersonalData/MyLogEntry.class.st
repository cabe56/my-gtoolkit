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
  ^ instance.
]

{ #category : #accessing }
MyLogEntry class >> validPersonNicknames [
  ^ #('JG' 'FE' 'RF' 'BG' 'JV' 'DA' 'KC' 'Nini')
]

{ #category : #accessing }
MyLogEntry >> dateAndTimeRawData [
  ^ (rawData regex: '\[.*\]' matchesCollect: [:r | r ]) first
]

{ #category : #accessing }
MyLogEntry >> note [

	| splitd |
	splitd := rawData substrings: ']'.
	^ splitd second
]

{ #category : #accessing }
MyLogEntry >> personReferenced [

	^ self note substrings first
]

{ #category : #accessing }
MyLogEntry >> rawData [
 ^ rawData
]

{ #category : #accessing }
MyLogEntry >> string: aLine [ 
  rawData := aLine
]
