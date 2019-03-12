import Item;
import Room;

Room[int] initGame() {
  Room[int] rooms;
  Item item;

  rooms[0] = new Room("A Path",
  "A dusty path wanders through a grassy field");
  rooms[0].setExits(1);
  item = new Item("sign", "A sign", "Drop treasure, say score.", 0);
  item.getable = false;
  item.readable = true;
  rooms[0].addItem(item);
  rooms[0].scoreRoom = true;

  rooms[1] = new Room("The Gate",
  "An old wrought-iron gate.");
  rooms[1].setExits(-1, 0);
  item = new Item("book", "A *book", "A story about a nice book.", 1);
  item.readable = true;
  item.scoreValue = 10;
  item.treasure = true;
  rooms[1].addItem(item);

  return rooms;
}
