import 'unicodes.dart';
import 'validators.dart';

dynamic toUnicode(arrangement, {int color = 0}) {
  if (!isValidArrangement(arrangement)) return false;
  //const type =  arrangement.runtimeType;
  List<String> converted = toUpperCase(arrangement).map((piece) => UNICODE[piece]![color == 1 ? 1 : 0]).toList();
  return converted;
}

dynamic toMirror(arrangement) {
  if (!isValidArrangement(arrangement)) return false;
  List<String> converted = [];
  if (arrangement is String) {
    converted = arrangement.runes.map((e) => String.fromCharCode(e).toString()).toList().reversed.toList();
  } else if (arrangement is List<String>) {
    converted = arrangement.reversed.toList();
  }
  return converted;
}

List<String> toUpperCase(dynamic arrangement) {
  //if (!isValidArrangement(arrangement)) return false;
  //String type =  arrangement.runtimeType.toString();
  List<String> converted = [];
  if (arrangement is String) {
    converted = arrangement.runes.map((e) => String.fromCharCode(e).toString().toUpperCase()).toList();
  } else {
    converted = converted.map((e) => e.toUpperCase()).toList();
  }
  return converted;
}
