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

	| fullUrl json |
	fullUrl := self rootUrl , aUrl.
	json := ZnClient new get: fullUrl.
	^ STON fromString: json.
]

{ #category : #accessing }
APIDeveloper >> instanceSettings [
 ^ self get: '/development_settings'
]

{ #category : #accessing }
APIDeveloper >> rootUrl [

	^ rootUrl
]

{ #category : #accessing }
APIDeveloper >> rootUrl: aString [

	rootUrl := aString
]
