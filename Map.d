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

  int calculateMaxScore() {
    int score;
    foreach (room; rooms_) {
      foreach (item; room.getItems()) {
        score += item.scoreValue;
      }
    }
    return score;
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
