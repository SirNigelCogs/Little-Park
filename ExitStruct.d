struct Exit {
  static enum {N, S, E, W}
  /*static immutable N = 0;
  static immutable S = 1;
  static immutable E = 2;
  static immutable W = 3;*/

  int dir;
  int loc;

  this(int dir, int loc) {
    this.dir = dir;
    this.loc = loc;
  }
}
