ulong getIndex(T)(T a, T[] b) {
  foreach (i, item; b) {
    if (a == item) {
      return i;
    }
  }

  return -1;
}

ulong[] findIn(T)(T[] a, T[] b) {
  ulong[] index;
  foreach (word; a) {
    foreach (i, item; b) {
      if (word == item) {
        index ~= i;
      }
    }
  }

  return index;
}
