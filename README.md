# fischerandom_chess

A Fischer Random Chess / Chess960 dart/flutter library.

## Description
[Fischer random](https://en.wikipedia.org/wiki/Fischer_random_chess) chess, also known as Chess960 is a variation of the game of chess invented by the former world chess champion Bobby Fischer
The idea of Fischer Random is to randomize the starting position of the pieces, so that openings may not be memorized.

“I love chess, and I didn’t invent Fischer random chess to destroy chess. I invented Fischer Random Chess to keep chess going”. – Bobby Fischer

## Installation

link to pub.dev:
https://pub.dev/packages/fischerandom_chess

Run this command:
With Flutter:

```bash
 $ flutter pub add fischerandom_chess
```
This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```bash
dependencies:
  fischerandom_chess: ^latest_version
```


## Getting started

import the fischerandom_chess class 

```dart
import 'package:fischerandom_chess/fischerandom_chess.dart' 
```


## Usage

- Generates a random starting position, returning its ID and arrangement of pieces.

```dart
FischerRandomLookUp fischerRandomLookUp = FischerRandomLookUp();
Map<String, dynamic> random = fischerRandomLookUp.random();
```

- Picks a random starting position's ID.

```dart
FischerRandomLookUp fischerRandomLookUp = FischerRandomLookUp();
Map<String, dynamic> random = fischerRandomLookUp.randomID();
```

- Get the starting position's arrangement of pieces by a given ID

```dart
FischerRandomLookUp randomLookUp = FischerRandomLookUp();
ind id=10; //example
var result = randomLookUp.decode(id);
if(result==false){
 //not a valid id
}else if(result is List<String>){
 print(result);
}
```

- Get the starting position's arrangement of pieces by a given ID

```dart
FischerRandomLookUp randomLookUp = FischerRandomLookUp();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result = randomLookUp.encode(arrangments);
if(result==false){
 //not a valid id
}else if(result is int){
 print(result);
}
```
## Converters
- toUniCode() :
```dart
FischerRandomConverters fischerRandomConverters = FischerRandomConverters();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result = fischerRandomConverters.toUnicode(arrangments);
if(result==false){
 //not a valid id
}else{
 print(result);  //output : [♗, ♗, ♕, ♘, ♘, ♖, ♔, ♖]

}
```

- toMirror() :
```dart
FischerRandomConverters fischerRandomConverters = FischerRandomConverters();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result = fischerRandomConverters.toMirror(arrangments);
if(result==false){
 //not a valid id
}else if(result is String){
 print(result);  //output : 'RKRNQBBN'
}
```

- toUpperCase() :
```dart
FischerRandomConverters fischerRandomConverters = FischerRandomConverters();
String arrangments = 'nbbqnrkr'; // or ['n','b','b','q','n','r','k','r']
var result = fischerRandomConverters.toUpperCase(arrangments);
if(result==false){
 //not a valid id
}else if(result is String){
 print(result);  //output : 'NBBQNRKR'
}
```


- toLowerCase() :
```dart
FischerRandomConverters fischerRandomConverters = FischerRandomConverters();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result = fischerRandomConverters.toLowerCase(arrangments);
if(result==false){
 //not a valid id
}else if(result is String){
 print(result);  //output : 'nbbqnrkr'
}
```

- toArray() :

```dart
FischerRandomConverters fischerRandomConverters = FischerRandomConverters();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result = fischerRandomConverters.toArray(arrangments);
if(result==false){
 //not a valid id
}else if(result is List<String>){
 print(result);  //output : ['N','B','B','Q','N','R','K','R']
}
```

## Validators
- Validates an arrangement of pieces :

```dart
FischerRandomValidators validators = FischerRandomValidators();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result = validators.isValidArrangement(arrangments);
print(result); // return true if its valid , false if its not
```

## Additional information

All contributions are welcome
