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
FigmaFile >> commentsArray [

	| commentArray sorted |
	commentArray := comments.
	sorted := commentArray sorted: [ :a :b | 
		          (a at: #created_at) < (b at: #created_at) ].
	^ sorted collect: [ :c | 
		  (c at: #created_at) , ' - ' , ((c at: #user) at: #handle) , ' - '
		  , (c at: #message) ]
]

{ #category : #accessing }
FigmaFile >> fetchComments [

	| client contents |
	client := ZnClient new.
	contents :=  client headerAt: 'X-FIGMA-TOKEN' add: figmaToken;
		get: 'https://api.figma.com/v1/files/',key,'/comments'.
	comments := (STON fromString: contents) at: #comments.
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
