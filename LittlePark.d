import std.stdio;
import std.string;
import std.conv;

import Item;
import InitGame;
import Map;
import Player;
import Room;
import State;

enum AUTHOR = "Sir Nigel Cogs";
enum CONTACT = "@SirNigelCogs on Twitter and Github";
//enum MAX_SCORE = 200;
int MAX_SCORE;
enum STARTING_ROOM = 0;
enum VERSION = 0.6;

void main() {
  writeln("Welcome to Little Park v", VERSION);
  writeln("The amazing adventure about some things.");
  writeln("Little Park is a small game and technical demo based around");
  writeln("The simple TextExplore text adventure game engine.");
  writeln();
  writeln("Written by ", AUTHOR);
  writeln("Contact:  ", CONTACT);
  writeln();

  State state;

  Map map = new Map(STARTING_ROOM, InitGame.initGame());
  MAX_SCORE = map.calculateMaxScore();

  Room currentRoom = map.getCurrentRoom();

  string input;

  writeln(look(currentRoom));

  while(state.playing) {
    writeln();
    write(">");
    input = strip(readln());
    input = toUpper(input);
    writeln();

    string[] words = input.split();
    words = filterWords(words);

    parse(words, state, map);

    if (state.look) {
      write("\n\n\n\n\n");
      writeln(look(map.getCurrentRoom()));
      state.look = false;
    }
  }

}

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

  item = new Item("door", "A wooden door", "A door made of wood", 0);
  item.enterable = true;
  item.enterLoc = 1;
  rooms[0].addItem(item);

  rooms[1] = new Room("The Gate",
  "An old wrought-iron gate.");
  rooms[1].setExits(2, 0);
  item = new Item("book", "A *book", "A story about a nice book.", 1);
  item.readable = true;
  item.scoreValue = 10;
  item.treasure = true;
  rooms[1].addItem(item);

  rooms[2] = new Room("Within the Park",
  "Soft grass carpets the ground while trees spread their leaves in the distance.");
  rooms[2].setExits(-1, 1);

  return rooms;
}

string[] filterWords(string[] words) {
  string[] list;

  foreach (word; words) {
    if (word == "GRAB" || word == "TAKE") {
      list ~= "GET";
    }
    else if (word == "INV" || word == "INVENTORY") {
      list ~= "I";
    }
    else if (word == "NORTH") {
      list ~= "N";
    }
    else if (word == "LOOK") {
      list ~= "L";
    }
    else if (word == "GO" || word == "THE") {
      continue;
    }
    else {
      list ~= word;
    }
  }

  return list;
}

void getItem(string item, ref Map map) {
  Item[string] items = map.getCurrentRoom().getItems();

  if (items[item]) {
    writeln("Item found");
  }
  else {
    writeln("Item not found");
  }
}

string look(ref Room room) {
  string info;
  info = room.name ~ "\n" ~ room.desc;
  info ~= "\n\n";

  if (room.getItems().length) {
    info ~= "You also see here:\n";
    foreach (item; room.getItems()) {
      info ~= item.title ~ "\n";
    }
    info ~= "\n\n";
  }
  info ~= "Obvious exits:\n";

  int[char] exits = room.getExits();

  if (exits['N'] != -1) {
    info ~= "North ";
  }
  if (exits['S'] != -1) {
    info ~= "South ";
  }
  if (exits['E'] != -1) {
    info ~= "East ";
  }
  if (exits['W'] != -1) {
    info ~= "West";
  }

  info = strip(info);
  return info;
}

void parse(string[] words, ref State state, ref Map map) {
  switch(words.length) {
    case 0:
      writeln("What?");
      return;
      break;
    case 1:
      if (words[0] == "N" || words[0] == "S" || words[0] == "E" || words[0] == "W") {
        int d = map.getCurrentRoom().checkDirection(to!char(words[0]));
        if (d != -1) {
          map.player.loc = d;
          state.look = true;
        }
      }
      else if (words[0] == "I") {
        writeln("You are carying:");
        foreach (item; map.player.getInv()) {
          writeln(item.title);
        }
      }
      else if (words[0] == "L") {
        state.look = true;
      }
      else if (words[0] == "QUIT") {
        state.playing = false;
      }
      else if (words[0] == "SCORE") {
        if (map.getCurrentRoom().scoreRoom) {
          int score;
          foreach (item; map.getCurrentRoom().getItems()) {
            if (item.treasure) {
              score += item.scoreValue;
            }
          }
          map.player.score = score;
          writeln("Your score:\n", map.player.score, " / ", MAX_SCORE);
          if (score == MAX_SCORE) {
            writeln("Congratulations!  You won.");
          }
        }
      }
      else {
        goto default;
      }
      break;
    case 2:
      if (words[0] == "ENTER") {
        Item* item = words[1] in map.getCurrentRoom().getItems();
        if (item && item.enterable) {
          int loc = item.enterLoc;
          map.player.loc = loc;
          state.look = true;
        }
        else {
          writeln("You can't enter that");
        }
      }
      else if (words[0] == "EXAMINE") {
        Item* itemRoom = words[1] in map.getCurrentRoom().getItems();
        Item* itemPlayer = words[1] in map.player.getInv();
        if (itemRoom) {
          writeln(itemRoom.desc);
        }
        else if (itemPlayer) {
          writeln(itemPlayer.desc);
        }
        else {
          writeln("You don't see that here.");
        }
      }
      else if (words[0] == "DROP") {
        Item* item = words[1] in map.player.getInv();
        if (item) {
          map.getCurrentRoom().addItem(*item);
          map.player.getInv().remove(item.name);
          writeln("You drop it.");
        }
        else {
          writeln("You're not carrying that.");
        }
      }
      else if (words[0] == "GET") {
        Item[string] items = map.getCurrentRoom().getItems();
        Item* item = words[1] in items;
        if (item && item.getable) {
          map.player.addInv(*item);
          items.remove(item.name);
          writeln("You get it.");
        }
        else if (item && !item.getable) {
          writeln("It can't be lifted.");
        }
        else {
          writeln("You don't see that here.");
        }
      }
      else if (words[0] == "READ") {
        Item[string] items = map.getCurrentRoom().getItems();
        Item* item = words[1] in items;
        if (!item) {
          item = words[1] in map.player.getInv();
        }
        if (item && item.readable) {
          writeln("It says:\n", item.desc);
        }
        else if (item && !item.readable) {
          writeln("That can't be read.");
        }
        else {
          writeln("You don't see that here.");
        }
      }
      else {
        goto default;
      }
      break;
    default:
      writeln("What?");
      break;
  }

}
