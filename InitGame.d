import Item;
import Room;

Room[int] initGame() {
  Room[int] rooms;
  Item item;

  rooms[0] = new Room("A Small Patch of Grass",
  "You stand upon a small patch of grass surrounded by sand.  Behind you in the distance you can hear the gentle roll of waves and ahead emerges a lightly cobbled path.");
  rooms[0].setExits(2, 1, 3);

  rooms[1] = new Room("Along the Beach",
  "Sparkling sand is strewn along a curving beach.  The ocean stretches to the horizon, where small waves play and sea birds dance in the air.");
  rooms[1].setExits(0);
  item = new Item("bucket", "A small *bucket", "A small empty bucket, most likely used to collect things that fit inside small, empty buckets.", 1, true);
  item.scoreValue = 5;
  rooms[1].addItem(item);

  rooms[2] = new Room("An Iron Gate",
  "The path leads to a large iron gate set into a fence that looks to be either new or freshly painted.  Beyond the gate the path continues into greenery.");
  rooms[2].setExits(-1, 0);
  item = new Item("gate", "A large iron gate", "A large iron gate that looks very clean.", 2);
  item.enterable = true;
  item.enterLoc = 5;
  item.getable = false;
  rooms[2].addItem(item);

  rooms[3] = new Room("A Sandy Hill",
  "A small sandy hill rises from the sand, as sandy hills often do.  Beside the hill stands a wooden sign with tufts of grass growing around its base.");
  rooms[3].setExits(-1, -1, -1, 0);
  rooms[3].scoreRoom = true;
  item = new Item("sign", "A wooden sign", "Drop treasure items here and say score.\n* = treasure", 3);
  item.getable = false;
  item.readable = true;
  rooms[3].addItem(item);

  rooms[5] = new Room("Into the Park",
  "The path here curves ahead with tall leafy hedges forming walls on the sides.  Every now and then you can hear rustling within the hedges and small eyes seem to peek out between the leaves then quickly disappear back into the hedge before you can get a good look at them.");
  rooms[5].setExits(6, 2);
  item = new Item("leaf", "A small leaf", "A small oblong green leaf.", 5);
  rooms[5].addItem(item);

  rooms[6] = new Room("The Fountain",
  "A marble fountain stands here in the shape of two fish above a rimmed bowl.  Water sprays from the fish’s mouths, sunlight catching the mist and turning it into a prism.");
  rooms[6].setExits(-1, 5, 7, 8);

  rooms[7] = new Room("A Small Hut",
  "Before you is a small hut with a shingled roof and a little flower box set below a window.  Through the window you can make out some furniture, though the room appears to be dark.  Bits of twigs and debris litter the ground in front of the door.");
  rooms[7].setExits(-1, -1, -1, 6);
  item = new Item("door", "A door", "A door with hinges and a knob.", 7);
  item.enterable = true;
  item.enterLoc = 9;
  item.getable = false;
  rooms[7].addItem(item);
  item = new Item("twig", "A twig", "A twiggy twig made out of twig.", 7);
  rooms[7].addItem(item);

  rooms[8] = new Room("A Pond",
  "A little pond is here full of gold and silver fish darting beneath the surface of the water.  Occasionally a small insect lands on the surface of the pond only to be scooped up by one of the fish, sending out ripples as it enjoys its snack.");
  rooms[8].setExits(-1, -1, 6);

  rooms[9] = new Room("Inside the Hut",
  "The room is small with light coming in through the little front window.  A wooden table with a few chairs sit beside the window while in the other corner of the room is a bed with neatly folded sheets.  Beside the bed is a little table and beside that, a small bookshelf.");
  rooms[9].setExits(-1, -1, -1, 7);
  item = new Item("book", "A *book", "It's a story about a story that's in a book.", 9, true);
  item.readable = true;
  item.scoreValue = 15;
  rooms[9].addItem(item);

  return rooms;
}
