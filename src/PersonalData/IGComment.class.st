"
Testing this. Where is this saved?
"
Class {
	#name : #IGComment,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #PersonalData
}

{ #category : #accessing }
IGComment >> date [
^ self timestampAsDateAndTime asDate.
]

{ #category : #accessing }
IGComment >> fullText [

	^ ((rawData at: #string_list_data) at: 1) at: #value
]

{ #category : #accessing }
IGComment >> gtRawDataFor: aView [

	<gtView>
	^ aView forward
		  title: 'Raw data';
		  object: [ rawData ];
		  view: #gtTreeFor:context:.
]

{ #category : #accessing }
IGComment >> rawData: json [ 
  rawData := json
]

{ #category : #accessing }
IGComment >> rawDataFor: aView [

	<gtView>
	^ aView forward
		  title: 'RawData';
		  object: [ rawData ];
		  view: #gtTreeFor:context:
]

{ #category : #accessing }
IGComment >> timestamp [
	^ ((rawData at: #string_list_data) at: 1) at: #timestamp.
]

{ #category : #accessing }
IGComment >> timestampAsDateAndTime [

	^ DateAndTime fromUnixTime: self timestamp
]

{ #category : #accessing }
IGComment >> username [

	^ rawData at: #title
]
