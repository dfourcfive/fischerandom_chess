import 'package:flutter_test/flutter_test.dart';

import 'package:fischerandom_chess/fischerandom_chess.dart' as frc;

void main() {
  frc.FischeRandomChess fischeRandomChess = frc.FischeRandomChess();
  frc.FischerRandomValidators validators = frc.FischerRandomValidators();

  frc.FischerRandomLookUp fischerRandomLookUp = frc.FischerRandomLookUp();
  frc.FischerRandomConverters fischerRandomConverters = frc.FischerRandomConverters();
  var random = fischerRandomLookUp.random();
  var randomID = fischerRandomLookUp.randomID();
  var decodeResult = fischerRandomLookUp.decode(randomID);
  var encodeResult = fischerRandomLookUp.encode(decodeResult);

  var result = fischerRandomConverters.toUnicode('BBQNNRKR');
  print(result);
}
