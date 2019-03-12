import Item;

class Player {

  private:

  Item[string] inv_;

  int loc_;
  int score_;

  public:

  this(in int loc_ = 0) {
    this.loc_ = loc_;
    score_ = 0;
  }

  void addInv(ref Item item) {
    inv_[item.name] = item;
  }

  ref Item[string] getInv() {
    return inv_;
  }

  int loc() @property const {
    return loc_;
  }

  void loc(in int loc_) @property {
    this.loc_ = loc_;
  }

  int score() @property const {
    return score_;
  }

  void score(in int score_) @property {
    this.score_ = score_;
  }
}
