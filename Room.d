import std.stdio;

import Item;

class Room {
  private:

  string desc_;
  string name_;

  int[char] exits_;

  Item[string] items;

  bool scoreRoom_;

  public:

  this(string name_, string desc_) {
    this.name_ = name_;
    this.desc_ = desc_;
    scoreRoom_ = false;
  }

  void addItem(ref Item item) {
    items[item.name] = item;
  }

  int checkDirection(char c) const {
    return exits_[c];
  }

  string desc() @property const {
    return desc_;
  }

  int[char] exits() @property {
    return exits_;
  }

  int[char] getExits() {
    return exits_;
  }

  ref Item[string] getItems() {
    return items;
  }

  string name() @property const {
    return name_;
  }

  bool scoreRoom() @property const {
    return scoreRoom_;
  }

  void scoreRoom(bool s) @property {
    scoreRoom_ = s;
  }

  void setExits(in int n = -1, in int s = -1, in int e = -1, in int w = -1) {
    exits_['N'] = n;
    exits_['S'] = s;
    exits_['E'] = e;
    exits_['W'] = w;
  }
  /*void setExits(Exit[] e...) {
  }*/

}
