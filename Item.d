import std.string;

class Item {

  private:

  string desc_;
  string name_;
  string title_;

  int enterLoc_;
  int loc_;
  int scoreValue_;

  bool enterable_;
  bool getable_;
  bool readable_;
  bool treasure_;
  bool visible_;

  public:

  this(in string name_, in string title_, in string desc_, in int loc_, in bool treasure_ = false) {
    this.name_ = toUpper(name_);
    this.title_ = title_;
    this.desc_ = desc_;
    this.loc_ = loc_;
    this.treasure_ = treasure_;
    this.enterable = false;
    this.getable = true;
    this.visible_ = true;
  }

  string desc() @property const {
    return desc_;
  }

  string name() @property const {
    return name_;
  }

  string title() @property const {
    return title_;
  }

  bool enterable() @property const {
    return enterable_;
  }

  void enterable(bool e) @property {
    enterable_ = e;
  }

  int enterLoc() @property const {
    return enterLoc_;
  }

  void enterLoc(int e) @property {
    enterLoc_ = e;
  }

  bool getable() @property const {
    return getable_;
  }

  void getable(bool g) @property {
    getable_ = g;
  }

  bool readable() @property const {
    return readable_;
  }

  void readable(bool r) @property {
    readable_ = r;
  }

  int scoreValue() @property const {
    return scoreValue_;
  }

  void scoreValue(int s) @property {
    scoreValue_ = s;
  }

  bool treasure() @property const {
    return treasure_;
  }

  void treasure(bool t) @property {
    treasure_ = t;
  }

  bool visible() @property const {
    return visible_;
  }

  void visible(bool v) @property {
    visible_ = v;
  }

}
