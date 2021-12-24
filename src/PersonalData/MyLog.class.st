Class {
	#name : #MyLog,
	#superclass : #Object,
	#instVars : [
		'stringContents',
		'entries'
	],
	#category : #PersonalData
}

{ #category : #accessing }
MyLog >> entries [
  ^ entries
]

{ #category : #accessing }
MyLog >> filePath: aString [ 
  stringContents := aString asFileReference contents.
  entries := self lines collect: [ :l | MyLogEntry fromString: l].
  ^ self.
]

{ #category : #accessing }
MyLog >> lastEntry [
  ^ stringContents split: 'a'
]

{ #category : #accessing }
MyLog >> lines [

	^ (stringContents lines) select: [ :st | st isNotEmpty ]
]

{ #category : #accessing }
MyLog >> stringContents [
  ^ stringContents
]
