Class {
	#name : #FigmaFile,
	#superclass : #Object,
	#instVars : [
		'key',
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
  ^ self fetchComments.
	
]

{ #category : #accessing }
FigmaFile >> commentsArray [

	| commentArray sorted |
	commentArray := self fetchComments.
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
	^ (STON fromString: contents) at: #comments.
]

{ #category : #accessing }
FigmaFile >> gtViewForComments: aView [

	<gtView>
	^ aView
		  columnedList;
		  title: 'Comments';
		  priority: 10;
		  items: [ self comments ];
		  column: 'User' text: [ :r | r at: #username ];
		  column: 'Comment' text: [ :r | r at: #comment ].
]

{ #category : #accessing }
FigmaFile >> gtViewForPages: aView [

	<gtView>
	^ aView
		  columnedList;
		  title: 'Pages';
		  priority: 100;
		  items: [ self pages ];
		  column: 'Name' text: [ :p | p name ];
		  column: 'Elements' text: [ 1 ].
]

{ #category : #accessing }
FigmaFile >> key: fileKey [
  key := fileKey 
]

{ #category : #accessing }
FigmaFile >> newMethod [
	"This is a new method"
]

{ #category : #accessing }
FigmaFile >> pages [

	| client contents pages |
	client := ZnClient new.
	contents := client
		            headerAt: 'X-FIGMA-TOKEN' add: figmaToken;
		            get: 'https://api.figma.com/v1/files/' , key.
	pages := ((STON fromString: contents) at: #document) at: #children.
	^ pages collect: [:p | FigmaPage from: p].
]
