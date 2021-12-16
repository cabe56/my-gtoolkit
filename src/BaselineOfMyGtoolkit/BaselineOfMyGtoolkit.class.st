Class {
	#name : #BaselineOfMyGtoolkit,
	#superclass : #Object,
	#category : #BaselineOfMyGtoolkit
}

{ #category : #accessing }
BaselineOfMyGtoolkit >> baseline: spec [

	<baseline>
	^ spec for: #common do: [ spec package: 'PersonalData' ].
]
