import 'dart:math';

import 'package:fischerandom_chess/positions.dart';

import 'validators.dart';

class FischerRandomLookUp {
  static final FischerRandomLookUp _instance = FischerRandomLookUp._internal();
  FischerRandomLookUp._internal();
  factory FischerRandomLookUp() => _instance;

/**
 * Returns a random starting position for Fischer Random Chess / Chess960.
 *
 * see {link https://en.wikipedia.org/wiki/Fischer_Random_Chess_starting_position}
 *
 * returns  The starting position's arrangement of pieces
 */
  dynamic generate() {
    int id = ((Random().nextInt(960)));
    return POSITIONS[id];
  }

/**
 * Given an arrangement of pieces, returns the starting position's ID.
 *
 * see {link https://chess960frc.blogspot.com/2010/11/calculate-sp-numbers-in-your-head.html}
 *
 * param  arrangement A starting position's arrangement
 * returns  The starting position's ID, or `-1` if invalid arrangement
 */
  dynamic encode(arrangement) {
    if (!FischerRandomValidators().isValidArrangement(arrangement)) return -1;
    String arrngs = '';
    if (arrangement is List<String>) arrngs = arrangement.join('');
    if (arrangement is String) arrngs = arrangement;
    return POSITIONS.indexOf(arrngs);
  }

/**
 * Given an ID, returns the starting position's arrangement of pieces.
 *
 * see {@link https://en.wikipedia.org/wiki/Fischer_Random_Chess_numbering_scheme}
 *
 * param id An ID of a starting position
 * returns The starting position's arrangement, or `false` if
 * invalid ID
 */
  dynamic decode(id) {
    if (!FischerRandomValidators().isValidID(id)) return false;
    return POSITIONS[int.parse(id.toString())];
  }

/**
 * Picks a random starting position's ID.
 *
 * returns {number} The starting position's ID
 */
  int randomID() {
    return Random().nextInt(960);
  }

/**
 * Returns a random starting position, with its ID and arrangement.
 *
 * @returns {Object} An object with the starting position's ID and arrangement
 */
  Map<String, dynamic> random() {
    int id = randomID();
    dynamic arrangement = decode(id);
    return {"id": id, "arrangement": arrangement};
  }
}
