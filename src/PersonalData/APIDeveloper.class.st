Class {
	#name : #APIDeveloper,
	#superclass : #Object,
	#instVars : [
		'rootUrl'
	],
	#category : #PersonalData
}

{ #category : #accessing }
APIDeveloper >> get: aUrl [

	| fullUrl json client |
	fullUrl := self rootUrl , aUrl.
	client := ZnClient new.
	client timeout: 200.
	json := client get: fullUrl.
	^ STON fromString: json.
]

{ #category : #accessing }
APIDeveloper >> instanceSettings [
 ^ self get: '/settings'
]

{ #category : #accessing }
APIDeveloper >> rootUrl [

	^ rootUrl
]

{ #category : #accessing }
APIDeveloper >> rootUrl: aString [

	rootUrl := aString
]
