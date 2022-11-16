bool isValidID(id) {
  return (isInteger(id) && id >= 0 && id <= 959);
}

bool isInteger(num value) => (value % 1) == 0;
