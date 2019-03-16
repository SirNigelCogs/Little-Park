enum WORD_WRAP_LENGTH = 60;

string wrap(string s) {
  string line;
  int count = 0;

  foreach (letter; s) {
    if (count < WORD_WRAP_LENGTH) {
      line ~= letter;
      ++count;
    }
    else if (letter == ' ') {
      line ~= "\n";
      count = 0;
    }
    else {
      line ~= letter;
    }
  }

  return line;
}
