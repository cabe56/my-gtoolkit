Class {
	#name : #MyLog,
	#superclass : #Object,
	#instVars : [
		'stringContents',
		'entries'
	],
	#category : #PersonalData
}

{ #category : #accessing }
MyLog >> entries [
  ^ entries
]

{ #category : #accessing }
MyLog >> entriesAsDictForTimeline [
	^ entries collect: [ :c | (c date) -> c note ]
	"^ { 
		  ((Date year: 2011 month: 08 day: 22) -> 'First GT inspector').
		  ((Date year: 2013 month: 12 day: 28) -> 'First GT debugger').
		  ((Date year: 2014 month: 02 day: 14) -> 'First GT playground').
		  ((Date year: 2014 month: 12 day: 07) -> 'First GT spotter').
		  ((Date year: 2015 month: 10 day: 02) -> 'feenk founding').
		  ((Date year: 2016 month: 09 day: 19) -> 'Moldable Tools thesis').
		  ((Date year: 2017 month: 08 day: 15)
		   -> 'New generation of Glamorous Toolkit starts').
		  ((Date year: 2018 month: 09 day: 10) -> 'First public demo').
		  ((Date year: 2019 month: 04 day: 19)
		   -> 'Glamorous Toolkit 0.6.42 alpha').
		  ((Date year: 2019 month: 07 day: 16)
		   -> 'First public Moldable Development talk').
		  ((Date year: 2020 month: 07 day: 23)
		   -> 'Glamorous Toolkit v0.7.1214 beta').
		  ((Date year: 2021 month: 06 day: 04) -> 'Lepiter') }"
]

{ #category : #accessing }
MyLog >> filePath: aString [ 
  stringContents := aString asFileReference contents.
  entries := self lines collect: [ :l | MyLogEntry fromString: l].
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
MyLog >> newMethod [
	"This is a new method"
]

{ #category : #accessing }
MyLog >> stringContents [
  ^ stringContents
]

{ #category : #accessing }
MyLog >> timelineElement [
	<gtExample>
	| plotter |
	plotter := GtPlotter new.
	plotter verticalTimeline
		withProjectionAxis;
		timelineData: #key;
		projectionData: #value;
		timelineFrom: 2011 asYear 
		to: (Date today + 1 year) asYear;
		with: self entriesAsDictForTimeline.
		^ plotter asElement
]
