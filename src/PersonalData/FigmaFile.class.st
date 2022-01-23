Class {
	#name : #FigmaFile,
	#superclass : #Object,
	#instVars : [
		'key',
		'comments',
		'figmaToken'
	],
	#category : #PersonalData
}

{ #category : #accessing }
FigmaFile >> apiToken: token [
	figmaToken := token
]

{ #category : #accessing }
FigmaFile >> comments [
  comments ifNil: [ self fetchComments ].
  ^ comments.
	
]

{ #category : #accessing }
FigmaFile >> fetchComments [

	| client |
	client := ZnClient new.
	client headerAt: 'X-FIGMA-TOKEN' add: figmaToken.
	comments := STON fromString: client get: 'https://api.figma.com/v1/files/',key,'/comments'.
]

{ #category : #accessing }
FigmaFile >> gtViewFor: aView [

	<gtView>
	^ aView
		  columnedList;
		  title: 'Comments';
		  items: [ self comments ]
		  column: 'User' text: [ :r | r username ]
		  column: 'Comment' text: [ :r | r comment ]
]

{ #category : #accessing }
FigmaFile >> key: fileKey [
  key := fileKey 
]
