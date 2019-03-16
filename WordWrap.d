struct Wrap {
  private:

  int position;

  public:

  this(in int position) {
    this.position = position;
  }

  string wrap(string s) {
    string line;
    int count = 0;

    foreach (letter; s) {
      if (count < position) {
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
}
