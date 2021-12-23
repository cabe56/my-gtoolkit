Class {
	#name : #Solana,
	#superclass : #Object,
	#instVars : [
		'baseUrl'
	],
	#category : #PersonalData
}

{ #category : #accessing }
Solana >> buildMethod: methodName [

	^ ZnEntity
		  new;
		  json: '{"jsonrpc":"2.0", "id":1, "method":"' , methodName , '", "params":[
      {
        "commitment":"processed"
      }
    ]}'
]

{ #category : #accessing }
Solana >> buildMethod: methodName withParam: aString [ 
^ ZnEntity
		           new;
		           json:
			           '{"jsonrpc":"2.0", "id":1, "method":"',methodName,'", "params":["'
			           , aString , '"]}'
]

{ #category : #accessing }
Solana >> getAccountInfo: rfWallet [
| request json |
	request := self buildMethod:'getAccountInfo' withParam: rfWallet.
json := self post: request.
  ^ json at: #result
]

{ #category : #accessing }
Solana >> getBalance: publicKey [

	| request json |
	request := self buildMethod: 'getBalance' withParam: publicKey.
	json := self post: request.
	^ ((json at: #result) at: #value ) / 1000000000.00
]

{ #category : #accessing }
Solana >> getBlock: slot [

	| req res block |
	req := ZnEntity
		       new;
		       json:
			       '{"jsonrpc":"2.0", "id":1, "method":"getBlock", "params":['
			       , slot asString , ']}'.
	res := self post: req.
	block := SolanaBlock new rawData: (res at: #result).
	^ block
]

{ #category : #accessing }
Solana >> getLatestBlock [

	| slot |
	slot := self getRecentSlot.
	^ self getBlock: slot
]

{ #category : #accessing }
Solana >> getLatestBlockHash [

	| request |
	request := self buildMethod: 'getLatestBlockhash'.
	^ self post: request
]

{ #category : #accessing }
Solana >> getRecentSlot [
| req res |
	req := self buildMethod: 'getRecentBlockhash'.
res := self post: req.
^((res at: #result) at: #context) at: #slot
]

{ #category : #accessing }
Solana >> getTokenAccountBalance: publicKey [

	| request json |
	request := self buildMethod: 'getTokenAccountBalance' withParam: publicKey.
	json:= self post: request.
	^ json.
]

{ #category : #accessing }
Solana >> post: request [

	| json |
	json := ZnClient new
		        url: 'https://api.mainnet-beta.solana.com';
		        entity: request;
		        post.
	^ STON fromString: json
]
