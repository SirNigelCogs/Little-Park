import Player;
import Room;

class Map {
  private:

  Player player_;
  Room[int] rooms_;

  public:

  this(int loc, Room[int] rooms) {
    player_ = new Player(loc);
    this.rooms_ = rooms;
  }

  ref Room getCurrentRoom() {
    return rooms_[player_.loc];
  }

  ref Player getPlayerRef() {
    return player_;
  }

  ref Player player() @property {
    return player_;
  }

}
