# fischerandom_chess

A Fischer Random Chess / Chess960 dart/flutter library.

link to pub.dev:
https://pub.dev/packages/fischerandom_chess

## Installation

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
FischeRandomChess fischeRandomChess = FischeRandomChess();
ind id=10; //example
var result = fischerRandomLookUp.decode(id);
if(result==false){
 //not a valid id
}else if(result is List<String>){
 print(result);
}
```

- Get the starting position's arrangement of pieces by a given ID

```dart
FischeRandomChess fischeRandomChess = FischeRandomChess();
String arrangments = 'NBBQNRKR'; // or ['N','B','B','Q','N','R','K','R']
var result random = fischerRandomLookUp.encode(arrangments);
if(result==false){
 //not a valid id
}else if(result is int){
 print(result);
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
