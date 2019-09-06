Extension { #name : #NeoCSVReader }

{ #category : #'*Neo-CSV-Magritte' }
NeoCSVReader >> addFieldDescribedByMagritte: aDescription [ 

	| converter |
	converter := aDescription 
		propertyAt: #csvReader
		ifPresent: [ :c | [ :trimmed | c value: trimmed ] ].
				
	self 
		addField: [ :obj :value | aDescription accessor write: value to: obj ] 
		converter: [ :s | 
			s trimmed
				ifNotEmpty: converter
				ifEmpty: [ aDescription default ] ] 
]