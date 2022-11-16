import 'package:fischerandom_chess/validators.dart';
import 'dart:math';

/**
 * Lookup table of KRN sequences, used by `encode()`.
 *
 * const [] of String */

const KRN_TABLE = ['NNRKR', 'NRNKR', 'NRKNR', 'NRKRN', 'RNNKR', 'RNKNR', 'RNKRN', 'RKNNR', 'RKNRN', 'RKRNN'];

/**
 * Lookup table of bishop placements, used by `encode()`.
 *
 * Built by concatenating the indexes of the two bishops (not by addition).
 *
 * const [] of String
 */
const BISHOP_TABLE = [1, 3, 5, 7, 12, 23, 25, 27, 14, 34, 45, 47, 16, 36, 56, 67];

class FischeRandomChess {
  dynamic getPlace(piece, pos, List<String> arrangement) {
    String square = arrangement.where((e) => FischerRandomValidators().isStringInteger(e)).toList()[pos];
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
    if (!FischerRandomValidators().isValidID(id)) return false;

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

/**
 * Given an arrangement of pieces, returns the starting position's ID.
 *
 * @see {@link https://chess960frc.blogspot.com/2010/11/calculate-sp-numbers-in-your-head.html}
 *
 * @param {string[]|string} arrangement A starting position's arrangement
 * @returns {number} The starting position's ID, or `-1` if invalid arrangement
 */
  dynamic encode(arrangement) {
    if (!FischerRandomValidators().isValidArrangement(arrangement)) return -1;
    List<String> arrng = [];
    if (arrangement is String) {
      arrng = arrangement.runes.map((e) => String.fromCharCode(e).toString()).toList();
    } else {
      arrng = arrangement;
    }

    int id = 0;

    // Add value for the sequence of K, R, N
    String sequence = arrng.where((piece) => 'KRN'.contains(piece)).join('');
    id += KRN_TABLE.indexOf(sequence) * 96;

    // Add value for the position of the queen within K, R, N, Q
    id += ((arrng.where((piece) => 'KRNQ'.contains(piece)).toList().indexOf('Q')) * 16).toInt();

    // Add value for the combined positions of the bishops
    int firstB = arrng.indexOf('B');
    int secondB = arrng.lastIndexOf('B');
    id += BISHOP_TABLE.indexOf(firstB + secondB);

    return (id < 0 ? -1 : id);
  }
}
