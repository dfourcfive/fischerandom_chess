bool isValidID(id) {
  return (isInteger(id) && id >= 0 && id <= 959);
}

bool isInteger(num value) => (value % 1) == 0;
bool isStringInteger(String value) {
  try {
    int.tryParse(value);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

int countPiece(String piece, String arrngs) {
  return (RegExp(piece).allMatches(arrngs).toList().length);
}

bool isValidArrangement(dynamic arrangement) {
  String arrngs = "";
  if (arrangement is String) {
    arrngs = arrangement;
  }
  if (arrangement.length != 8) return false;

  if (arrangement is List<String>) {
    arrngs = arrangement.join('').toUpperCase();
  }

  // Check the presence of all pieces
  if (countPiece('K', arrngs) != 1 ||
      countPiece('Q', arrngs) != 1 ||
      countPiece('R', arrngs) != 2 ||
      countPiece('B', arrngs) != 2 ||
      countPiece('N', arrngs) != 2) {
    return false;
  }

  // Check the positions of bishops (on different colored squares)
  int b1 = arrngs.indexOf('B');
  int b2 = arrngs.lastIndexOf('B');
  if (!((b2 - b1) % 2 != 0)) return false;

  // Check the positions of rooks (one on each side of the king)
  int k = arrngs.indexOf('K');
  int r1 = arrngs.indexOf('R');
  if (r1 > k) return false;

  return true;
}
