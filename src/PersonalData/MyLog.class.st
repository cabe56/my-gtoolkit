Class {
	#name : #MyLog,
	#superclass : #Object,
	#instVars : [
		'stringContents'
	],
	#category : #PersonalData
}

{ #category : #accessing }
MyLog >> filePath: aString [ 
  stringContents := aString asFileReference contents.
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
