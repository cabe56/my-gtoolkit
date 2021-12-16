Class {
	#name : #MyIGFeed,
	#superclass : #Object,
	#instVars : [
		'comments'
	],
	#category : #PersonalData
}

{ #category : #accessing }
MyIGFeed >> comments: json [ 
  comments := (json at: #comments_media_comments) collect: [:c | IGComment new rawData: c].
]

{ #category : #accessing }
MyIGFeed >> commentsAsText [

	^ self comments collect: [ :c | c fullText ]
]

{ #category : #accessing }
MyIGFeed >> gtCommentsView: aView [
	<gtView>
	^ aView columnedList
		  title: 'Comments';
		  items: [ comments ];
		  column: 'Username' text: [ :c | c username ];
		  column: 'Text' text: [ :c | c fullText ];
		  column: 'Date' text: [ :c | c date ];
		  priority: 1
]

{ #category : #accessing }
MyIGFeed >> rawDataFor: aView [

	<gtView>
	^ aView list
		  title: 'Raw data';
		  items: [ comments collect: [ :c | c fullText] ]
]
