import 'package:fischerandom_chess/validators.dart';
import 'dart:math';

dynamic getPlace(piece, pos, List<String> arrangement) {
  String square = arrangement.where((e) => isStringInteger(e)).toList()[pos];
  arrangement[int.parse(square)] = piece;
  return arrangement;
}

List<int> divide(num a, num b) {
  return [(a / b).floor(), (a % b).floor()];
}

/**
 * Given an ID, returns the starting position's arrangement of pieces.
 *
 * see {link https://en.wikipedia.org/wiki/Fischer_Random_Chess_numbering_scheme}
 *
 * param id An ID of a starting position
 * returns The starting position's arrangement, or `false` if
 *    invalid ID
 */
dynamic decode(id) {
  if (!isValidID(id)) return false;

  var arrangement = ['0', '1', '2', '3', '4', '5', '6', '7'];

  // Directly place first bishop on the derived square
  var q2b1 = divide(id, 4);
  arrangement[q2b1[1] * 2 + 1] = 'B';

  // Directly place second bishop on the derived square
  var q3b2 = divide(q2b1[0], 4);
  arrangement[q3b2[1] * 2] = 'B';

  // Place queen and knights on the remaining free squares
  var q4q = divide(q3b2[0], 6);
  arrangement = getPlace('Q', q4q[1], arrangement);
  arrangement =
      getPlace('N', q4q[0] > 3 ? ((q4q[0] -= 3) > 3 ? ((q4q[0] -= 2) > 3 ? (q4q[0] = 3) : 2) : 1) : 0, arrangement); // Credit to ugoren for this
  arrangement = getPlace('N', q4q[0], arrangement); // q4 has been modified by the above ternary operators

  // Place king and rooks on the remaining free squares
  arrangement = getPlace('R', 0, arrangement);
  arrangement = getPlace('K', 0, arrangement);
  arrangement = getPlace('R', 0, arrangement);

  return arrangement;
}
