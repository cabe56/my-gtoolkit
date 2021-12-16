Class {
	#name : #BaselineOfMyGtoolkit,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyGtoolkit
}

{ #category : #accessing }
BaselineOfMyGtoolkit >> baseline: spec [

	<baseline>
	^ spec for: #common do: [ spec package: 'PersonalData' ].
]
